#!/bin/sh

#
# Setup pssh
#
tar xzf pkgs/pssh*
mv pssh* pssh
cd pssh
python ez_setup.py
python setup.py install
cd ..

tar xzf pkgs/memcachetestv*
mv memcachetestv* /opt