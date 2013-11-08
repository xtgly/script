#!/bin/bash

IFS=","
num=`date +%m%d%H%M`
year=`date +%Y | cut -c 3-4`
rsyncserver=58.22.138.55
dirpath=/data/named/sync

ntpdate 114.80.81.13

if (! ps axu | grep -v grep | grep named); then
    /data/named/sbin/named -u bind 
fi

if (nc -n -v -z -w5 $rsyncserver 873); then
    rsync -vzrtopg --delete --progress $rsyncserver::dns $dirpath
    find $dirpath -type f | xargs fromdos 
fi

while read addr sfip user password; do 
    export $addr"="$sfip
    if (! nc -n -v -z -w5 ${!addr} 80); then
#       pingtime=`ping -c 10 ${!addr} | awk '/packet loss/{print $6+0}'`
#       echo $pingtime
#       if [ $pingtime -ge 20 ]; then
            export $addr"="0
#       fi
#   else
#       export $addr"="0
    fi
done < $dirpath/addr.txt

echo "\$ORIGIN .
\$TTL 300  ; 6 minute
ptgdc.net IN SOA  ns3.ptgdc.net. master.ptgdc.net. (
                                $year$num ; serial
                                360        ; refresh (6 minute)
                                3600       ; retry (1 hour)
                                604800     ; expire (1 week)
                                38400      ; minimum (10 hours 40 minutes)
                                )
                           NS   ns1.ptgdc.net.
                           NS   ns2.ptgdc.net.
                           NS   ns3.ptgdc.net.
\$ORIGIN ptgdc.net.
@               A    58.22.138.55
test                       A    58.22.138.55
test2               A    218.6.15.29
cdn                        A    58.22.138.2
vpn               A    58.22.138.55
bbidc                      A    58.22.138.2
beian               A    218.6.8.88
status               A    58.22.138.2
down                       A    58.22.138.55
ns1                        A    218.6.8.89
ns2                        A    58.22.138.30
ns3                        A    58.22.138.34
\$ORIGIN lt2.ptgdc.net.
*                          A    58.22.138.38
\$ORIGIN us1.ptgdc.net.
*                          A    204.12.234.102
\$ORIGIN dx2.ptgdc.net.
*               A    218.6.2.198
\$ORIGIN vps.ptgdc.net.
moyeavps           A    218.6.15.25" > $dirpath/ptgdc.net.zone

