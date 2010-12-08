#!/bin/sh

for ((  i = 0 ;  i <= 120;  i++  ))
do
  ssh root@10.252.215.111 " date;export TERM=linux; top -b -n1  | egrep \"memcached.bin\""
  sleep 30
done