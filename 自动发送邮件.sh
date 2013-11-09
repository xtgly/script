#! /bin/bash
 
usage(){
    cat <<-EOF
----------------------------------------------------------
����һ���Զ������ʼ��Ľű���smtp.qq.com��
�����б�/mymali/rcpt.list
�ʼ�����/mymali/mailfile
������־/mymali/fail.list
ʹ�÷�����sendmail �û��� ����----------------------------------------------------------
EOF
    exit 1
}
 
sendmail(){
    (for i in  "HELO $SERVERIP" "AUTH LOGIN" "$MUSER" "$MPASS" "MAIL FROM:<$MAILFROM>"
    do
        sleep 2
        echo $i
 
    done
    while read rcpt
    do
        echo "RCPT TO:<$rcpt>"
        RCPT="<$rcpt>;$RCPT"
        sleep 1
    done <$RCPTFILE
    echo "DATA"
    sleep 1
    cat <<- SUB
Subject:test mail
Content-Type: text/plain;
    charset="UTF-8"
Content-Transfer-Encoding: base64
From:<$MAILFROM>
To:$RCPT
SUB
    #����Ҫ��һ�У���Ȼ���͵��ʼ�û������?
    echo
    sleep 1
    base64 $MAILFILE
    sleep 1
    echo "."
    sleep 1
    echo "QUIT")|telnet  $SERVERIP $PORT
    echo $RCPT
}
 
if [ "$#" -ne "2" ];then
    usage
else
    MAILFROM=$1
    MUSER=$(echo  -n "$1" | base64)
    MPASS=$(echo  -n "$2" | base64)
fi
RCPTFILE="$HOME/mymail/rcpt.list"
SERVERIP="58.251.149.147"
PORT="25"
MAILFILE="$HOME/mymail/mailfile"
LOGFILE="$HOME/mymail/fail.list"
rm -rf $LOGFILE
exec 3>$LOGFILE
exec 2>&3
RCPTLIST=""
sendmail