#!/bin/bash
set -x
mysqldump -u root cdash | gzip > /root/default_cdash_database.sql.gz
cp /root/default_cdash_database.sql.gz /working
echo Finished.
