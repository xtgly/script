#!/bin/bash
swap=`/usr/bin/free > /tmp/swap_info`
swapused=`cat /tmp/mem_info | grep Swap | awk '{print $3}'`
swapfree=`cat /tmp/mem_info | grep Swap | awk '{print $4}'`
swaptotal=`cat /tmp/mem_info |grep Swap | awk '{print $2}'`
echo $swapused
echo $swapfree
echo $swaptotal
hostname

