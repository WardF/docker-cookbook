#!/bin/bash
set -x
mysqldump -u root cdash | gzip > /home/vagrant/default_cdash_database.sql.gz
mv /home/vagrant/default_cdash_database.sql.gz /vagrant
echo Finished.
