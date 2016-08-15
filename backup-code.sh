#!/bin/bash
cd /home/killian
tar -czvf code.tar.gz code
cat ./.password | gpg --batch --no-tty --yes --passphrase-fd 0 --symmetric -o ./code-$(date +%d-%m-%y).tar.gz.gpg ./code.tar.gz
scp -i ~/.ssh/id_netsoc code-$(date +%d-%m-%y).tar.gz.gpg killiand@netsoc.tcd.ie:code-backup/code-$(date +%d-%m-%y).tar.gz.gpg
rm code-$(date +%d-%m-%y).tar.gz*
