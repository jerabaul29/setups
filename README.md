# Setups

My standard setups on my machine. Typically used on fresh Ubuntu installs. Assumes that it will be run non-interactive, with an empty sudo password, at the early stage of machine setup.

The main work script `main_setup.sh` assumes that this repository is cloned in `$HOME/Desktop/Git/setups`, for example clone and install as:

```bash
mkdir -p "$HOME/Desktop/Git"
cd "$HOME/Desktop/Git"
git clone https://github.com/jerabaul29/setups.git
cd setups
bash main_setup.sh
```

The helper `main.sh` script should work from any location and calls `main_setup.sh`.

In order to support using secrets to perform the installation, the `generate_blob.sh` file can be used to turn the content of the `generate_blob/` folder into a gzipped gpg-symmetric-encrypted file that gets added to `setup_encrypted_blob`, see the dummy example there for explanation. Once the installation above has been executed, the encrypted blob can be decrypted and the entry script run using the system-installed terminal command `> setup_encrypted_blob.sh`. By gpg-encrypting the blob with a symmetric key, the encrypted `.zip.gpg` file can be uploaded on a location where it is openly available even though the decrypted content contains secrets. Make sure to not commit or make openly available any intermediate secret!
