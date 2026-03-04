#!/bin/bash

PWD_START="$(pwd)"

PATH_TO_BLOB="$HOME/Desktop/Git/setups/setup_encrypted_blob"
BLOB_BASENAME="blob"
ENTRY_POINT_BLOB="main.sh"

rm -rf "${PATH_TO_BLOB}/${BLOB_BASENAME}.zip"
rm -rf "${PATH_TO_BLOB}/extracted"

gpg --output "${PATH_TO_BLOB}/${BLOB_BASENAME}.zip" --decrypt "${PATH_TO_BLOB}/${BLOB_BASENAME}.zip.gpg"
unzip "${PATH_TO_BLOB}/${BLOB_BASENAME}.zip" -d "${PATH_TO_BLOB}/extracted/"

cd "${PATH_TO_BLOB}/extracted/generate_blob/"
pwd
bash "$ENTRY_POINT_BLOB"

cd "${PWD_START}"
