#!/bin/sh

dd if=/dev/zero of=/mnt/swapfile1 bs=1k count=4700000
chmod 600 /mnt/swapfile1
mkswap /mnt/swapfile1; swapon /mnt/swapfile1