#!/bin/bash
mem=`/usr/bin/free > /tmp/mem_info`
memused=`cat /tmp/mem_info | grep Mem | awk '{print $3}'`
memfree=`cat /tmp/mem_info | grep Mem | awk '{print $4}'`
membcf=`cat /tmp/mem_info | grep "\-/+" | awk '{print $4}'`
memtotal=`cat /tmp/mem_info |grep Mem | awk '{print $2}'`
echo $memused
echo $membcf
echo $memtotal
hostname

