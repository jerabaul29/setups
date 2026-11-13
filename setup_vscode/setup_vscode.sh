#!/bin/bash

# Make the VS Code Copilot agent terminal use a minimal prompt, so that shell integration can detect
# when commands finish; normal VS Code terminals are not affected, only the dedicated profile below
# sets COPILOT_TERM=1.

set -o errexit
set -o pipefail
set -o nounset

VSCODE_SETTINGS="${VSCODE_SETTINGS:-$HOME/.config/Code/User/settings.json}"
BASHRC="${BASHRC:-$HOME/.bashrc}"
MARKER="# VSCODE_COPILOT_TERM_GUARD"

mkdir -p "$(dirname "$VSCODE_SETTINGS")"
if [[ ! -f "$VSCODE_SETTINGS" ]]; then
    echo "{}" > "$VSCODE_SETTINGS"
fi
[[ -f "${VSCODE_SETTINGS}.bak" ]] || cp "$VSCODE_SETTINGS" "${VSCODE_SETTINGS}.bak"

# merge into settings.json; aborts without writing if the file is not plain JSON (e.g. has comments)
python3 - "$VSCODE_SETTINGS" <<'EOF'
import json, sys

path = sys.argv[1]
with open(path, "r", encoding="utf-8") as f:
    content = f.read()
try:
    data = json.loads(content) if content.strip() else {}
except json.JSONDecodeError as e:
    sys.exit(f"ERROR: {path} is not plain JSON ({e}); add the settings manually, see setup_vscode.sh")

profile = {"path": "/bin/bash", "env": {"COPILOT_TERM": "1"}}
data.setdefault("terminal.integrated.profiles.linux", {})["copilot-bash"] = profile
# which of these is honored by the Copilot terminal tool depends on the VS Code version, set both
data["chat.tools.terminal.terminalProfile.linux"] = profile
data["terminal.integrated.automationProfile.linux"] = profile

with open(path, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=4)
    f.write("\n")
EOF

touch "$BASHRC"
if ! grep -q "$MARKER" "$BASHRC"; then
    cat >> "$BASHRC" <<'EOF'

# VSCODE_COPILOT_TERM_GUARD
# minimal prompt for the VS Code Copilot agent terminal only
if [[ "${COPILOT_TERM:-}" == "1" ]]; then
    unset PROMPT_COMMAND
    PS1='\$ '
fi
EOF
fi

echo "Done. Reload VS Code, then ask Copilot to run: echo \"[\$COPILOT_TERM]\" (expect [1])."
