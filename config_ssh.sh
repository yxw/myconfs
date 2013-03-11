#! /usr/bin/env bash
mkdir ~/.ssh
cp ./key_backup/* ~/.ssh/
# important
chmod 700 ~/.ssh
chmod 644 ~/.ssh/*.pub
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/*.pem

