#!/bin/bash
cd /home/killian
tar -czvf doc.tar.gz doc
cat ./.password | gpg --batch --no-tty --yes --passphrase-fd 0 --symmetric -o ./doc-$(date +%d-%m-%y).tar.gz.gpg ./doc.tar.gz
scp -i ~/.ssh/id_netsoc doc-$(date +%d-%m-%y).tar.gz.gpg killiand@netsoc.tcd.ie:doc-backup/doc-$(date +%d-%m-%y).tar.gz.gpg
rm doc-$(date +%d-%m-%y).tar.gz*
rm doc.tar.gz
