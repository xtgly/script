#!/bin/bash
mem=`/usr/bin/uptime > /tmp/load_info`
min5=`cat /tmp/load_info | awk '{print $8}' | cut -d, -f1`
min10=`cat /tmp/load_info | awk '{print $9}' | cut -d, -f1`
min15=`cat /tmp/load_info | awk '{print $10}'`
UPtime=`cat /tmp/load_info | awk '{print $3""$4""$5}'`
echo $min5
echo $min15
echo $UPtime
hostname

