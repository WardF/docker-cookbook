#!/bin/bash
sleep 10
CTEST_HOME="/home/vagrant/ctest_scripts"
DASH="$CTEST_HOME/Dashboards"
rm -rf $CTEST_HOME
/bin/mkdir -p $CTEST_HOME
count=0
while [ $count -lt 10 ]; do
 if [ -f /vagrant/Vagrantfile ]; then
   count=50
 else
   echo "Waiting for /vagrant to be mounted."
   count=`expr $count + 1`
   sleep 5
 fi
done
if [ -d /vagrant ]; then
     find -L /vagrant -maxdepth 1 -type f -exec cp {} /home/vagrant/ctest_scripts \;
else
     exit 1
fi
 if [ ! -f /usr/local/bin/ctest ]; then
    echo "ctest not found"
    exit 1
 fi
 /bin/rm -rf $DASH
 echo "Starting ctest"
 cd /home/vagrant/ctest_scripts/
 /usr/local/bin/ctest -V -S PARCI.cmake > ccontinuous_test.out 2>&1 &
 /usr/local/bin/ctest -V -S FPARCI.cmake > fcontinuous_test.out 2>&1 &
 /usr/local/bin/ctest -V -S CXX4I.cmake > cxx4continuous_test.out 2>&1 &
 exit $RETVAL