while read LINE; do
    case $LINE in
        us)
            rm -f $dirpath/$LINE"dns".txt
            while read site sip sport fastisp cache bandwidth forward; do
                ip=0
                for i in `echo $fastisp | tr -s '|' ','`; do
                    if ( echo $i | grep $LINE ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                        ip=${!i}
                        break
                    fi
                done
                if [ $ip == 0 ] && [ $sport != 80 ]; then
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep uk ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            break
                        fi
                    done
                fi
                if [ $ip == 0 ] && [ $sport != 80 ]; then
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep cn ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            break
                        fi
                    done
                fi
                if [ $ip == 0 ] && [ $sport != 80 ]; then
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep cu ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            break
                        fi
                    done
                fi
                if [ $ip == 0 ] && [ $sport != 80 ]; then
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep ct ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            break
                        fi
                    done
                fi
                if [ $ip == 0 ]; then
                    ip=$sip
                fi
                echo $site | cut -d "." -f2- | awk '{print "$ORIGIN "$1".ptgdc.net."}' >> $dirpath/$LINE"dns".txt
                echo $site | awk -F "." -v endip=$ip '{print $1"     A       "endip}' >> $dirpath/$LINE"dns".txt
            done < $dirpath/cdnsite.txt
            cat $dirpath/ptgdc.net.zone $dirpath/$LINE"dns".txt > /data/named/etc/$LINE.ptgdc.net.zone
        ;;
        uk)
            rm -f $dirpath/$LINE"dns".txt
            while read site sip sport fastisp cache bandwidth forward; do 
                ip=0
                for i in `echo $fastisp | tr -s '|' ','`; do
                    if ( echo $i | grep $LINE ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                        ip=${!i}
                        break
                    fi
                done
                if [ $ip == 0 ] && [ $sport != 80 ]; then
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep us ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            break
                        fi
                    done
                fi
                if [ $ip == 0 ] && [ $sport != 80 ]; then
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep cn ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            break
                        fi
                    done
                fi
                if [ $ip == 0 ] && [ $sport != 80 ]; then
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep cu ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            break
                        fi
                    done
                fi
                if [ $ip == 0 ] && [ $sport != 80 ]; then
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep ct ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            break
                        fi
                    done
                fi
                if [ $ip == 0 ]; then
                    ip=$sip
                fi
                echo $site | cut -d "." -f2- | awk '{print "$ORIGIN "$1".ptgdc.net."}' >> $dirpath/$LINE"dns".txt
                echo $site | awk -F "." -v endip=$ip '{print $1"     A       "endip}' >> $dirpath/$LINE"dns".txt
            done < $dirpath/cdnsite.txt
            cat $dirpath/ptgdc.net.zone $dirpath/$LINE"dns".txt > /data/named/etc/$LINE.ptgdc.net.zone
        ;;
        cu)
            rm -f $dirpath/$LINE"dns".txt
            while read site sip sport fastisp cache bandwidth forward; do    
                if ( echo $site | grep 35tool ); then
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep $LINE ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            echo $site | awk -F "." -v endip=$ip '{print $1"     A       "endip}' >> $dirpath/$LINE"dns".txt
                        fi
                    done 
                else
                    ip=0
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep cn ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            break
                        fi
                    done
                    if [ $ip == 0 ]; then
                        for i in `echo $fastisp | tr -s '|' ','`; do
                            if ( echo $i | grep $LINE ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                                ip=${!i}
                                break
                            fi
                        done 
                    fi
                    if [ $ip == 0 ] && [ $sport != 80 ]; then
                        for i in `echo $fastisp | tr -s '|' ','`; do
                            if ( echo $i | grep us ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                                ip=${!i}
                                break
                            fi
                        done
                    fi
                    if [ $ip == 0 ] && [ $sport != 80 ] && [ $sport != 85 ]; then
                        for i in `echo $fastisp | tr -s '|' ','`; do
                            if ( echo $i | grep ct ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                                ip=${!i}
                                break
                            fi
                        done
                    fi
                    if [ $ip == 0 ]; then
                        ip=$sip
                    fi
                    echo $site | cut -d "." -f2- | awk '{print "$ORIGIN "$1".ptgdc.net."}' >> $dirpath/$LINE"dns".txt
                    echo $site | awk -F "." -v endip=$ip '{print $1"     A       "endip}' >> $dirpath/$LINE"dns".txt
                fi
            done < $dirpath/cdnsite.txt
            cat $dirpath/ptgdc.net.zone $dirpath/$LINE"dns".txt > /data/named/etc/$LINE.ptgdc.net.zone
        ;;
        ct)
            rm -f $dirpath/$LINE"dns".txt
            while read site sip sport fastisp cache bandwidth forward; do
                if ( echo $site | grep 35tool ); then
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep $LINE ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            echo $site | awk -F "." -v endip=$ip '{print $1"     A       "endip}' >> $dirpath/$LINE"dns".txt
                        fi
                    done 
                else
                    ip=0
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep cn ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            break
                        fi
                    done
                    if [ $ip == 0 ]; then
                        for i in `echo $fastisp | tr -s '|' ','`; do
                            if ( echo $i | grep $LINE ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                                ip=${!i}
                                break
                            fi
                        done 
                    fi
                    if [ $ip == 0 ] && [ $sport != 80 ]; then
                        for i in `echo $fastisp | tr -s '|' ','`; do
                            if ( echo $i | grep us ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                                ip=${!i}
                                break
                            fi
                        done
                    fi
                    if [ $ip == 0 ] && [ $sport != 80 ] && [ $sport != 85 ]; then
                        for i in `echo $fastisp | tr -s '|' ','`; do
                            if ( echo $i | grep cu ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                                ip=${!i}
                                break
                            fi
                        done
                    fi
                    if [ $ip == 0 ]; then
                        ip=$sip
                    fi
                    echo $site | cut -d "." -f2- | awk '{print "$ORIGIN "$1".ptgdc.net."}' >> $dirpath/$LINE"dns".txt
                    echo $site | awk -F "." -v endip=$ip '{print $1"     A       "endip}' >> $dirpath/$LINE"dns".txt
                fi
            done < $dirpath/cdnsite.txt
            cat $dirpath/ptgdc.net.zone $dirpath/$LINE"dns".txt > /data/named/etc/$LINE.ptgdc.net.zone
        ;;
        any)           
            rm -f $dirpath/$LINE"dns".txt
            while read site sip sport fastisp cache bandwidth forward; do
                ip=0
                for i in `echo $fastisp | tr -s '|' ','`; do
                    if ( echo $i | grep us ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                        ip=${!i}
                        break
                    fi
                done
                if [ $ip == 0 ]; then
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep cn ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            break
                        fi
                    done 
                fi
                if [ $ip == 0 ]; then
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep ct ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            break
                        fi
                    done 
                fi
                if [ $ip == 0 ]; then
                    for i in `echo $fastisp | tr -s '|' ','`; do
                        if ( echo $i | grep cu ) && [ -n ${!i} ] && [ ${!i} != 0 ]; then
                            ip=${!i}
                            break
                        fi
                    done 
                fi
                if [ $ip == 0 ]; then
                    ip=$sip
                fi
                echo $site | cut -d "." -f2- | awk '{print "$ORIGIN "$1".ptgdc.net."}' >> $dirpath/$LINE"dns".txt
                echo $site | awk -F "." -v endip=$ip '{print $1"     A       "endip}' >> $dirpath/$LINE"dns".txt
            done < $dirpath/cdnsite.txt
            cat $dirpath/ptgdc.net.zone $dirpath/$LINE"dns".txt > /data/named/etc/$LINE.ptgdc.net.zone
        ;;
    esac
done < /data/named/area.txt 
chown -R bind:bind /data/named
/data/named/sbin/rndc reload
