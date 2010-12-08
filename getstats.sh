MACHINE_LIST=$1
MACHINE_LIST1="10.252.215.111 10.122.35.248 10.122.190.102 10.122.238.6 10.253.35.191"
echo MACHINE_LIST=$MACHINE_LIST

echo "========QUEUE STATSi 1 :=========== ";
for i in $MACHINE_LIST;
do
  echo MACHINE: $i
  /opt/membase/bin/ep_engine/management/stats $i:11210 all | egrep "fetch|ep_flusher_todo|cur_itmes|ep_queue_size|pers";
done

echo "========QUEUE 2:=========== ";
for i in $MACHINE_LIST;
do
  echo MACHINE: $i;
  /opt/membase/bin/ep_engine/management/stats $i:11210 all | egrep "etch|ep_flusher_todo|cur_itmes|ep_queue_size|pers";echo "";
done

echo"";
echo "========STATS ITEM//MEM:=========== ";
for i in $MACHINE_LIST;
do
  echo MACHINE: $i;
  /opt/membase/bin/ep_engine/management/stats $i:11210 all | egrep "curr_item|mem_|_eject";echo "";
done

echo"";
echo "========STATS FAILURE//MEM:=========== ";
for i in $MACHINE_LIST;
do
  echo MACHINE: $i;
  /opt/membase/bin/ep_engine/management/stats $i:11210 all | egrep "fail";
  echo "";
done

echo"";
echo "";
echo "======== TAP :=========== ";
for i in $MACHINE_LIST;
do
  echo MACHINE: $i;
  /opt/membase/bin/ep_engine/management/stats $i:11210 tap | egrep "rec_fetched|pending_backfill|num_tap_nack|num_tap_tmpfail_survivors";
 done
echo "";


echo "";
echo "======== VBUCKETCTL :=========== ";
for i in $MACHINE_LIST; 
do
  echo MACHINE: $i;
  /opt/membase/bin/ep_engine/management/vbucketctl $i:11210 list | awk '{print $3}' | sort -n | uniq -c;
done

echo "";
echo "======== MEMORY USAGE:=========== ";
for i in $MACHINE_LIST;
do
  echo MACHINE: $i;
  ssh root@$i "cat /proc/meminfo | egrep \"MemTotal|MemFree|SwapTotal|SwapFree\"";
done

echo "";
echo "======== CPU USAGE:=========== ";
for i in $MACHINE_LIST;
do
  echo MACHINE: $i;
  ssh  root@$i " export TERM=linux; top -b -n1  | egrep \"moxi|memcach|vbucket|CPU|load|Mem:|Swap:|Cpu(s)\";";
done

echo "";
echo "======== DISK USAGE:=========== ";
for i in $MACHINE_LIST;
do
  echo MACHINE: $i;
  ssh  root@$i " df ";
done

echo "";
echo "";
echo "======== DISK LOAD:=========== ";
for i in $MACHINE_LIST;
do
  echo MACHINE: $i;
  ssh root@$i "iostat -x 2 2 | egrep \"util|sdd5|sdb5|sdb6|sda7|tps\" ;echo"";iostat 2 2 | egrep \"util|sdd5|sdb5|sdb6|tps\"";
done
echo"";
