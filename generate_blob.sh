#!/bin/bash

PATH_TO_CONTENT="generate_blob"
PATH_TO_BLOB="$HOME/Desktop/Git/setups/setup_encrypted_blob"
BLOB_BASENAME="blob"

zip -r "${PATH_TO_BLOB}/${BLOB_BASENAME}.zip" "${PATH_TO_CONTENT}"
gpg --output "${PATH_TO_BLOB}/${BLOB_BASENAME}.zip.gpg" --symmetric "${PATH_TO_BLOB}/${BLOB_BASENAME}.zip"
rm "${PATH_TO_BLOB}/${BLOB_BASENAME}.zip"

