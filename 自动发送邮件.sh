#! /bin/bash
 
usage(){
    cat <<-EOF
----------------------------------------------------------
这是一个自动发送邮件的脚本（smtp.qq.com）
发送列表/mymali/rcpt.list
邮件内容/mymali/mailfile
错误日志/mymali/fail.list
使用方法：sendmail 用户名 密码----------------------------------------------------------
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
    #必须要换一行，不然发送的邮件没有内容?
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