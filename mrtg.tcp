#!/bin/bash
tcp=`/bin/netstat -ant | awk '{if($4~/:80/) print $0}' > /tmp/tcp_info`
allip=`cat /tmp/tcp_info | wc -l | awk '{print $0-1}'`
userip=`cat /tmp/tcp_info | awk '{print $5}' | cut -d ":" -f1 | sort | uniq | wc -l | awk '{print $0-1}'`
UPtime=`/usr/bin/uptime | awk '{print $3""$4""$5}'`
if [ "$allip" = "-1" ]; then
    echo 0
else
    echo $allip
fi

if [ "$userip" = "-1" ]; then
    echo 0
else
    echo $userip
fi
echo $UPtime
hostname
