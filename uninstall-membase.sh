#!/bin/sh

rpm -e membase-server
rm -rf /var/opt/membase
rm -rf /etc/opt/membase
rm -rf /mnt/membase
echo "Membase Successfully Removed"
