#!/bin/sh

#
# Setup pssh
#
tar xvf pkgs/pssh*
mv pssh* pssh
cd pssh
python ez_setup.py
python setup.py install
cd ..
