#!/bin/sh

rm -rf membase-server*
if [ "$1" == "64" ]; then
	echo "Installing 64 bit Membase"
	wget http://builds.hq.northscale.net/latestbuilds/membase-server-community_x86_64.rpm
else
	echo "Installing 32 bit Membase"
	wget http://builds.hq.northscale.net/latestbuilds/membase-server-community_x86.rpm
fi 

rpm -i membase-server*