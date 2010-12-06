#!/bin/sh
#
# Used to install, reinstall, and uninstall membase on the servers listed
# in the hosts file at the root of the Testsuite directory
#
# Install:
# ./all_hosts install
#
# Reinstall:
# ./all_hosts reinstall
#
# Uninstall:
# ./all_hosts uninstall
#

if [ $# -eq 1 ]
then 
    if [ "$1" == "install" ]
    then
	echo "Installing Membase Cluster"
	pssh -h hosts -l root -P /root/Testsuite/basic/install-membase.sh
    elif [ "$1" == "reinstall" ]
    then
	echo "Reinstalling Membase Cluster"
	pssh -h hosts -l root -P /root/Testsuite/basic/reinstall-membase.sh
    elif [ "$1" == "uninstall" ]
    then
	echo "Uninstalling Membase Cluster"
	pssh -h hosts -l root -P /root/Testsuite/basic/uninstall-membase.sh
    else
	echo "Unknown Arg $1"
    fi
else
    echo "Specify install, reinstall, or uninstall"
fi
