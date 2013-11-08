#!/bin/bash
cpu=`/usr/bin/sar -u 1 3 | grep Average > /tmp/cpu_info`
cpuuser=`cat /tmp/cpu_info | awk '{print $3}'`
cpunice=`cat /tmp/cpu_info | awk '{print $4}'`
cpusys=`cat /tmp/cpu_info | awk '{print $5}'`
cpuwa=`cat /tmp/cpu_info | awk '{print $6}'`
cpuidle=`cat /tmp/cpu_info | awk '{print $8}'`
UPtime=`/usr/bin/uptime | awk '{print $3""$4""$5}'`
echo $cpuuser
echo $cpuidle
echo $UPtime
hostname

