#!/bin/bash
set -e
# Check if user is root
if [ $(id -u) != "0" ] || [ ! -s /etc/redhat-release ]; then
    echo "Error: You Must Be Root To Run This Script, And Only Support Centos/Redhat System. Please Use Root In Centos To Install"
    exit 1
fi
if ( ! ping -c 1 www.baidu.com ) ; then
    echo "Error: No Network Or DNS Failed."
    exit 1
fi
clear
echo "========================================================================================"
echo "Auto-compile Beta V1.2 For CentOS/RedHat Written By Kelvin"
echo "========================================================================================"
echo "A Tool To Auto-compile & Install Linux Software"
echo ""
echo "For More Information Please Visit http://www.xtgly.com/"
echo "========================================================================================"
yum -y install yum-fastestmirror wget gcc gcc-c++ make automake libtool patch
# yum -y --exclude=kernel* update
# yum -y patch libtool-libs libc-client
cur_dir=$(pwd)
down_dir=$(pwd)/down
if [ ! -d $down_dir ]; then
    mkdir $down_dir
fi
pkgmirror="http://down.ptgdc.net/package"
sptmirror="http://raw.github.com/xtgly/scripts/master"
confmirror="http://raw.github.com/xtgly/conf/master"
if [ ! -s /etc/env ]; then
    install_dir="/usr/local"
    userdir="/home/www"
    logs="/home/logs"
    ftpdb="ftp"
    ftpdbusername="ftp"
    ftpdbpasswd=`cat /dev/urandom | head -1 | md5sum | head -c 6`
    dnsdb="dns"
    dnsdbusername="dns"
    dnsdbpasswd=`cat /dev/urandom | head -1 | md5sum | head -c 6`
    mysqlrootpwd=`cat /dev/urandom | head -1 | md5sum | head -c 8`
    echo "Please Input HostName:"
    read -p "(Default : vhost.ptgdc.net):" HOSTNAME
    if [ "$HOSTNAME" = "" ]; then
        HOSTNAME="vhost.ptgdc.net"
    fi
    hostname $HOSTNAME
    if (cat /etc/sysconfig/network | grep "HOSTNAME"); then
        sed -i 's/HOSTNAME\=.*/HOSTNAME\='$HOSTNAME'/g' /etc/sysconfig/network
    else
        echo "HOSTNAME=$HOSTNAME" >> /etc/sysconfig/network
    fi
    devs=`/sbin/ifconfig -a | grep "Link encap" | awk '{print $1}' |grep -v lp0|grep -v lo|grep -v tun0|grep -v ppp0|grep -v faith0|grep -v sit0`
    count=0;
    for i in $devs; do
        count=$(($count+1))
    done
    if [ $count -eq 0 ]; then
        echo "Could not find your ethernet device."
        echo -n "Please enter the name of your ethernet device: "
        read eth_dev;
    elif [ $count -eq 1 ]; then
        echo -n "Is $devs your network adaptor with the license IP? (y,n) : "
        read yesno;
        if [ "$yesno" = "n" ]; then
            echo -n "Enter the name of the ethernet device you wish to use : ";
            read eth_dev;
        else
            eth_dev=$devs
        fi
    else
        echo "The following ethernet devices were found. Please enter the name of the one you wish to use:";
        echo "";
        echo $devs;
        echo "";
        echo -n "Enter the device name: ";
        read eth_dev;
    fi
    ip=`/sbin/ifconfig $eth_dev | grep 'inet addr:' | cut -d: -f2 | cut -d\  -f1`;
    eth=$eth_dev
    if ( echo $eth_dev | grep ":" ); then
        eth=`echo $eth_dev | awk -F ":" '{print $1}'`
    fi
    echo -n "Is $ip the IP in your license? (y,n) : ";
    read yesno;
    if [ "$yesno" = "n" ]; then
        echo -n "Enter the IP used in your license file : ";
        read ip;
    fi
    if [ "$ip" = "" ]; then
        echo "The IP entered is blank.  Please try again, and enter a valid IP";
        exit
    fi
    echo ""
    echo "install_dir=$install_dir" >> /etc/env
    echo "userdir=$userdir" >> /etc/env
    echo "logs=$logs" >> /etc/env
    echo "hostname=$HOSTNAME" >> /etc/env
    echo "ftpdb=$ftpdb" >> /etc/env
    echo "ftpdbusername=$ftpdbusername" >> /etc/env
    echo "ftpdbpasswd=$ftpdbpasswd" >> /etc/env
    echo "dnsdb=$dnsdb" >> /etc/env
    echo "dnsdbusername=$dnsdbusername" >> /etc/env
    echo "dnsdbpasswd=$dnsdbpasswd" >> /etc/env
    echo "mysqlrootpwd=$mysqlrootpwd" >> /etc/env
    echo "eth=$eth" >> /etc/env
    echo "ip=$ip" >> /etc/env
    echo "ipcount=100" >> /etc/env
else
    . /etc/env
fi
##################################################################### Apache #####################################################################
function apache(){
    if [ -d $install_dir/apache ]; then
        mv $install_dir/apache $install_dir/apache.bak
    fi
    if ( ps aux | grep httpd | grep -v grep ); then
        killall httpd
    fi
    yum install -y openssl-devel perl pcre-devel
    if ( ! id www ); then
        groupadd -g 8080 www
        useradd -u 8080 -g www -M -s /sbin/nologin www
    fi
    if [ ! -d $userdir ]; then
        mkdir -p $userdir
        chmod +w $userdir
        chown www:www $userdir
    fi
    cd $down_dir
    if [ "$verchoose" = "1" ]; then
        if [ -s httpd-2.2.26.tar.gz ]; then
            echo "httpd-2.2.26.tar.gz [found]"
        else
            echo "Error: httpd-2.2.26.tar.gz not found!!!download now......"
            wget -c $pkgmirror/httpd-2.2.26.tar.gz
        fi
        tar zxvf httpd-2.2.26.tar.gz
        cd httpd-2.2.26
     elif [ "$verchoose" = "2" ]; then
        if [ -s httpd-2.4.7.tar.gz ]; then
            echo "httpd-2.4.7.tar.gz [found]"
        else
            echo "Error: httpd-2.4.7.tar.gz not found!!!download now......"
            wget -c $pkgmirror/httpd-2.4.7.tar.gz
        fi
        if [ -s apr-1.5.0.tar.gz ]; then
            echo "apr-1.5.0.tar.gz [found]"
        else
            echo "Error: apr-1.5.0.tar.gz not found!!!download now......"
            wget -c $pkgmirror/apr-1.5.0.tar.gz
        fi
        if [ -s apr-util-1.5.3.tar.gz ]; then
            echo "apr-util-1.5.3.tar.gz [found]"
        else
            echo "Error: apr-util-1.5.3.tar.gz not found!!!download now......"
            wget -c $pkgmirror/apr-util-1.5.3.tar.gz
        fi
        tar zxvf httpd-2.4.7.tar.gz
        tar zxvf apr-1.5.0.tar.gz
        tar zxvf apr-util-1.5.3.tar.gz
        \cp  -rf apr-1.5.0 httpd-2.4.7/srclib/apr
        \cp  -rf apr-util-1.5.3 httpd-2.4.7/srclib/apr-util
        cd httpd-2.4.7
     fi
    ./configure --prefix=$install_dir/apache --enable-headers --enable-mime-magic --enable-proxy --enable-so --enable-rewrite --enable-ssl --enable-suexec --with-suexec-docroot=$userdir --enable-deflate --disable-userdir --with-included-apr --with-mpm=prefork --with-ssl=/usr
    make
    make install
    cd modules/loggers/
    $install_dir/apache/bin/apxs -c mod_logio.c
    $install_dir/apache/bin/apxs -i -a -n mpm_logio mod_logio.la
    cd ..
    cd mappers
    $install_dir/apache/bin/apxs -c -i -a mod_speling.c
#   cd ..
#   cd filters
#   $install_dir/apache/bin/apxs -c -i -a mod_deflate.c
    cd ..
    cd metadata
    $install_dir/apache/bin/apxs -c -i -a mod_expires.c
    if [ "$verchoose" = "1" ]; then
        cd $down_dir
        if [ -s mod_rpaf-0.6.tar.gz ]; then
            echo "mod_rpaf-0.6.tar.gz [found]"
        else
            echo "Error: mod_rpaf-0.6.tar.gz not found!!!download now......"
            wget -c $pkgmirror/mod_rpaf-0.6.tar.gz
        fi
        tar zxvf mod_rpaf-0.6.tar.gz
        cd mod_rpaf-0.6
        $install_dir/apache/bin/apxs -i -c -n mod_rpaf-2.0.so mod_rpaf-2.0.c
    fi
    cd $down_dir
    if [ -s mod-cband-0.9.7.5.tgz ]; then
        echo "mod-cband-0.9.7.5.tgz [found]"
    else
        echo "Error: mod-cband-0.9.7.5.tgz not found!!!download now......"
        wget -c $pkgmirror/mod-cband-0.9.7.5.tgz
    fi
    tar xvf mod-cband-0.9.7.5.tgz
    cd mod-cband-0.9.7.5
    if [ "$verchoose" = "2" ]; then
        sed -i 's/remote_ip/client_ip/g' src/mod_cband.c
        sed -i 's/c->remote_addr/c->client_addr/g' src/mod_cband.c
    fi
    ./configure --with-apxs=$install_dir/apache/bin/apxs
    make
    make install
    cd $down_dir
    if [ -s mod_bw-0.92.tgz ]; then
        echo "mod_bw-0.92.tgz [found]"
    else
        echo "Error: mod_bw-0.92.tgz not found!!!download now......"
        wget -c $pkgmirror/mod_bw-0.92.tgz
    fi
    if [ ! -d mod_bw-0.92 ]; then
        mkdir mod_bw-0.92
    fi
    tar xvf mod_bw-0.92.tgz -C mod_bw-0.92
    cd mod_bw-0.92
    if [ "$verchoose" = "2" ]; then
        sed -i 's/remote_addr/client_addr/g' mod_bw.c
    fi
    $install_dir/apache/bin/apxs -c -i -a mod_bw.c
    cd $down_dir
    if [ -s mod_evasive_1.10.1.tar.gz ]; then
        echo "mod_evasive_1.10.1.tar.gz [found]"
    else
        echo "Error: mod_evasive_1.10.1.tar.gz not found!!!download now......"
        wget -c $pkgmirror/mod_evasive_1.10.1.tar.gz
    fi
    tar zxvf mod_evasive_1.10.1.tar.gz
    cd mod_evasive
    if [ "$verchoose" = "2" ]; then
        sed -i 's/remote_ip/client_ip/g' mod_evasive20.c
    fi
    $install_dir/apache/bin/apxs -c -i -a mod_evasive20.c
    cd $down_dir
    if [ -s mod_limitipconn-0.24.tar.bz2 ]; then
        echo "mod_limitipconn-0.24.tar.bz2 [found]"
    else
        echo "Error: mod_limitipconn-0.24.tar.bz2 not found!!!download now......"
        wget -c $pkgmirror/mod_limitipconn-0.24.tar.bz2
    fi
    tar jxvf mod_limitipconn-0.24.tar.bz2
    cd mod_limitipconn-0.24
    $install_dir/apache/bin/apxs -c -i -a mod_limitipconn.c
    cat > $install_dir/apache/conf/extra/httpd-vhosts.conf<<EOF
#----------Begin $ip----------#
NameVirtualHost *:80
<VirtualHost *:80>
    ServerName $ip
    <Location />
        Order Allow,Deny
        Deny from all
    </Location>
</VirtualHost>
#----------End $ip----------#
EOF
    if [ "$verchoose" = "2" ]; then
        sed -i '/NameVirtualHost \*:80/d' $install_dir/apache/conf/extra/httpd-vhosts.conf
        sed -i 's!#LoadModule slotmem_shm_module modules/mod_slotmem_shm.so!LoadModule slotmem_shm_module modules/mod_slotmem_shm.so!g' $install_dir/apache/conf/httpd.conf
    fi
    sed -i 's/User daemon/User www/g' $install_dir/apache/conf/httpd.conf
    sed -i 's/Group daemon/Group www/g' $install_dir/apache/conf/httpd.conf
    sed -i 's/#ServerName www.example.com:80/ServerName '$HOSTNAME':80/g' $install_dir/apache/conf/httpd.conf
    sed -i 's/mpm_logio_module/logio_module/g' $install_dir/apache/conf/httpd.conf
    sed -i '/logio_module/ i LogFormat "%O" bytes' $install_dir/apache/conf/httpd.conf
    sed -i 's!#Include conf/extra/httpd-vhosts.conf!Include conf/extra/httpd-vhosts.conf!g' $install_dir/apache/conf/httpd.conf
    \cp $install_dir/apache/bin/apachectl /etc/init.d/apache
    sed -i '2i \# chkconfig: 2345 10 90\n# description: Activates/Deactivates Apache Web Server' /etc/init.d/apache
    sed -i 's/#AddHandler cgi-script .cgi/AddHandler cgi-script .cgi .pl/g' $install_dir/apache/conf/httpd.conf
    sed -i 's/DirectoryIndex index.html/DirectoryIndex index.html index.htm/g' $install_dir/apache/conf/httpd.conf
    chkconfig --add apache
    chkconfig --level 2345 apache on
    /etc/init.d/apache start
}
##################################################################### Nginx #####################################################################
function nginx(){
    if [ -d $install_dir/nginx ]; then
        mv $install_dir/nginx $install_dir/nginx.bak
    fi
    if ( ps axu | grep nginx | grep -v grep ); then
        killall nginx
    fi
    yum install -y openssl-devel pcre-devel
    if ( ! id www ); then
        groupadd -g 8080 www
        useradd -u 8080 -g www -M -s /sbin/nologin www
    fi
    cd $down_dir	
    if [ -s nginx-1.4.4.tar.gz ]; then
        echo "nginx-1.4.4.tar.gz [found]" 
    else
        echo "Error: nginx-1.4.4.tar.gz not found!!!download now......"
        wget -c $pkgmirror/nginx-1.4.4.tar.gz
    fi
    if [ -s ngx_cache_purge-2.1.tar.gz ]; then
        echo "ngx_cache_purge-2.1.tar.gz [found]" 
    else
        echo "Error: ngx_cache_purge-2.1.tar.gz not found!!!download now......"
        wget -c $pkgmirror/ngx_cache_purge-2.1.tar.gz
    fi
    tar zxvf nginx-1.4.4.tar.gz
    tar zxvf ngx_cache_purge-2.1.tar.gz
    cd nginx-1.4.4
    ./configure --add-module=../ngx_cache_purge-2.1 --prefix=$install_dir/nginx --user=www --group=www --with-http_ssl_module --with-http_gzip_static_module --with-http_stub_status_module --with-http_sub_module
    make
    make install
    if [ ! -d /home/cache/proxy_cache_dir ]; then
        mkdir -p /home/cache/proxy_cache_dir
        mkdir -p /home/cache/proxy_temp_dir
    fi
    chown -R www:www /home/cache
    cd $install_dir/nginx/conf
    rm -f nginx.conf
    wget -c $confmirror/nginx.conf
    cd /etc/init.d
    if [ -f nginx ]; then
        rm -f nginx
    fi
    wget -c $sptmirror/nginx
    sed -i 's#install_dir#'$install_dir'#g' nginx
    chmod 755 nginx
    chkconfig --add nginx
    chkconfig --level 2345 nginx on
    /etc/init.d/nginx start
}
##################################################################### Tomcat #####################################################################
function tomcat(){
    if [ -d $install_dir/tomcat ]; then
        mv $install_dir/tomcat $install_dir/tomcat.bak
    fi
    if ( ps axu | grep catalina | grep -v grep ); then
        killall java
    fi
    yum install -y glibc.i686
    if ( ! id www ); then
        groupadd -g 8080 www
        useradd -u 8080 -g www -M -s /sbin/nologin www
    fi
    cd $down_dir
    if [ ! -d $install_dir/jdk1.7.0_25 ]; then
        if [ -s jdk-7u25-linux-i586.tar.gz ]; then
            echo "jdk-7u25-linux-i586.tar.gz [found]" 
        else
            echo "Error: jdk-7u25-linux-i586.tar.gz not found!!!download now......"
            wget -c $pkgmirror/jdk-7u25-linux-i586.tar.gz
        fi
        tar zxvf jdk-7u25-linux-i586.tar.gz
        mv jdk1.7.0_25 $install_dir/
        cat >> /etc/profile<<EOF
export JAVA_HOME=$install_dir/jdk1.7.0_25
export JRE_HOME=\${JAVA_HOME}/jre
export CLASSPATH=.:\${JAVA_HOME}/lib:\${JRE_HOME}/lib
export PATH=\${JAVA_HOME}/bin:\$PATH
EOF
        . /etc/profile
    fi
    cd $down_dir
    if [ -s apache-tomcat-7.0.47.tar.gz ]; then
        echo "apache-tomcat-7.0.47.tar.gz [found]"
    else
        echo "Error: apache-tomcat-7.0.47.tar.gz not found!!!download now......"
        wget -c $pkgmirror/apache-tomcat-7.0.47.tar.gz
    fi
    tar zxvf apache-tomcat-7.0.47.tar.gz
    mv apache-tomcat-7.0.47 $install_dir/tomcat
    if [ -d $install_dir/apache ] ; then
        cd $down_dir
        if [ -s tomcat-connectors-1.2.37-src.tar.gz ]; then
            echo "tomcat-connectors-1.2.37-src.tar.gz [found]"
        else
            echo "Error: tomcat-connectors-1.2.37-src.tar.gz not found!!!download now......"
            wget -c $pkgmirror/tomcat-connectors-1.2.37-src.tar.gz
        fi
        tar zxvf tomcat-connectors-1.2.37-src.tar.gz
        cd tomcat-connectors-1.2.37-src/native/
        ./configure --with-apxs=$install_dir/apache/bin/apxs
        make
        make install
        cat > $install_dir/apache/conf/extra/httpd-mod_jk.conf<<EOF
# Load mod_jk module
LoadModule jk_module $install_dir/apache/modules/mod_jk.so

# Where to find workers.properties
JkWorkersFile $install_dir/apache/conf/workers.properties

# Where to put jk logs
JkLogFile $install_dir/apache/logs/mod_jk.log

# Set the jk log level [debug/error/info]
JkLogLevel info

# Select the log format
JkLogStampFormat "[%a %b %d %H:%M:%S %Y]"

# JkOptions indicate to send SSL KEY SIZE, 
JkOptions  +ForwardKeySize +ForwardURICompat -ForwardDirectories

# JkRequestLogFormat set the request format 
JkRequestLogFormat "%w %V %T"

# Send servlet for context /examples to worker named worker1
JkMount /servlet/*  worker1

# Send JSPs  for context /examples to worker named worker1
JkMount /*.jsp worker1
JkMount /*.action worker1
JkMount /*.do worker1
EOF
        cat > $install_dir/apache/conf/workers.properties<<EOF
workers.java_home=$install_dir/jdk1.7.0_25
workers.tomcat_home=$install_dir/tomcat
ps=/

# Defining a worker named worker1 and of type ajp13
worker.list=worker1

# Set properties for worker1
worker.worker1.type=ajp13
worker.worker1.host=localhost
worker.worker1.port=8009
worker.worker1.lbfactor=1
worker.worker1.socket_keepalive=1
EOF
        if ( ! cat $install_dir/apache/conf/httpd.conf | grep "httpd-mod_jk.conf" ); then
            echo "Include $install_dir/apache/conf/extra/httpd-mod_jk.conf" >> $install_dir/apache/conf/httpd.conf
        fi
        if ( ! cat $install_dir/apache/conf/httpd.conf | grep "index.jsp" ); then
            sed -i 's/DirectoryIndex index.html/DirectoryIndex index.html index.jsp index.shtml index.jshtml/g' $install_dir/apache/conf/httpd.conf
        fi
        /etc/init.d/apache restart
    fi
    if ( ! cat /etc/rc.local | grep "catalina.sh" ); then
        echo "$install_dir/tomcat/bin/catalina.sh start &" >> /etc/rc.local
    fi
    $install_dir/tomcat/bin/catalina.sh start &
}
##################################################################### Squid #####################################################################
function squid(){
    if [ -d $install_dir/squid ]; then
        mv $install_dir/squid $install_dir/squid.bak
    fi
    if ( ps axu | grep squid | grep -v grep ); then
        killall squid
    fi
    if ( ! id www ); then
        groupadd -g 8080 www
        useradd -u 8080 -g www -M -s /sbin/nologin www
    fi
    cd $down_dir
    if [ -s squid-2.7.STABLE9.tar.gz ]; then
        echo "squid-2.7.STABLE9.tar.gz [found]" 
    else
        echo "Error: squid-2.7.STABLE9.tar.gz not found!!!download now......"
        wget -c $pkgmirror/squid-2.7.STABLE9.tar.gz
    fi
    tar zxvf squid-2.7.STABLE9.tar.gz
    cd squid-2.7.STABLE9
    sed -i 's/(%s)//g' src/errorpage.c 
    ./configure --prefix=$install_dir/squid --enable-xmalloc-statistics --enable-async-io=320 --with-maxfd=65536 --enable-useragent-log --enable-referer-log --enable-epoll --disable-poll --enable-large-cache-files --disable-internal-dns --enable-linux-netfilter --enable-truncate --enable-x-accelerator-vary --enable-follow-x-forwarded-for --with-large-files --with-pthreads --enable-storeio="aufs,coss,diskd,ufs,null" --enable-kill-parent-hack --enable-gnuregex --enable-cache-digests --enable-delay-pools --enable-stacktraces --enable-default-err-language=Simplify_Chinese --enable-err-languages="Simplify_Chinese English" --enable-auth="basic" --enable-basic-auth-helpers="NCSA" --enable-snmp
    make
    make install
    if [ ! -d /home/cache ]; then
        mkdir /home/cache
    fi
    chown -R www:www /home/cache
    chown -R www:www $install_dir/squid/var/logs
    cd $install_dir/squid/etc
    rm -f squid.conf
    wget -c $confmirror/squid.conf
    sed -i 's#install_dir#'$install_dir'#g' squid.conf
    $install_dir/squid/sbin/squid -z
    cd /etc/init.d
    if [ -f squid ]; then
        rm -f squid
    fi
    wget -c $sptmirror/squid
    sed -i 's#install_dir#'$install_dir'#g' squid
    chmod 755 squid
    chkconfig --add squid
    chkconfig --level 2345 squid on
    /etc/init.d/squid start
}
##################################################################### Varnish #####################################################################
function varnish(){
    if [ -d $install_dir/varnish ]; then
        mv $install_dir/varnish $install_dir/varnish.bak
    fi
    if ( ps aux | grep varnishd | grep -v grep ); then
        killall varnishd
    fi
    yum install -y pkgconfig pcre-devel readline-devel
    if ( ! id www ); then
        groupadd -g 8080 www
        useradd -u 8080 -g www -M -s /sbin/nologin www
    fi
    cd $down_dir
    if [ -s varnish-3.0.4.tar.gz ]; then
        echo "varnish-3.0.4.tar.gz [found]"
    else
        echo "Error: varnish-3.0.4.tar.gz not found!!!download now......"
        wget -c $pkgmirror/varnish-3.0.4.tar.gz
    fi
    tar zxvf varnish-3.0.4.tar.gz
    cd varnish-3.0.4
    ./configure --prefix=$install_dir/varnish
    make
    make install
    \cp redhat/varnish.sysconfig /etc/sysconfig/varnish
    sed -i 's#VARNISH_VCL_CONF=/etc/varnish/default.vcl#VARNISH_VCL_CONF='$install_dir'/varnish/etc/varnish/varnish.vcl#g' /etc/sysconfig/varnish
    sed -i 's/VARNISH_LISTEN_PORT=6081/VARNISH_LISTEN_PORT=80/g' /etc/sysconfig/varnish
    sed -i 's#VARNISH_STORAGE="file,${VARNISH_STORAGE_FILE},${VARNISH_STORAGE_SIZE}"#VARNISH_STORAGE="malloc,${VARNISH_STORAGE_SIZE}"#g' /etc/sysconfig/varnish
    sed -i 's#-u varnish -g varnish#-u www -g www#g' /etc/sysconfig/varnish
    \cp redhat/varnish.initrc /etc/init.d/varnish
    \cp redhat/varnish_reload_vcl $install_dir/varnish/bin
    sed -i 's#varnishadm#'$install_dir'/varnish/bin/varnishadm#g' $install_dir/varnish/bin/varnish_reload_vcl
    sed -i 's#exec="/usr/sbin/varnishd"#exec="'$install_dir'/varnish/sbin/varnishd"#g' /etc/init.d/varnish
    sed -i 's#reload_exec="/usr/bin/varnish_reload_vcl"#reload_exec="'$install_dir'/varnish/bin/varnish_reload_vcl"#g' /etc/init.d/varnish
    chmod 755 /etc/init.d/varnish
    chkconfig --add varnish
    chkconfig --level 2345 varnish on
    \cp redhat/varnishncsa.initrc /etc/init.d/varnishncsa
    sed -i 's#exec="/usr/bin/varnishncsa"#exec="'$install_dir'/varnish/bin/varnishncsa"#g' /etc/init.d/varnishncsa
    chmod 755 /etc/init.d/varnishncsa
    chkconfig --add varnishncsa
    chkconfig --level 2345 varnishncsa on
    if [ ! -d /home/cache ]; then
        mkdir /home/cache
    fi
    chown -R www:www /home/cache
    if [ ! -d /var/log/varnish ]; then
        mkdir /var/log/varnish
    fi
    if [ ! -d /etc/varnish ]; then
        mkdir /etc/varnish
    fi
    /usr/bin/uuidgen > /etc/varnish/secret
    chmod 0600 /etc/varnish/secret
    cd $install_dir/varnish/etc/varnish
    wget -c $confmirror/varnish.vcl
    /etc/init.d/varnish start
# varnish官网配置可以支持4000-8000 req/s的压力

# net.ipv4.ip_local_port_range = 1024 65536
# net.core.rmem_max=16777216
# net.core.wmem_max=16777216
# net.ipv4.tcp_rmem=4096 87380 16777216
# net.ipv4.tcp_wmem=4096 65536 16777216
# net.ipv4.tcp_fin_timeout = 3
# net.ipv4.tcp_tw_recycle = 1
# net.core.netdev_max_backlog = 30000
# net.ipv4.tcp_no_metrics_save=1
# net.core.somaxconn = 262144
# net.ipv4.tcp_syncookies = 0
# net.ipv4.tcp_max_orphans = 262144
# net.ipv4.tcp_max_syn_backlog = 262144
# net.ipv4.tcp_synack_retries = 2
# net.ipv4.tcp_syn_retries = 2
}
##################################################################### MySQL #####################################################################
function mysql(){
    if [ -d $install_dir/mysql ]; then
        mv $install_dir/mysql $install_dir/mysql.bak
    fi
    if ( ps axu | grep mysqld | grep -v grep ); then
        killall mysqld
    fi
    yum -y install ncurses-devel openssl-devel cmake
    if ( ! id mysql ); then
        groupadd -g 3306 mysql
        useradd -u 3306 -g mysql -M -s /sbin/nologin mysql
    fi
    cd $down_dir
    if [ "$verchoose" = "50" ]; then
        if [ -s mysql-5.1.72.tar.gz ]; then
            echo "mysql-5.1.72.tar.gz [found]"
        else
            echo "Error: mysql-5.1.72.tar.gz not found!!!download now......"
            wget -c $pkgmirror/mysql-5.1.72.tar.gz
        fi
        if [ -s sphinx-2.1.3-release.tar.gz ]; then
            echo "sphinx-2.1.3-release.tar.gz [found]"
        else
            echo "Error: sphinx-2.1.3-release.tar.gz not found!!!download now......"
            wget -c $pkgmirror/sphinx-2.1.3-release.tar.gz
        fi
        tar zxvf mysql-5.1.72.tar.gz
        tar zxvf sphinx-2.1.3-release.tar.gz
        \cp -r sphinx-2.1.3-release/mysqlse mysql-5.1.72/storage/sphinx
        cd mysql-5.1.72
        BUILD/autorun.sh
        ./configure --prefix=$install_dir/mysql --with-extra-charsets=all --enable-thread-safe-client --enable-assembler --with-charset=gbk --with-big-tables --with-readline --with-ssl --with-embedded-server --enable-local-infile --with-plugins=innobase --with-plugins=sphinx
        make
        make install
        \cp support-files/my-large.cnf /etc/my.cnf
        sed -i 's/skip-locking/skip-external-locking/g' /etc/my.cnf
        $install_dir/mysql/bin/mysql_install_db --user=mysql
    elif [ "$verchoose" = "51" ]; then
        if [ -s mysql-5.5.35.tar.gz ]; then
            echo "mysql-5.5.35.tar.gz [found]"
        else
            echo "Error: mysql-5.5.35.tar.gz not found!!!download now......"
            wget -c $pkgmirror/mysql-5.5.35.tar.gz
        fi
        if [ -s coreseek-4.1-beta.tar.gz ]; then
            echo "coreseek-4.1-beta.tar.gz [found]"
        else
            echo "Error: coreseek-4.1-beta.tar.gz not found!!!download now......"
            wget -c $pkgmirror/coreseek-4.1-beta.tar.gz
        fi
        tar zxvf mysql-5.5.35.tar.gz
        tar zxvf coreseek-4.1-beta.tar.gz
        \cp -r coreseek-4.1-beta/csft-4.1/mysqlse mysql-5.5.35/storage/sphinx
        cd mysql-5.5.35
        cmake -DCMAKE_INSTALL_PREFIX=$install_dir/mysql -DMYSQL_DATADIR=$install_dir/mysql/data -DWITH_MYISAM_STORAGE_ENGINE=1 -DWITH_INNOBASE_STORAGE_ENGINE=1 -DWITH_ARCHIVE_STORAGE_ENGINE=1 -DWITH_BLACKHOLE_STORAGE_ENGINE=1 -DENABLED_LOCAL_INFILE=1 -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci -DEXTRA_CHARSETS=all -DMYSQL_TCP_PORT=3306 -DMYSQL_USER=mysql -DWITH_SPHINX_STORAGE_ENGINE=1
        make
        make install
        \cp support-files/my-large.cnf /etc/my.cnf
        sed -i 's/skip-locking/skip-external-locking/g' /etc/my.cnf
        $install_dir/mysql/scripts/mysql_install_db --user=mysql --basedir=$install_dir/mysql --datadir=$install_dir/mysql/data
    elif [ "$verchoose" = "52" ]; then
        if [ -s mysql-5.6.15.tar.gz ]; then
            echo "mysql-5.6.15.tar.gz [found]"
        else
            echo "Error: mysql-5.6.15.tar.gz not found!!!download now......"
            wget -c $pkgmirror/mysql-5.6.15.tar.gz
        fi
        if [ -s sphinx-2.1.3-release.tar.gz ]; then
            echo "sphinx-2.1.3-release.tar.gz [found]"
        else
            echo "Error: sphinx-2.1.3-release.tar.gz not found!!!download now......"
            wget -c $pkgmirror/sphinx-2.1.3-release.tar.gz
        fi
        tar zxvf mysql-5.6.15.tar.gz
        tar zxvf sphinx-2.1.3-release.tar.gz
        \cp -r sphinx-2.1.3-release/mysqlse mysql-5.6.15/storage/sphinx
        cd mysql-5.6.15
        cmake -DCMAKE_INSTALL_PREFIX=$install_dir/mysql -DMYSQL_DATADIR=$install_dir/mysql/data -DWITH_MYISAM_STORAGE_ENGINE=1 -DWITH_INNOBASE_STORAGE_ENGINE=1 -DWITH_ARCHIVE_STORAGE_ENGINE=1 -DWITH_BLACKHOLE_STORAGE_ENGINE=1 -DENABLED_LOCAL_INFILE=1 -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci -DEXTRA_CHARSETS=all -DMYSQL_TCP_PORT=3306 -DMYSQL_USER=mysql -DWITH_SPHINX_STORAGE_ENGINE=1
        make
        make install
        \cp support-files/my-default.cnf /etc/my.cnf
        sed -i 's/skip-locking/skip-external-locking/g' /etc/my.cnf
        $install_dir/mysql/scripts/mysql_install_db --user=mysql --basedir=$install_dir/mysql --datadir=$install_dir/mysql/data
    fi
    \cp support-files/mysql.server /etc/init.d/mysqld
    chmod 755 /etc/init.d/mysqld
    chkconfig --add mysqld
    chkconfig --level 2345 mysqld on
    /etc/init.d/mysqld start
    $install_dir/mysql/bin/mysqladmin -u root password $mysqlrootpwd
    if [ "$verchoose" = "50" ]; then
        cat > /etc/ld.so.conf.d/mysql.conf<<EOF
$install_dir/mysql/lib/mysql
EOF
        ln -sf $install_dir/mysql/include/mysql/* /usr/local/include/
    elif [ "$verchoose" = "51" ]; then
        $install_dir/mysql/bin/mysql -uroot -p$mysqlrootpwd << EOF
install plugin sphinx soname "ha_sphinx.so";
EOF
        cat > /etc/ld.so.conf.d/mysql.conf<<EOF
$install_dir/mysql/lib
EOF
        ln -sf $install_dir/mysql/include/* /usr/local/include/
    elif [ "$verchoose" = "52" ]; then
        cat > /etc/ld.so.conf.d/mysql.conf<<EOF
$install_dir/mysql/lib
EOF
        ln -sf $install_dir/mysql/include/* /usr/local/include/
    fi
#    if [ ! -d /var/lib/mysql ]; then
#        mkdir /var/lib/mysql
#    fi
#    if [ ! -L /var/lib/mysql/mysql.sock ]; then
#        ln -s /tmp/mysql.sock  /var/lib/mysql/mysql.sock
#    fi
    ldconfig
#    cd $down_dir
#    cd sphinx-2.1.2-release
#    ./configure --prefix=$install_dir/sphinx --with-mysql=$install_dir/mysql && make && make install

#   $install_dir/mysql/bin/mysql -uroot -p$mysqlrootpwd << EOF
#use $ftpdb;
#CREATE TABLE mysqld (
#   db_name varchar(64) NOT NULL default '',
#   db_user varchar(64) NOT NULL default '',
#   db_email varchar(64) NOT NULL default '',
#   db_limit_size int(10) NOT NULL default '0',
#   db_has_limit int(10) NOT NULL default '0',
#   db_size_used FLOAT(10) NOT NULL default '0'
#) TYPE=MyISAM;
#EOF
}
##################################################################### PHP #####################################################################
function php(){
    if [ -d $install_dir/php ]; then
        mv $install_dir/php $install_dir/php.bak
    fi
    yum install -y libxml2-devel curl-devel libjpeg-devel gd-devel libpng-devel freetype-devel libc-client-devel openldap-devel libxslt-devel gettext-devel zlib-devel autoconf
    if [ `getconf WORD_BIT` = '32' ] && [ `getconf LONG_BIT` = '64' ] ; then
        \cp -frp /usr/lib64/libjpeg.* /usr/lib/
        \cp -frp /usr/lib64/libpng* /usr/lib/
        \cp -frp /usr/lib64/libldap* /usr/lib/
    fi
    cd $down_dir
    if [ -s libiconv-1.14.tar.gz ]; then
        echo "libiconv-1.14.tar.gz [found]"
    else
        echo "Error: libiconv-1.14.tar.gz not found!!!download now......"
        wget -c $pkgmirror/libiconv-1.14.tar.gz
    fi
    tar zxvf libiconv-1.14.tar.gz
    cd libiconv-1.14
    ./configure --prefix=$install_dir/libiconv
    make
    make install
    cd $down_dir
    if [ -s libmcrypt-2.5.8.tar.gz ]; then
        echo "libmcrypt-2.5.8.tar.gz [found]"
    else
        echo "Error: libmcrypt-2.5.8.tar.gz not found!!!download now......"
        wget -c $pkgmirror/libmcrypt-2.5.8.tar.gz
    fi
    tar zxvf libmcrypt-2.5.8.tar.gz
    cd libmcrypt-2.5.8
    ./configure
    make
    make install
    cd libltdl
    ./configure --enable-ltdl-install
    make
    make install
    cd $down_dir
    if [ -s mhash-0.9.9.9.tar.gz ]; then
        echo "mhash-0.9.9.9.tar.gz [found]"
    else
        echo "Error: mhash-0.9.9.9.tar.gz not found!!!download now......"
        wget -c $pkgmirror/mhash-0.9.9.9.tar.gz
    fi
    tar zxvf mhash-0.9.9.9.tar.gz
    cd mhash-0.9.9.9
    ./configure
    make
    make install
    cat > /etc/ld.so.conf.d/lib.conf<<EOF
/usr/local/lib
/usr/lib64
EOF
    ldconfig
    cd $down_dir
    if [ -s mcrypt-2.6.8.tar.gz ]; then
        echo "mcrypt-2.6.8.tar.gz [found]"
    else
        echo "Error: mcrypt-2.6.8.tar.gz not found!!!download now......"
        wget -c $pkgmirror/mcrypt-2.6.8.tar.gz
    fi
    tar zxvf mcrypt-2.6.8.tar.gz
    cd mcrypt-2.6.8
    ./configure
    make
    make install
#    cd $down_dir
#    if [ `getconf WORD_BIT` = '32' ] && [ `getconf LONG_BIT` = '64' ] ; then
#        if [ -s imapback-2004c1-x86_64.tar.gz ]; then
#            echo "imapback-2004c1-x86_64.tar.gz [found]"
#        else
#            echo "Error: imapback-2004c1-x86_64.tar.gz not found!!!download now......"
#            wget -c $pkgmirror/imapback-2004c1-x86_64.tar.gz
#        fi
#        tar zxvf imapback-2004c1-x86_64.tar.gz
#    else
#        if [ -s imapback-2004c1-x86.tar.gz ]; then
#            echo "imapback-2004c1-x86.tar.gz [found]"
#        else
#            echo "Error: imapback-2004c1-x86.tar.gz not found!!!download now......"
#            wget -c $pkgmirror/imapback-2004c1-x86.tar.gz
#        fi
#        tar zxvf imapback-2004c1-x86.tar.gz
#    fi
#    cd imap-2004c1
#    ./buildit
#    cd c-client
#    if [ ! -d $install_dir/imap-2004c1/lib ]; then
#        mkdir  -p $install_dir/imap-2004c1/lib
#    fi
#    if [ ! -d $install_dir/imap-2004c1/include ]; then
#        mkdir $install_dir/imap-2004c1/include
#    fi
#    \cp *.h $install_dir/imap-2004c1/include
#    \cp *.c $install_dir/imap-2004c1/lib
#    \cp c-client.a $install_dir/imap-2004c1/lib
#    if [ ! -L $install_dir/imap-2004c1/libc-client.a ]; then
#        ln -s $install_dir/imap-2004c1/lib/c-client.a $install_dir/imap-2004c1/libc-client.a
#    fi
    cd $down_dir
    if [ "$verchoose" = "63" ]; then
        phpextdir=no-debug-non-zts-20121212
        if [ -s php-5.5.6.tar.gz ]; then
            echo "php-5.5.6.tar.gz [found]"
        else
            echo "Error: php-5.5.6.tar.gz not found!!!download now......"
            wget -c $pkgmirror/php-5.5.6.tar.gz
        fi
        tar zxvf php-5.5.6.tar.gz
        cd php-5.5.6
    elif [ "$verchoose" = "62" ]; then
        phpextdir=no-debug-non-zts-20100525
        if [ -s php-5.4.22.tar.gz ]; then
            echo "php-5.4.22.tar.gz [found]"
        else
            echo "Error: php-5.4.22.tar.gz not found!!!download now......"
            wget -c $pkgmirror/php-5.4.22.tar.gz
        fi
        tar zxvf php-5.4.22.tar.gz
        cd php-5.4.22
    elif [ "$verchoose" = "61" ]; then
        phpextdir=no-debug-non-zts-20090626
        if [ -s php-5.3.27.tar.gz ]; then
            echo "php-5.3.27.tar.gz [found]"
        else
            echo "Error: php-5.3.27.tar.gz not found!!!download now......"
            wget -c $pkgmirror/php-5.3.27.tar.gz
        fi
        tar zxvf php-5.3.27.tar.gz
        cd php-5.3.27
    elif [ "$verchoose" = "60" ]; then
        phpextdir=no-debug-non-zts-20060613
        if [ -s php-5.2.17.tar.gz ]; then
            echo "php-5.2.17.tar.gz [found]"
        else
            echo "Error: php-5.2.17.tar.gz not found!!!download now......"
            wget -c $pkgmirror/php-5.2.17.tar.gz
        fi
        tar zxvf php-5.2.17.tar.gz
        if [ ! -d $install_dir/apache ]; then
            if [ -s php-5.2.17-fpm-0.5.14.diff.gz ]; then
                echo "php-5.2.17-fpm-0.5.14.diff.gz [found]"
            else
                echo "Error: php-5.2.17-fpm-0.5.14.diff.gz not found!!!download now......"
                wget -c $pkgmirror/php-5.2.17-fpm-0.5.14.diff.gz
            fi
            gzip -cd php-5.2.17-fpm-0.5.14.diff.gz | patch -d php-5.2.17 -p1
        fi
        cd php-5.2.17
    fi
#  --with-imap=$install_dir/imap-2004c1 --with-imap-ssl 
    if [ -d $install_dir/apache ]; then
        if [ "$verchoose" = "63" ]; then
            ./configure --prefix=$install_dir/php --with-config-file-path=$install_dir/php/etc --with-apxs2=$install_dir/apache/bin/apxs --with-mysql=$install_dir/mysql --with-mysqli=$install_dir/mysql/bin/mysql_config --with-iconv-dir=$install_dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-mbstring --with-mcrypt --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --without-pear --with-gettext --with-xsl --with-ldap --with-ldap-sasl --enable-calendar --enable-wddx --enable-opcache
        elif ( ! ./configure --prefix=$install_dir/php --with-config-file-path=$install_dir/php/etc --with-apxs2=$install_dir/apache/bin/apxs --with-mysql=$install_dir/mysql --with-mysqli=$install_dir/mysql/bin/mysql_config --with-iconv-dir=$install_dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-discard-path --enable-magic-quotes --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-mbstring --with-mcrypt --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --without-pear --with-gettext --with-mime-magic --with-xsl --with-ldap --with-ldap-sasl --enable-calendar --enable-wddx ); then
            ./configure --prefix=$install_dir/php --with-config-file-path=$install_dir/php/etc --with-apxs2=$install_dir/apache/bin/apxs --with-mysql=$install_dir/mysql --with-mysqli=$install_dir/mysql/bin/mysql_config --with-iconv-dir=$isntall_dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --enable-discard-path --enable-magic-quotes --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-mbstring --with-mcrypt --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --without-pear --with-gettext --with-mime-magic --with-xsl --with-ldap --with-ldap-sasl --enable-calendar --enable-wddx
        fi
        make
        make install
        mkdir -p $install_dir/php/etc/
    elif [ -d $install_dir/nginx ]; then
        if ( ps aux | grep php-cgi | grep -v grep ); then
            killall php-cgi
        fi
        if ( ps aux | grep php-fpm | grep -v grep ); then
            killall php-fpm
        fi
        if [ "$verchoose" = "63" ]; then
            ./configure --prefix=$install_dir/php --with-config-file-path=$install_dir/php/etc --with-mysql=$install_dir/mysql --with-mysqli=$install_dir/mysql/bin/mysql_config --with-iconv-dir=$install_dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-mbstring --with-mcrypt --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --without-pear --with-gettext --with-xsl --with-ldap --with-ldap-sasl --enable-calendar --enable-wddx --enable-opcache  --enable-fastcgi --enable-force-cgi-redirect --enable-fpm --with-fpm-user=www --with-fpm-group=www
        elif ( ! ./configure --prefix=$install_dir/php --with-config-file-path=$install_dir/php/etc --with-mysql=$install_dir/mysql/ --with-mysqli=$install_dir/mysql/bin/mysql_config --with-iconv-dir=$install_dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-discard-path --enable-magic-quotes --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-mbstring --with-mcrypt  --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --without-pear --with-gettext --with-mime-magic --with-xsl --with-ldap --with-ldap-sasl --enable-calendar --enable-wddx --enable-fastcgi --enable-force-cgi-redirect --enable-fpm --with-fpm-user=www --with-fpm-group=www ); then
            ./configure --prefix=$install_dir/php --with-config-file-path=$install_dir/php/etc --with-mysql=$install_dir/mysql/ --with-mysqli=$install_dir/mysql/bin/mysql_config --with-iconv-dir=$install_dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --enable-discard-path --enable-magic-quotes --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-mbstring --with-mcrypt  --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --without-pear --with-gettext --with-mime-magic --with-xsl --with-ldap --with-ldap-sasl --enable-calendar --enable-wddx --enable-fastcgi --enable-force-cgi-redirect --enable-fpm --with-fpm-user=www --with-fpm-group=www
        fi
        make
        make install
        if [ -f $install_dir/php/etc/php-fpm.conf.default ]; then
            \cp $install_dir/php/etc/php-fpm.conf.default $install_dir/php/etc/php-fpm.conf
        fi
        sed -i 's/;pid = run\/php-fpm.pid/pid = run\/php-fpm.pid/g' $install_dir/php/etc/php-fpm.conf
        sed -i 's/;pm.start_servers = 20/pm.start_servers = 20/g' $install_dir/php/etc/php-fpm.conf
        sed -i 's/;pm.min_spare_servers = 5/pm.min_spare_servers = 5/g' $install_dir/php/etc/php-fpm.conf
        sed -i 's/;pm.max_spare_servers = 35/pm.max_spare_servers = 35/g' $install_dir/php/etc/php-fpm.conf
        sed -i 's#<!--\s<value name="user">nobody</value>.*#<value name="user">www</value>#g' $install_dir/php/etc/php-fpm.conf
        sed -i 's#<!--\s<value name="group">nobody</value>.*#<value name="group">www</value>#g' $install_dir/php/etc/php-fpm.conf
        if [ -f sapi/cgi/fpm/php-fpm ]; then
            \cp sapi/cgi/fpm/php-fpm /etc/init.d/php-fpm
            sed -i '2i \# chkconfig: 2345 10 90\n# description: php-fpm' /etc/init.d/php-fpm
        elif [ -f sapi/fpm/init.d.php-fpm ]; then
            \cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
        fi
        chmod 755 /etc/init.d/php-fpm
        chkconfig --add php-fpm
        chkconfig --level 2345 php-fpm on
    fi
    if [ -f php.ini-dist ]; then
        \cp php.ini-dist $install_dir/php/etc/php.ini
    elif [ -f php.ini-development ]; then
        \cp php.ini-development $install_dir/php/etc/php.ini
    fi
    cd $down_dir
    if [ -s memcache-2.2.7.tgz ]; then
        echo "memcache-2.2.7.tgz [found]"
    else
        echo "Error: memcache-2.2.7.tgz not found!!!download now......"
        wget -c $pkgmirror/memcache-2.2.7.tgz
    fi
    tar xvf memcache-2.2.7.tgz
    cd memcache-2.2.7
    $install_dir/php/bin/phpize
    ./configure --with-php-config=$install_dir/php/bin/php-config
    make
    make install
    cd $down_dir
    if [ -s PDO_MYSQL-1.0.2.tgz ]; then
        echo "PDO_MYSQL-1.0.2.tgz [found]"
    else
        echo "Error: PDO_MYSQL-1.0.2.tgz not found!!!download now......"
        wget -c $pkgmirror/PDO_MYSQL-1.0.2.tgz
    fi
    tar xvf PDO_MYSQL-1.0.2.tgz
    cd PDO_MYSQL-1.0.2
    $install_dir/php/bin/phpize
    ./configure --with-php-config=$install_dir/php/bin/php-config --with-pdo-mysql=$install_dir/mysql
    make
    make install
    sed -i 's#extension_dir = "./"#extension_dir = "'$install_dir'/php/lib/php/extensions/'$phpextdir'/"\nextension = "memcache.so"\nextension = "pdo_mysql.so"\n#' $install_dir/php/etc/php.ini
    sed -i 's#output_buffering = Off#output_buffering = On#' $install_dir/php/etc/php.ini
    sed -i 's/;date.timezone =/date.timezone = PRC/g' $install_dir/php/etc/php.ini
    sed -i 's/short_open_tag = Off/short_open_tag = On/g' $install_dir/php/etc/php.ini
    sed -i 's/; cgi.fix_pathinfo=0/cgi.fix_pathinfo=0/g' $install_dir/php/etc/php.ini
#   sed -i 's/session.auto_start = 0/session.auto_start = 1/g' $install_dir/php/etc/php.ini
    sed -i 's#;session.save_path = "/tmp"#session.save_path = "/tmp"#' $install_dir/php/etc/php.ini
    cd $down_dir
    if [ -s zendopcache-7.0.2.tgz ]; then
        echo "zendopcache-7.0.2.tgz [found]"
    else
        echo "Error: zendopcache-7.0.2.tgz not found!!!download now......"
        wget -c $pkgmirror/zendopcache-7.0.2.tgz
    fi
    tar xvf zendopcache-7.0.2.tgz
    cd zendopcache-7.0.2
    $install_dir/php/bin/phpize
    ./configure --with-php-config=$install_dir/php/bin/php-config
    make
    make install
    cat >>$install_dir/php/etc/php.ini<<EOF
zend_extension=$install_dir/php/lib/php/extensions/$phpextdir/opcache.so
opcache.enable_cli=1
opcache.memory_consumption=128      //共享内存大小, 这个根据你们的需求可调
opcache.interned_strings_buffer=8   //interned string的内存大小, 也可调
opcache.max_accelerated_files=4000  //最大缓存的文件数目
opcache.revalidate_freq=60          //60s检查一次文件更新
opcache.fast_shutdown=1             //打开快速关闭, 打开这个在PHP Request Shutdown的时候，会收内存的速度会提高
opcache.save_comments=0             //不保存文件/函数的注释
EOF
    if [ -d $install_dir/apache ]; then
        if ( ! cat $install_dir/apache/conf/httpd.conf | grep "x-httpd-php" ); then
            sed -i '/AddType application\/x-gzip .gz .tgz/ a AddType application\/x-httpd-php .php' $install_dir/apache/conf/httpd.conf
        fi
        if ( ! cat $install_dir/apache/conf/httpd.conf | grep "index.php" ); then
            sed -i 's/DirectoryIndex index.html/DirectoryIndex index.html index.php/g' $install_dir/apache/conf/httpd.conf
        fi
        /etc/init.d/apache restart
    elif [ -d $install_dir/nginx ]; then
        /etc/init.d/php-fpm start
    fi
}
##################################################################### Zend #####################################################################
function zend(){
    if [ "$verchoose" = "63" ]; then
        cat >>$install_dir/php/etc/php.ini<<EOF
zend_extension=opcache.so
opcache.enable_cli=1
opcache.memory_consumption=128      //共享内存大小, 这个根据你们的需求可调
opcache.interned_strings_buffer=8   //interned string的内存大小, 也可调
opcache.max_accelerated_files=4000  //最大缓存的文件数目
opcache.revalidate_freq=60          //60s检查一次文件更新
opcache.fast_shutdown=1             //打开快速关闭, 打开这个在PHP Request Shutdown的时候
                                    //   会收内存的速度会提高
opcache.save_comments=0             //不保存文件/函数的注释
EOF
    elif [ "$verchoose" = "62" ]; then
        if [ `getconf WORD_BIT` = '32' ] && [ `getconf LONG_BIT` = '64' ] ; then
            if [ -s ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64.tar.gz ]; then
                echo "ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64.tar.gz [found]"
            else
                echo "Error: ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64.tar.gz not found!!!download now......"
                wget -c $pkgmirror/ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64.tar.gz
            fi
          	tar zxvf ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64.tar.gz
          	\cp ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64/php-5.4.x/ZendGuardLoader.so $install_dir/php/lib/php/extensions/$phpextdir/
        else
            if [ -s ZendGuardLoader-70429-PHP-5.4-linux-glibc23-i386.tar.gz ]; then
                echo "ZendGuardLoader-70429-PHP-5.4-linux-glibc23-i386.tar.gz [found]"
            else
                echo "Error: ZendGuardLoader-70429-PHP-5.4-linux-glibc23-i386.tar.gz not found!!!download now......"
                wget -c $pkgmirror/ZendGuardLoader-70429-PHP-5.4-linux-glibc23-i386.tar.gz
            fi
            tar zxvf ZendGuardLoader-70429-PHP-5.4-linux-glibc23-i386.tar.gz
	          \cp ZendGuardLoader-70429-PHP-5.4-linux-glibc23-i386/php-5.4.x/ZendGuardLoader.so $install_dir/php/lib/php/extensions/$phpextdir/
        fi
        cat >>$install_dir/php/etc/php.ini<<EOF
;eaccelerator

;ionCube

[Zend Guard Loader]
zend_extension="$install_dir/php/lib/php/extensions/$phpextdir/ZendGuardLoader.so"
EOF
    elif [ "$verchoose" = "61" ]; then
        if [ `getconf WORD_BIT` = '32' ] && [ `getconf LONG_BIT` = '64' ] ; then
            if [ -s ZendGuardLoader-php-5.3-linux-glibc23-x86_64.tar.gz ]; then
                echo "ZendGuardLoader-php-5.3-linux-glibc23-x86_64.tar.gz [found]"
            else
                echo "Error: ZendGuardLoader-php-5.3-linux-glibc23-x86_64.tar.gz not found!!!download now......"
                wget -c $pkgmirror/ZendGuardLoader-php-5.3-linux-glibc23-x86_64.tar.gz
            fi
          	tar zxvf ZendGuardLoader-php-5.3-linux-glibc23-x86_64.tar.gz
          	\cp ZendGuardLoader-php-5.3-linux-glibc23-x86_64/php-5.3.x/ZendGuardLoader.so $install_dir/php/lib/php/extensions/$phpextdir/
        else
            if [ -s ZendGuardLoader-php-5.3-linux-glibc23-i386.tar.gz ]; then
                echo "ZendGuardLoader-php-5.3-linux-glibc23-i386.tar.gz [found]"
            else
                echo "Error: ZendGuardLoader-php-5.3-linux-glibc23-i386.tar.gz not found!!!download now......"
                wget -c $pkgmirror/ZendGuardLoader-php-5.3-linux-glibc23-i386.tar.gz
            fi
            tar zxvf ZendGuardLoader-php-5.3-linux-glibc23-i386.tar.gz
	          \cp ZendGuardLoader-php-5.3-linux-glibc23-i386/php-5.3.x/ZendGuardLoader.so $install_dir/php/lib/php/extensions/$phpextdir/
        fi
        cat >>$install_dir/php/etc/php.ini<<EOF
;eaccelerator

;ionCube

[Zend Guard Loader]
zend_extension="$install_dir/php/lib/php/extensions/$phpextdir/ZendGuardLoader.so"
EOF
    elif [ "$verchoose" = "60" ]; then
        if [ `getconf WORD_BIT` = '32' ] && [ `getconf LONG_BIT` = '64' ] ; then
            wget -c $pkgmirror/ZendOptimizer-3.3.9-linux-glibc23-x86_64.tar.gz
            tar zxvf ZendOptimizer-3.3.9-linux-glibc23-x86_64.tar.gz
	          \cp ZendOptimizer-3.3.9-linux-glibc23-x86_64/data/5_2_x_comp/ZendOptimizer.so $install_dir/php/lib/php/extensions/$phpextdir/
        else
            wget -c $pkgmirror/ZendOptimizer-3.3.9-linux-glibc23-i386.tar.gz
          	tar zxvf ZendOptimizer-3.3.9-linux-glibc23-i386.tar.gz
          	\cp ZendOptimizer-3.3.9-linux-glibc23-i386/data/5_2_x_comp/ZendOptimizer.so $install_dir/php/lib/php/extensions/$phpextdir/
        fi
        cat >>$install_dir/php/etc/php.ini<<EOF
;eaccelerator

;ionCube

[Zend Optimizer] 
zend_optimizer.optimization_level=1
zend_extension="$install_dir/php/lib/php/extensions/$phpextdir/ZendOptimizer.so" 
EOF
    fi
}
##################################################################### Pureftp #####################################################################
function pureftp(){
    if [ -d $install_dir/pureftpd ]; then
        mv $install_dir/pureftpd $install_dir/pureftpd.bak
    fi
    if ( ps axu | grep pure-ftpd | grep -v grep ); then
        killall pure-ftpd
    fi
    cd $down_dir
    if [ -s pure-ftpd-1.0.36.tar.gz ]; then
        echo "pure-ftpd-1.0.36.tar.gz [found]"
    else
        echo "Error: pure-ftpd-1.0.36.tar.gz not found!!!download now......"
        wget -c $pkgmirror/pure-ftpd-1.0.36.tar.gz
    fi
    tar zxvf pure-ftpd-1.0.36.tar.gz
    cd pure-ftpd-1.0.36
    ./configure --prefix=$install_dir/pureftpd --with-mysql=$install_dir/mysql --with-quotas --with-cookie --with-virtualhosts --with-virtualchroot --with-diraliases --with-sysquotas --with-ratios --with-altlog --with-paranoidmsg --with-shadow --with-welcomemsg  --with-throttling --with-uploadscript --with-language=simplified-chinese --with-ftpwho
    make
    make install
    \cp configuration-file/pure-config.pl $install_dir/pureftpd/sbin/
    chmod 755 $install_dir/pureftpd/sbin/pure-config.pl
    sed -i '/\/usr\/sbin\/pure-ftpd/a\        '$install_dir'/pureftpd/sbin/pure-ftpd' $install_dir/pureftpd/sbin/pure-config.pl
    if [ ! -d $install_dir/pureftpd/etc ]; then
        mkdir $install_dir/pureftpd/etc
    fi
    \cp configuration-file/pure-ftpd.conf $install_dir/pureftpd/etc/
    \cp pureftpd* $install_dir/pureftpd/etc/
    echo "AllowOverwrite		on" >> $install_dir/pureftpd/etc/pure-ftpd.conf
    echo "AllowStoreRestart	on" >> $install_dir/pureftpd/etc/pure-ftpd.conf
    echo "MySQLConfigFile               $install_dir/pureftpd/etc/pureftpd-mysql.conf" >> $install_dir/pureftpd/etc/pure-ftpd.conf
    sed -i 's/NoAnonymous                 no/NoAnonymous                 yes/g' $install_dir/pureftpd/etc/pure-ftpd.conf
    sed -i 's/MaxClientsPerIP             8/MaxClientsPerIP             50/g' $install_dir/pureftpd/etc/pure-ftpd.conf
    sed -i 's/MYSQLUser       root/MYSQLUser       '$ftpdbusername'/g' $install_dir/pureftpd/etc/pureftpd-mysql.conf
    sed -i 's/MYSQLPassword   rootpw/MYSQLPassword   '$ftpdbpasswd'/g' $install_dir/pureftpd/etc/pureftpd-mysql.conf
    sed -i 's/MYSQLDatabase   pureftpd/MYSQLDatabase   '$ftpdb'/g' $install_dir/pureftpd/etc/pureftpd-mysql.conf
    sed -i 's/cleartext/md5/g' $install_dir/pureftpd/etc/pureftpd-mysql.conf
    sed -i "s:WHERE User='\\\L':& AND Status='1':" $install_dir/pureftpd/etc/pureftpd-mysql.conf
    sed -i "s/users/ftpd/g" $install_dir/pureftpd/etc/pureftpd-mysql.conf
    echo "MySQLGetQTAFS SELECT QuotaFiles FROM ftpd WHERE User='\L' AND Status='1'" >> $install_dir/pureftpd/etc/pureftpd-mysql.conf
    echo "MySQLGetQTASZ SELECT QuotaSize FROM ftpd WHERE User='\L' AND Status='1'" >> $install_dir/pureftpd/etc/pureftpd-mysql.conf
    echo "MySQLGetRatioUL SELECT ULRatio FROM ftpd WHERE User='\L' AND Status='1'" >> $install_dir/pureftpd/etc/pureftpd-mysql.conf
    echo "MySQLGetRatioDL SELECT DLRatio FROM ftpd WHERE User='\L' AND Status='1'" >> $install_dir/pureftpd/etc/pureftpd-mysql.conf
    echo "MySQLGetBandwidthUL SELECT ULBandwidth FROM ftpd WHERE User='\L' AND Status='1'" >> $install_dir/pureftpd/etc/pureftpd-mysql.conf
    echo "MySQLGetBandwidthDL SELECT DLBandwidth FROM ftpd WHERE User='\L' AND Status='1'" >> $install_dir/pureftpd/etc/pureftpd-mysql.conf
    \cp contrib/redhat.init /etc/init.d/pureftpd
    sed -i 's#/usr/local/sbin/#'$install_dir'/pureftpd/sbin/#g' /etc/init.d/pureftpd
    sed -i 's#/etc/pure-ftpd.conf#'$install_dir'/pureftpd/etc/pure-ftpd.conf#g' /etc/init.d/pureftpd
    chmod 755 /etc/init.d/pureftpd
    chkconfig --add pureftpd
    chkconfig --level 2345 pureftpd on
    /etc/init.d/pureftpd start
    $install_dir/mysql/bin/mysql -uroot -p$mysqlrootpwd << EOF
CREATE DATABASE if not exists ${ftpdb};
grant all privileges on ${ftpdb}.* to ${ftpdbusername}@localhost identified by '${ftpdbpasswd}';
use ${ftpdb};
CREATE TABLE if not exists ftpd (
    id int(32) unsigned NOT NULL auto_increment,
    User varchar(16) NOT NULL default '',
    Password varchar(64) NOT NULL default '',
    Uid varchar(11) NOT NULL default '8080',
    Gid varchar(11) NOT NULL default '8080',
    Dir varchar(128) NOT NULL default '',
    QuotaSize smallint(5) NOT NULL default '0',
    UseSize float(5) NOT NULL default '0',
    QuotaFiles int(11) NOT NULL default '0',
    ULBandwidth smallint(5) NOT NULL default '0',
    DLBandwidth smallint(5) NOT NULL default '0',
    ULRatio smallint(6) NOT NULL default '0',
    DLRatio smallint(6) NOT NULL default '0',
    comment tinytext NOT NULL,
    ipaccess varchar(15) NOT NULL default '*',
    status enum('0','1') NOT NULL default '1',
    create_date datetime NOT NULL default '0000-00-00 00:00:00',
    modify_date datetime NOT NULL default '0000-00-00 00:00:00',
    PRIMARY KEY (id,User),
    UNIQUE KEY User (User)
) AUTO_INCREMENT=5 ;
EOF
}
##################################################################### BIND #####################################################################
function bind(){
    if [ -d $install_dir/bind ]; then
        mv $install_dir/bind $install_dir/bind.bak
    fi
    if ( ps axu | grep named | grep -v grep ); then
        killall named
    fi
    yum install openssl-devel
    if ( ! id bind ); then
        groupadd -g 5353 bind
        useradd -u 5353 -g bind -M -s /sbin/nologin bind
    fi
    cd $down_dir
    if [ -s bind-9.8.6-P1.tar.gz ]; then
        echo "bind-9.8.6-P1.tar.gz [found]"
    else
        echo "Error: bind-9.8.6-P1.tar.gz not found!!!download now......"
        wget -c $pkgmirror/bind-9.8.6-P1.tar.gz
    fi
    tar zxvf bind-9.8.6-P1.tar.gz
    cd bind-9.8.6-P1
    if [ "$verchoose" = "80" ]; then
        ./configure --prefix=$install_dir/bind --enable-threads --enable-largefile --enable-ipv6
    elif [ "$verchoose" = "81" ]; then
        $install_dir/mysql/bin/mysql -uroot -p$mysqlrootpwd << EOF
CREATE DATABASE if not exists dns;
grant all privileges on ${dnsdb}.* to ${dnsdbusername}@localhost identified by '${dnsdbpasswd}';
use dns;
DROP TABLE IF EXISTS dns_records; 
CREATE TABLE IF NOT EXISTS dns_records (
    id int(10) unsigned NOT NULL auto_increment,
    bid int(10) default NULL,
    zone varchar(255) NOT NULL,
    host varchar(255) NOT NULL default '@',
    type enum('MX','CNAME','NS','SOA','A','TXT','PTR') NOT NULL,
    data varchar(255) default NULL,
    ttl int(11) NOT NULL default '600',
    view char(20) default 'DF',
    mx_priority int(11) default NULL,
    refresh int(11) NOT NULL default '600',
    retry int(11) NOT NULL default '3600',
    expire int(11) NOT NULL default '86400',
    minimum int(11) NOT NULL default '3600',
    serial bigint(20) NOT NULL default '1200000000',
    resp_person varchar(64) NOT NULL default 'root.ptgdc.net.',
    primary_ns varchar(64) NOT NULL default 'ns3.ptcdn.com.',
    data_count int(11) NOT NULL default '0',
    PRIMARY KEY  (id),
    KEY type (type),
    KEY host (host),
    KEY zone (zone)
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
EOF
        ./configure --prefix=$install_dir/bind --with-dlz-mysql=$install_dir/mysql --enable-threads=no --enable-largefile --with-openssl=/usr
    fi
    make
    make install
    cd $install_dir/bind/etc
    ../sbin/rndc-confgen > rndc.conf
    ../sbin/dnssec-keygen -a hmac-md5 -b 128 -n HOST cu
    cd /etc/init.d
    if [ -f named ]; then
        rm -f named
    fi
    wget -c $sptmirror/named
    sed -i 's#install_dir#'$install_dir'#g' named
    chmod 755 named
    chkconfig --add named
    chkconfig --level 2345 named on
    mkdir $install_dir/bind/var/working
    chown -R bind:bind $install_dir/bind/var
    if [ ! -d /var/log/named ]; then
        mkdir /var/log/named
    fi
    chown bind:bind /var/log/named
    cd $install_dir/bind/etc
    wget -c $confmirror/ip.tar.gz
    tar zxvf ip.tar.gz
    rm -f ip.tar.gz
    if [ "$verchoose" = "80" ]; then
        wget -c $confmirror/named-master.conf -O named.conf
        wget -c $confmirror/any.ptgdc.net.zone
    elif [ "$verchoose" = "81" ]; then
        wget -c $confmirror/named-mysql.conf -O named.conf
        sed -i 's/dnsdb/'$dnsdb'/g' named.conf
        sed -i 's/dnsuser/'$dnsdbusername'/g' named.conf
        sed -i 's/dnspass/'$dnsdbpasswd'/g' named.conf
    fi
    sed -i 's#install_dir#'$install_dir'#g' named.conf
    /etc/init.d/named start
}
##################################################################### nagios #####################################################################
function nagios(){
    if [ -d $install_dir/nagios ]; then
        mv $install_dir/nagios $install_dir/nagios.bak
    fi
    yum -y install openssl-devel
    if ( ps aux | grep nagios | grep -v grep ); then
        killall nagios
        killall nrpe
    fi
    if ( ! id nagios ); then
        groupadd -g 5666 nagios
        useradd -g nagios -M -s /sbin/nologin -u 5666 nagios
    fi
    if ( ! cat /etc/group | grep nagcmd | grep -v grep ); then
        groupadd nagcmd
        usermod -g nagcmd nagios
    fi
    cd $down_dir
    if [ -s nagios-4.0.2.tar.gz ]; then
        echo "nagios-4.0.2.tar.gz [found]"
    else
        echo "Error: nagios-4.0.2.tar.gz not found!!!download now......"
        wget -c $pkgmirror/nagios-4.0.2.tar.gz
    fi
    tar zxvf nagios-4.0.2.tar.gz
    cd nagios
    ./configure --prefix=$install_dir/nagios --with-nagios-group=nagios --with-nagios-user=nagios --with-command-group=nagcmd --with-gd-lib=/usr/lib --with-gd-inc=/usr/include
    make all
    make install
    make install-init
    make install-config
    make install-commandmode
    chkconfig --add nagios
    chkconfig --level 2345 nagios on
    sed -i 's/use_authentication=1/use_authentication=0/g' $install_dir/nagios/etc/cgi.cfg
    cd $down_dir
    if [ -s nagios-plugins-1.5.tar.gz ]; then
        echo "nagios-plugins-1.5.tar.gz [found]"
    else
        echo "Error: nagios-plugins-1.5.tar.gz not found!!!download now......"
        wget -c $pkgmirror/nagios-plugins-1.5.tar.gz
    fi
    tar zxvf nagios-plugins-1.5.tar.gz
    cd nagios-plugins-1.5
    ./configure --prefix=$install_dir/nagios --with-nagios-user=nagios --with-nagios-group=nagios
    make
    make install
    cd $down_dir
    if [ -s nrpe-2.15.tar.gz ]; then
        echo "nrpe-2.15.tar.gz [found]"
    else
        echo "Error: nrpe-2.15.tar.gz not found!!!download now......"
        wget -c $pkgmirror/nrpe-2.15.tar.gz
    fi
    tar zxvf nrpe-2.15.tar.gz
    cd nrpe-2.15
    ./configure --prefix=$install_dir/nagios
    make all
    make install-plugin
    make install-daemon
    make install-daemon-config
    \cp init-script /etc/init.d/nrpe
    chmod 755 nrpe
    chkconfig --add nrpe
    chkconfig --level 2345 nrpe on
    /etc/init.d/nrpe start
    /etc/init.d/nagios start
    echo 'admin:ddp2S.gHWT.ow' > $install_dir/nagios/etc/.htpasswd
    if [ -d $install_dir/apache ] ; then
        cat << EOF > $install_dir/apache/conf/nagios.conf
Listen 88
NameVirtualHost *:88
ScriptAlias /nagios/cgi-bin "$install_dir/nagios/sbin"
Alias /nagios "$install_dir/nagios/share"
<VirtualHost *:88>
    ServerName *
    DocumentRoot $install_dir/nagios/share
    <Directory "$install_dir/nagios/sbin">
        Options ExecCGI
        AllowOverride None
        Order allow,deny
        Allow from all
        AuthName "Nagios Access"
        AuthType Basic
        AuthUserFile $install_dir/nagios/etc/.htpasswd
        Require valid-user
    </Directory>
    <Directory "$install_dir/nagios/share">
        Options None
        AllowOverride None
        Order allow,deny
        Allow from all
        AuthName "Nagios Access"
        AuthType Basic
        AuthUserFile $install_dir/nagios/etc/.htpasswd
        Require valid-user
    </Directory>
</VirtualHost>
EOF
        if ( ! cat $install_dir/apache/conf/httpd.conf | grep nagios ); then
            echo "Include $install_dir/apache/conf/nagios.conf" >> $install_dir/apache/conf/httpd.conf
            /etc/init.d/apache restart
        fi
    elif [ -d $install_dir/nginx ]; then
        cat << EOF > $install_dir/nginx/conf/nagios.conf
    server {
        listen 88;
        server_name _;
        index index.php index.html index.htm;
        access_log off;
        root $install_dir/nagios/share;
        auth_basic "Nagios Access";  
        auth_basic_user_file $install_dir/nagios/etc/.htpasswd;  
        location /nagios/ {
            alias $install_dir/nagios/share/;
        }
        location ~ .*\.(php|php5)?$ {  
            fastcgi_pass  127.0.0.1:9000;  
            fastcgi_index index.php;  
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;  
            include fastcgi_params;  
        }  
        location ~ \.cgi$ {
            rewrite ^/nagios/cgi-bin/(.*)\.cgi /$1.cgi break;
            fastcgi_index index.cgi;
            fastcgi_pass unix:$install_dir/nginx/logs/nginx-fcgi.sock;
            fastcgi_param SCRIPT_FILENAME $install_dir/nagios/sbin$fastcgi_script_name;
            fastcgi_param HTTP_ACCEPT_LANGUAGE zh-cn;
            include fastcgi_params;
        }
        location ~ \.pl$ {
            fastcgi_pass  unix:/export/servers/nginx/logs/nginx-fcgi.sock;
            fastcgi_index index.pl;
            fastcgi_param SCRIPT_FILENAME $install_dir/nagios/sbin$fastcgi_script_name;
            include fastcgi_params;
        }
    }
EOF
        if ( ! cat $install_dir/nginx/conf/nginx.conf | grep nagios ); then
            sed -i '$i\    include '$install_dir'/nginx/conf/nagios.conf;' $install_dir/nginx/conf/nginx.conf
            /etc/init.d/nginx restart
        fi
    fi
}
##################################################################### NRPE And Snmp #####################################################################
function nrpe(){
    if [ -d $install_dir/nagios ]; then
        mv $install_dir/nagios $install_dir/nagios.bak
    fi
    if ( ps aux | grep nrpe | grep -v grep ); then
        killall nrpe
    fi
    yum -y install openssl-devel
    if ( ! id nagios ); then
        groupadd nagios
        useradd -g nagios -M -s /sbin/nologin nagios
    fi
    cd $down_dir
    if [ -s nagios-plugins-1.5.tar.gz ]; then
        echo "nagios-plugins-1.5.tar.gz [found]"
    else
        echo "Error: nagios-plugins-1.5.tar.gz not found!!!download now......"
        wget -c $pkgmirror/nagios-plugins-1.5.tar.gz
    fi
    tar zxvf nagios-plugins-1.5.tar.gz
    cd nagios-plugins-1.5
    ./configure --with-nagios-user=nagios --with-nagios-group=nagios
    make
    make install
    cd $down_dir
    if [ -s nrpe-2.15.tar.gz ]; then
        echo "nrpe-2.15.tar.gz [found]"
    else
        echo "Error: nrpe-2.15.tar.gz not found!!!download now......"
        wget -c $pkgmirror/nrpe-2.15.tar.gz
    fi
    tar zxvf nrpe-2.15.tar.gz
    cd nrpe-2.15
    ./configure
    make all
    make install-plugin
    make install-daemon
    make install-daemon-config
    \cp init-script /etc/init.d/nrpe
    chmod 755 nrpe
    chkconfig --add nrpe
    chkconfig --level 2345 nrpe on
    /etc/init.d/nrpe start
    sed -i 's/com2sec notConfigUser  default       public/com2sec notConfigUser  default       ptserver/g' /etc/snmp/snmpd.conf
    sed -i 's/access  notConfigGroup ""      any       noauth    exact  systemview none none/access  notConfigGroup ""      any       noauth    exact  all none none/g' /etc/snmp/snmpd.conf
    sed -i 's/#view all    included  .1                               80/view all    included  .1                               80/g' /etc/snmp/snmpd.conf
    sed -i 's/#view mib2   included  .iso.org.dod.internet.mgmt.mib-2 fc/view mib2   included  .iso.org.dod.internet.mgmt.mib-2 fc/g' /etc/snmp/snmpd.conf
    chkconfig --level 2345 snmpd on
    /etc/init.d/snmpd start
}
##################################################################### Zabbix #####################################################################
 function zabbix(){
    if [ -d $install_dir/zabbix ]; then
        mv $install_dir/zabbix $install_dir/zabbix.bak
    fi
    yum -y install libcurl-devel net-snmp-devel net-snmp
    if ( ps aux | grep zabbix_server | grep -v grep ); then
        killall zabbix_server
    fi
    if ( ps aux | grep zabbix_agentd | grep -v grep ); then
        killall zabbix_agentd
    fi
    if ( ! id zabbix ); then
        groupadd -g 10051 zabbix
        useradd -g zabbix -M -s /sbin/nologin -u 10051 zabbix
    fi
    cd $down_dir
    if [ -s zabbix-2.2.1.tar.gz ]; then
        echo "zabbix-2.2.1.tar.gz [found]"
    else
        echo "Error: zabbix-2.2.1.tar.gz not found!!!download now......"
        wget -c $pkgmirror/zabbix-2.2.1.tar.gz
    fi
    tar zxvf zabbix-2.2.1.tar.gz
    cd zabbix-2.2.1
    ./configure --prefix=$install_dir/zabbix --enable-server --enable-agent --with-mysql=$install_dir/mysql --with-net-snmp --with-libcurl
    make
    make install
    \cp misc/init.d/fedora/core/zabbix_server /etc/init.d/
    \cp misc/init.d/fedora/core/zabbix_agentd /etc/init.d/
    \cp -R frontends/php $install_dir/zabbix/html
    $install_dir/mysql/bin/mysql -uroot -p$mysqlrootpwd << EOF
CREATE DATABASE if not exists zabbix;
grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix';
EOF
    $install_dir/mysql/bin/mysql -uzabbix -pzabbix -hlocalhost zabbix < database/mysql/schema.sql
    $install_dir/mysql/bin/mysql -uzabbix -pzabbix -hlocalhost zabbix < database/mysql/images.sql
    $install_dir/mysql/bin/mysql -uzabbix -pzabbix -hlocalhost zabbix < database/mysql/data.sql
    sed -i 's/^DBUser=.*$/DBUser=zabbix/g' $install_dir/zabbix/etc/zabbix_server.conf
    sed -i 's/^.*DBPassword=.*$/DBPassword=zabbix/g' $install_dir/zabbix/etc/zabbix_server.conf
    sed -i 's#BASEDIR=/usr/local#BASEDIR='$install_dir'/zabbix#g' /etc/init.d/zabbix_agentd
    sed -i 's#/usr/local#'$install_dir'/zabbix#g' /etc/init.d/zabbix_server
    chkconfig --add zabbix_agentd
    chkconfig --add zabbix_server
    chkconfig --level 2345 zabbix_agentd on
    chkconfig --level 2345 zabbix_server on
    /etc/init.d/zabbix_server start
    /etc/init.d/zabbix_agentd start
    if [ -d $install_dir/apache ] ; then
        cat << EOF > $install_dir/apache/conf/zabbix.conf
Listen 83
NameVirtualHost *:83
<VirtualHost *:83>
    ServerName *
    DocumentRoot "$install_dir/zabbix/html"
    <Directory "$install_dir/zabbix/html">
        allow from all
        Options +Indexes
        AllowOverride All
    </Directory>
</VirtualHost>
EOF
        if ( ! cat $install_dir/apache/conf/httpd.conf | grep zabbix ); then
            echo "Include $install_dir/apache/conf/zabbix.conf" >> $install_dir/apache/conf/httpd.conf
            /etc/init.d/apache restart
        fi
    elif [ -d $install_dir/nginx ]; then
        cat << EOF > $install_dir/nginx/conf/zabbix.conf
    server {
        listen 83;
        server_name _;
        index index.php index.html index.htm;
        access_log off;
        root $install_dir/zabbix/html;
    }
EOF
        if ( ! cat $install_dir/nginx/conf/nginx.conf | grep zabbix ); then
            sed -i '$i\    include '$install_dir'/nginx/conf/zabbix.conf;' $install_dir/nginx/conf/nginx.conf
            /etc/init.d/nginx restart
        fi
    fi
}
##################################################################### Zabbix_Agnet And Snmp #####################################################################
function zabbix_agentd(){
    if ( ps aux | grep zabbix_agentd | grep -v grep ); then
        killall zabbix_agentd
    fi
    yum -y install net-snmp
    if ( ! id zabbix ); then
        groupadd zabbix
        useradd -g zabbix -M -s /sbin/nologin zabbix
    fi
    cd $down_dir
    if [ -s zabbix-2.2.1.tar.gz ]; then
        echo "zabbix-2.2.1.tar.gz [found]"
    else
        echo "Error: zabbix-2.2.1.tar.gz not found!!!download now......"
        wget -c $pkgmirror/zabbix-2.2.1.tar.gz
    fi
    tar zxvf zabbix-2.2.1.tar.gz
    cd zabbix-2.2.1
    ./configure --enable-agent
    make
    make install
    \cp conf/zabbix_agentd.conf /etc/zabbix_agentd.conf
    \cp misc/init.d/fedora/core/zabbix_agentd /etc/init.d/
    sed -i 's#$FULLPATH#$FULLPATH -c /etc/zabbix_agentd.conf#g' /etc/init.d/zabbix_agentd
    \cp misc/snmptrap/snmptrap.sh /usr/local/bin/
    sed -i 's#~zabbix/bin/zabbix_sender#/usr/local/bin/zabbix_sender#g' /usr/local/bin/snmptrap.sh
    chkconfig --add zabbix_agentd
    chkconfig --level 2345 zabbix_agentd on
    /etc/init.d/zabbix_agentd start
    sed -i 's/com2sec notConfigUser  default       public/com2sec notConfigUser  default       ptserver/g' /etc/snmp/snmpd.conf
    sed -i 's/access  notConfigGroup ""      any       noauth    exact  systemview none none/access  notConfigGroup ""      any       noauth    exact  all none none/g' /etc/snmp/snmpd.conf
    sed -i 's/#view all    included  .1                               80/view all    included  .1                               80/g' /etc/snmp/snmpd.conf
    sed -i 's/#view mib2   included  .iso.org.dod.internet.mgmt.mib-2 fc/view mib2   included  .iso.org.dod.internet.mgmt.mib-2 fc/g' /etc/snmp/snmpd.conf
    chkconfig --level 2345 snmpd on
    /etc/init.d/snmpd start
    if ( ! cat /etc/snmp/snmptrapd.conf | grep snmptrap.sh ); then
        echo "traphandle default /bin/bash /usr/local/bin/snmptrap.sh" >> /etc/snmp/snmptrapd.conf
    fi
    chkconfig --level 2345 snmptrapd on
    /etc/init.d/snmptrapd start
}
##################################################################### Cacti #####################################################################
function cacti(){
    yum -y install net-snmp-utils rrdtool
    cd $down_dir
    if [ -s cacti-spine-0.8.8b.tar.gz ]; then
        echo "cacti-spine-0.8.8b.tar.gz [found]"
    else
        echo "Error: cacti-spine-0.8.8b.tar.gz not found!!!download now......"
        wget -c $pkgmirror/cacti-spine-0.8.8b.tar.gz
    fi
    tar zxvf cacti-spine-0.8.8b.tar.gz
    cd cacti-spine-0.8.8b
    ./configure
    make
    make install
    \cp /usr/local/spine/etc/spine.conf.dist /usr/local/spine/etc/spine.conf
    cd $down_dir
    if [ -s cacti-0.8.8b.tar.gz ]; then
        echo "cacti-0.8.8b.tar.gz [found]"
    else
        echo "Error: cacti-0.8.8b.tar.gz not found!!!download now......"
        wget -c $pkgmirror/cacti-0.8.8b.tar.gz
    fi
    tar zxvf cacti-0.8.8b.tar.gz
    mkdir -pv /var/www/html/cacti
    mv -f cacti-0.8.8b/* /var/www/html/cacti
    chown -R www:www /var/www/html/cacti
    chmod -R 755 /var/www/html/cacti
    echo "*/5 * * * *  $install_dir/php/bin/php /var/www/html/cacti/poller.php" > /var/spool/cron/root
    $install_dir/mysql/bin/mysql -uroot -p$mysqlrootpwd << EOF
create database if not exists cacti;
grant all on cacti.* to cactiuser@localhost identified by "cactiuser";
EOF
    $install_dir/mysql/bin/mysql -ucactiuser -pcactiuser -hlocalhost cacti < /var/www/html/cacti/cacti.sql
}
##################################################################### Snmp And MRTG #####################################################################
function snmp(){
    if [ -d $install_dir/mrtg ]; then
        mv $install_dir/mrtg $install_dir/mrtg.bak
    fi
    yum -y install net-snmp vixie-cron crontabs perl gd-devel sysstat
    chkconfig --level 2345 crond on
    if [ ! ps aux | grep crond ]; then
        /etc/init.d/crond startd
    fi
    sed -i 's/com2sec notConfigUser  default       public/com2sec notConfigUser  default       ptserver/g' /etc/snmp/snmpd.conf
    sed -i 's/access  notConfigGroup ""      any       noauth    exact  systemview none none/access  notConfigGroup ""      any       noauth    exact  all none none/g' /etc/snmp/snmpd.conf
    sed -i 's/#view all    included  .1                               80/view all    included  .1                               80/g' /etc/snmp/snmpd.conf
    sed -i 's/#view mib2   included  .iso.org.dod.internet.mgmt.mib-2 fc/view mib2   included  .iso.org.dod.internet.mgmt.mib-2 fc/g' /etc/snmp/snmpd.conf
    chkconfig --level 2345 snmpd on
    /etc/init.d/snmpd start
    cd $down_dir
    if [ -s mrtg-2.17.4.tar.gz ]; then
        echo "mrtg-2.17.4.tar.gz [found]"
    else
        echo "Error: mrtg-2.17.4.tar.gz not found!!!download now......"
        wget -c $pkgmirror/mrtg-2.17.4.tar.gz
    fi
    tar zxvf mrtg-2.17.4.tar.gz
    cd mrtg-2.17.4
    ./configure --prefix=$install_dir/mrtg
    make
    make install
    cd $install_dir/mrtg/bin/
    wget -c $sptmirror/mrtg_load.sh
    wget -c $sptmirror/mrtg_mem.sh
    wget -c $sptmirror/mrtg_swap.sh    
    wget -c $sptmirror/mrtg_tcp.sh
    wget -c $sptmirror/mrtg_cpu.sh
    chmod 755 *
    if [ ! -d $install_dir/mrtg/etc ]; then
        mkdir $install_dir/mrtg/etc
    fi
    if [ ! -d $install_dir/mrtg/html ]; then
        mkdir $install_dir/mrtg/html
        chown -R www:www $install_dir/mrtg/html
    fi
    echo 'admin:ddp2S.gHWT.ow' > $install_dir/mrtg/html/.htpasswd
    $install_dir/mrtg/bin/cfgmaker --global "Workdir: $install_dir/mrtg/html" --global "language: chinese" --global "Options[_]: growright,bits" ptserver@localhost > $install_dir/mrtg/etc/mrtg.cfg
    cat << EOF >> $install_dir/mrtg/etc/mrtg.cfg
# CPU
Target[cpu]: \`$install_dir/mrtg/bin/mrtg_cpu.sh\`
MaxBytes[cpu]: 100
Options[cpu]: gauge,nopercent,growright
YLegend[cpu]: CPU Usage (%)
ShortLegend[cpu]: %
LegendI[cpu]: User :
LegendO[cpu]: Idle :
Title[cpu]: CPU
PageTop[cpu]: <H1>CPU Usage</H1>

# MEM
Target[mem]: \`$install_dir/mrtg/bin/mrtg_mem.sh\`
MaxBytes[mem]: 24675968
Title[mem]:Memory
ShortLegend[mem]: B
kmg[mem]:k,M,G
kilo[mem]:1024
YLegend[mem]: Memory Usage
LegendI[mem]: Memory Used :
LegendO[mem]: Buffers/Cache Free :
Options[mem]: growright,gauge,nopercent
PageTop[mem]: <H1>Memory Utilization</H1>

# SWAP
Target[swap]: \`$install_dir/mrtg/bin/mrtg_swap.sh\`
MaxBytes[swap]: 5603320
Title[swap]:Memory
ShortLegend[swap]: B
kmg[swap]:k,M,G
kilo[swap]:1024
YLegend[swap]: Swap Memory
LegendI[swap]: Used :
LegendO[swap]: Free :
Options[swap]: growright,gauge,nopercent
PageTop[swap]: <H1>Swap Memory Usage</H1>

# Load
Target[load]: \`$install_dir/mrtg/bin/mrtg_load.sh\`
MaxBytes[load]: 100
Title[load]:Load Average
ShortLegend[load]: &nbsp;
YLegend[load]: Load Average
LegendI[load]: 5-minute stagger :
LegendO[load]: 15-minute stagger :
Options[load]: growright,gauge,nopercent
PageTop[load]: <H1>Load Averages</H1>

# WEB TCP
Target[tcp]: \`$install_dir/mrtg/bin/mrtg_tcp.sh\`
MaxBytes[tcp]: 65534
Title[tcp]:Web TCP Connections
ShortLegend[tcp]: &nbsp;
YLegend[tcp]: TCP Connections
LegendI[tcp]: Connect :
LegendO[tcp]: Online :
Options[tcp]: growright,integer,gauge,nopercent
PageTop[tcp]: <H1>Web TCP Connections</H1>'
EOF
    $install_dir/mrtg/bin/indexmaker $install_dir/mrtg/etc/mrtg.cfg --output=$install_dir/mrtg/html/index.html --title="MRTG"
    if ( ! cat /var/spool/cron/root | grep mrtg ); then
        echo "*/5 * * * * (env LANG=C $install_dir/mrtg/bin/mrtg $install_dir/mrtg/etc/mrtg.cfg) > /dev/null 2>&1" >> /var/spool/cron/root
    fi
    if [ -d $install_dir/apache ] ; then
        cat << EOF > $install_dir/apache/conf/mrtg.conf
Listen 82
NameVirtualHost *:82
<VirtualHost *:82>
    ServerName *
    DocumentRoot "$install_dir/mrtg/html"
    <Directory "$install_dir/mrtg/html">
        allow from all
        Options +Indexes
        AllowOverride All
        AuthType Basic
        AuthName "MRTG"
        AuthUserFile $install_dir/mrtg/html/.htpasswd
        Require user admin
    </Directory>
</VirtualHost>
EOF
        if ( ! cat $install_dir/apache/conf/httpd.conf | grep mrtg ); then
            echo "Include $install_dir/apache/conf/mrtg.conf" >> $install_dir/apache/conf/httpd.conf
            /etc/init.d/apache restart
        fi
    elif [ -d $install_dir/nginx ]; then
        cat << EOF > $install_dir/nginx/conf/mrtg.conf
    server {
        listen 82;
        server_name _;
        index index.html index.htm;
        access_log off;
        auth_basic "Mrtg Auth";
        auth_basic_user_file "$install_dir/mrtg/html/.htpasswd";
        root $install_dir/mrtg/html;
    }
EOF
        if ( ! cat $install_dir/nginx/conf/nginx.conf | grep mrtg ); then
            sed -i '$i\    include '$install_dir'/nginx/conf/mrtg.conf;' $install_dir/nginx/conf/nginx.conf
            /etc/init.d/nginx restart
        fi
    fi
}
##################################################################### loganalyzer #####################################################################
function loganalyzer(){
$template dbtpl,"insert into SystemEvents (Message, Facility, FromHost, FromIP, Priority, DeviceReportedTime, ReceivedAt, InfoUnitID, SysLogTag) values ('%msg%', '%syslogfacility%', '%HOSTNAME%', '%fromhost-ip%', '%syslogpriority%', '%timereported:::date-mysql%', '%timegenerated:::date-mysql%', '%iut%', '%syslogtag%')",sql
$ModLoad ommysql
*.*       :ommysql:localhost,loganalyzer,root,iammysql;dbtpl
    $install_dir/mysql/bin/mysql -uroot -p$mysqlrootpwd << EOF
create database if not exists loganalyzer;
CREATE TABLE if not exists SystemEvents (
    ID int unsigned not null auto_increment primary key,
    CustomerID bigint,
    ReceivedAt datetime NULL,
    DeviceReportedTime datetime NULL,
    Facility smallint NULL,
    Priority smallint NULL,
    FromHost varchar(60) NULL,
    FromIP VARCHAR(60) DEFAULT NULL,
    Message text,
    NTSeverity int NULL,
    Importance int NULL,
    EventSource varchar(60),
    EventUser varchar(60) NULL,
    EventCategory int NULL,
    EventID int NULL,
    EventBinaryData text NULL,
    MaxAvailable int NULL,
    CurrUsage int NULL,
    MinUsage int NULL,
    MaxUsage int NULL,
    InfoUnitID int NULL ,
    SysLogTag varchar(60),
    EventLogType varchar(60),
    GenericFileName VarChar(60),
    SystemID int NULL
) DEFAULT CHARSET=utf8;
CREATE TABLE SystemEventsProperties (
    ID int unsigned not null auto_increment primary key,
    SystemEventID int NULL ,
    ParamName varchar(255) NULL ,
    ParamValue text NULL
) DEFAULT CHARSET=utf8;
EOF
}
##################################################################### system #####################################################################
function system(){
    yum -y install ntp iptables quota byacc vixie-cron crontabs bison smartmontools
# set timezone
    rm -f /etc/localtime
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    sed -i 's/UTC=true/UTC=false/g' /etc/sysconfig/clock
    ntpdate cn.pool.ntp.org
    if ( ! cat /var/spool/cron/root | grep ntpdate ); then
        echo "*/5 * * * * (/usr/sbin/ntpdate cn.pool.ntp.org && hwclock -w) > /dev/null 2>&1" >> /var/spool/cron/root
    fi
# charset
    cat << EOF > /etc/sysconfig/i18n
LANG="en_US.UTF-8"
SYSFONT="latarcyrheb-sun16"
EOF
# set firewall
    /sbin/iptables -P INPUT ACCEPT
    /sbin/iptables -P OUTPUT ACCEPT
    /sbin/iptables -P FORWARD ACCEPT
    /sbin/iptables -F
    /sbin/iptables -X
    /sbin/iptables -Z
    /etc/init.d/iptables save
# Disable SeLinux
    if ( ! cat /etc/selinux/config | grep "SELINUX=disabled" ); then
        setenforce 0
        sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
    fi
# Login information
    if ( ! cat ~/.bash_profile | grep netstat ); then
        cat << EOF >> ~/.bash_profile
echo
echo "--------------- Disk Use ---------------"
df -h
echo
echo "--------------- Mem Use ---------------"
free -m
echo
echo "--------------- Load Avg ---------------"
uptime
echo
echo "--------------- NW Status ---------------"
netstat -n | awk '/^tcp/ {++state[\$NF]} END {for(key in state) print key,"\t",state[key]}'
echo
echo "--------------- Messages ---------------"
tail -n 10 /var/log/messages
echo
EOF
    fi
# no over
#    if ( ! cat /etc/motd | grep "^^^^^^^^^^" ); then
#        cat << EOF >> /etc/motd
#                   _ooOoo_
#                  o8888888o
#                  88" . "88
#                  (| -_- |)
#                  O\  =  /O
#               ____/`---'\____
#             .'  \\|     |//  `.
#            /  \\|||  :  |||//  \
#           /  _||||| -:- |||||-  \
#           |   | \\\  -  /// |   |
#           | \_|  ''\---/''  |   |
#           \  .-\__  `-`  ___/-. /
#         ___`. .'  /--.--\  `. . __
#      ."" '<  `.___\_<|>_/___.'  >'"".
#     | | :  `- \`.;`\ _ /`;.`/ - ` : | |
#     \  \ `-.   \_ __\ /__ _/   .-` /  /
#======`-.____`-.___\_____/___.-`____.-'======
#                   `=---='
#
#
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#           佛祖保佑       永不死机
#           心外无法       法外无心
#EOF
#    fi
# Disable ipv6
    if [ ! -f /etc/modprobe.d/dist.conf ] || ( ! cat /etc/modprobe.d/dist.conf | grep ipv6 ); then
        cat << EOF >> /etc/modprobe.d/dist.conf
alias net-pf-10 off
alias ipv6 off
EOF
    fi
# Disable history
    sed -i 's/HISTSIZE=1000/HISTSIZE=0/g' /etc/profile
# set file limit
    if ( ! cat /etc/security/limits.conf | grep 51200 ); then
        echo '*                -       nofile          51200' >> /etc/security/limits.conf
#       echo '*                -       noproc          51200' >> /etc/security/limits.conf
    fi
# SSH-Key
    if [ ! -d ~/.ssh ]; then
        mkdir ~/.ssh
    fi
    cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAg/AQNoWv4aNEJd6x66L1DPlOsqS5/elDcXiSf5JkvZqAHso+nGMXRIy6H4qY8V9hhy31DpWJz5b6ygzGDsG3CFxXwfa1DpSsZOpoljrX2N1ks9CvsyX+h8hiXUpdK7uKrg/qzL6XZEaFf8tNXAYqr1enmwOz00PhmPO8JST2+CM= rsa-key-20120707
EOF
# set grub password
    if ( ! cat /boot/grub/grub.conf | grep password ); then
        sed -i '/timeout/a\password --md5 $1$.RN.P1$BCbZwz5QvJwlf/mBirXG0.' /boot/grub/grub.conf
    fi
# set shell
    if [ ! -d /usr/local/bash ]; then
        cd $down_dir
        if [ -s bash-4.1.tar.gz ]; then
            echo "bash-4.1.tar.gz [found]"
        else
            echo "Error: bash-4.1.tar.gz not found!!!download now......"
            wget -c $pkgmirror/bash-4.1.tar.gz
        fi
        tar zxvf bash-4.1.tar.gz
        cd bash-4.1
        ./configure --prefix=/usr/local/bash
        make
        make install
        usermod -s /usr/local/bash/bin/bash root
    fi
}
##################################################################### firewall #####################################################################
function firewall(){
    iptables -P INPUT ACCEPT
    iptables -P OUTPUT ACCEPT
    iptables -P FORWARD ACCEPT
    iptables -F
    iptables -X
    iptables -Z
    iptables -A INPUT -i lo -j ACCEPT
    iptables -A INPUT ! -i lo -s 127.0.0.0/8 -j DROP
    iptables -A INPUT -s 10.0.0.0/8 -j DROP
    iptables -A INPUT -s 172.16.0.0/12 -j DROP
    iptables -A INPUT -s 192.168.0.0/16 -j DROP
    iptables -A INPUT -p udp -j DROP
    iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
# 每IP的SYN连接数
    iptables -A INPUT -p tcp --syn --dport 80 -m connlimit  --connlimit-above 15 -j DROP
# syn-flood 起始连接数150个,每秒恢复100个
    iptables -N syn-flood
    iptables -A syn-flood -m limit --limit 100/s --limit-burst 150 -j RETURN
    iptables -A syn-flood -j DROP
    iptables -A INPUT -p tcp --dport 80 -j syn-flood
# 每IP的最大连接数
    iptables -A INPUT -p tcp --dport 80 -m connlimit --connlimit-above 30 -j REJECT
#   iptables -A INPUT -p tcp --dport 80 --tcp-flags FIN,SYN,RST,ACK SYN -m connlimit --connlimit-above 5 --connlimit-mask 32 -j REJECT
#   iptables -A INPUT -p tcp --dport 80 --tcp-flags FIN,SYN,RST,ACK ACK -m connlimit --connlimit-above 5 --connlimit-mask 32 -j REJECT
# 单个IP在60秒内只允许最多新建30个连接
    rmmod xt_recent
    modprobe xt_recent ip_pkt_list_tot=150
    iptables -A INPUT -p tcp --dport 80 -m recent --name BAD_HTTP_ACCESS --update --seconds 60 --hitcount 30 -j REJECT
    iptables -A INPUT -p tcp --dport 80 -m recent --name BAD_HTTP_ACCESS --set -j ACCEPT
    iptables -A OUTPUT -d 127.0.0.1 -j ACCEPT
    iptables -A OUTPUT -p udp -j DROP
    if ( ! cat /etc/rc.local | grep iptables ); then
        cat << EOF >> /etc/rc.local
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
iptables -X
iptables -Z
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT ! -i lo -s 127.0.0.0/8 -j DROP
iptables -A INPUT -s 10.0.0.0/8 -j DROP
iptables -A INPUT -s 172.16.0.0/12 -j DROP
iptables -A INPUT -s 192.168.0.0/16 -j DROP
iptables -A INPUT -p udp -j DROP
iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --syn --dport 80 -m connlimit  --connlimit-above 15 -j DROP
iptables -N syn-flood
iptables -A syn-flood -m limit --limit 100/s --limit-burst 150 -j RETURN
iptables -A syn-flood -j DROP
iptables -A INPUT -p tcp --dport 80 -j syn-flood
iptables -A INPUT -p tcp --dport 80 -m connlimit --connlimit-above 30 -j REJECT
rmmod xt_recent
modprobe xt_recent ip_pkt_list_tot=150
iptables -A INPUT -p tcp --dport 80 -m recent --name BAD_HTTP_ACCESS --update --seconds 60 --hitcount 30 -j REJECT
iptables -A INPUT -p tcp --dport 80 -m recent --name BAD_HTTP_ACCESS --set -j ACCEPT
iptables -A OUTPUT -d 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -p udp -j DROP
EOF
    fi
# 记录10000个地址，每个地址60个包
# ip_list_tot最大为8100,超过这个数值会导致iptables错误
    if ( ! cat /etc/sysctl.conf | grep ip_list_tot ); then
        echo 'options ipt_recent ip_list_tot=1000' >> /etc/modprobe.conf
        echo 'ip_pkt_list_tot=60' >> /etc/modprobe.conf
    fi
# sysctl
    if ( ! cat /etc/sysctl.conf | grep 819200 ); then
        echo 'net.ipv4.tcp_synack_retries=1' >> /etc/sysctl.conf
        echo 'net.ipv4.tcp_syn_retries=1' >> /etc/sysctl.conf
        echo 'net.ipv4.tcp_tw_recycle = 1' >> /etc/sysctl.conf
        echo 'net.ipv4.tcp_tw_reuse = 1' >> /etc/sysctl.conf
        echo 'net.ipv4.tcp_fin_timeout = 10' >> /etc/sysctl.conf
        echo 'net.ipv4.tcp_keepalive_time = 1200' >> /etc/sysctl.conf
        echo 'net.ipv4.tcp_syncookies=1' >> /etc/sysctl.conf
        echo 'net.ipv4.tcp_max_syn_backlog = 819200' >> /etc/sysctl.conf
        echo 'net.netfilter.nf_conntrack_tcp_timeout_established = 10800' >> /etc/sysctl.conf
        echo 'net.netfilter.nf_conntrack_max = 655350' >> /etc/sysctl.conf
#        echo 'net.ipv4.tcp_max_tw_buckets=5000' >> /etc/sysctl.conf
# TCP发送keepalive探测以确定该连接已经断开的次数
#        echo 'net.ipv4.tcp_keepalive_probes=5' >> /etc/sysctl.conf
# 探测消息发送的频率
#        echo 'net.ipv4.tcp_keepalive_intvl=15' >> /etc/sysctl.conf
# 杀死一个活动TCP连接重试次数
#        echo 'net.ipv4.tcp_retries2=5' >> /etc/sysctl.conf
# 关闭TCP连接前重试次数
#        echo 'net.ipv4.tcp_orphan_retries=3' >> /etc/sysctl.conf
# TCP流中重排序的数据报最大数量
#        echo 'net.ipv4.tcp_reordering=5' >> /etc/sysctl.conf
# 关闭打印机兼容BUG
#        echo 'net.ipv4.tcp_retrans_collapse=0' >> /etc/sysctl.conf
#        echo 'net.core.netdev_max_backlog=32768' >> /etc/sysctl.conf
#        echo 'net.core.somaxconn=32768' >> /etc/sysctl.conf
#        echo 'net.core.wmem_default=8388608' >> /etc/sysctl.conf
#        echo 'net.core.rmem_default=8388608' >> /etc/sysctl.conf
#        echo 'net.core.rmem_max=16777216' >> /etc/sysctl.conf
#        echo 'net.core.wmem_max=16777216' >> /etc/sysctl.conf
#        echo 'net.ipv4.tcp_max_orphans=3276800' >> /etc/sysctl.conf
#        echo 'net.ipv4.tcp_timestamps=0' >> /etc/sysctl.conf
# 开启IP欺骗保护
#        echo 'net.ipv4.tcp_mem=94500000 915000000 927000000' >> /etc/sysctl.conf
#        for i in /proc/sys/net/ipv4/conf/*/rp_filter; do
#            echo 1 > $i
#        done
    fi
}
##################################################################### Api #####################################################################
function api(){
    yum -y install ftp
    yum -y remove httpd php
    rm -f /etc/httpd/conf/httpd.conf
    rm -f /etc/php.ini
    if ( yum list | grep php53 ); then
        yum install -y httpd php53 php53-gd php53-mbstring php53-mysql php53-devel sendmail unzip sudo
    else
        yum install -y httpd php php-gd php-mbstring php-mysql php-devel sendmail unzip sudo
    fi
    sed -i 's/Listen 80/Listen 8082/g' /etc/httpd/conf/httpd.conf
#    sed -i '/Listen 8082/a\Listen 8282' /etc/httpd/conf/httpd.conf
    sed -i 's/DirectoryIndex index.html/DirectoryIndex index.html index.htm index.php/g' /etc/httpd/conf/httpd.conf
    cd $down_dir
    if [ -s api ]; then
        echo "api [found]"
    else
        echo "Error: api not found!!!download now......"
        wget -c $sptmirror/api
    fi
    mv api /bin/
    chmod 500 /bin/api
    chmod 640 /etc/sudoers
    if ( ! cat /etc/sudoers | grep "apache"); then 
        echo "apache ALL=NOPASSWD:/bin/api" >> /etc/sudoers
    fi
    sed -i 's/Defaults    requiretty/#Defaults    requiretty/g' /etc/sudoers
    chmod 440 /etc/sudoers
    cd $down_dir
    if [ ! -d /var/www/html/phpMyAdmin ]; then
        if [ -s phpMyAdmin-4.0.9-all-languages.tar.gz ]; then
            echo "phpMyAdmin-4.0.9-all-languages.tar.gz [found]"
        else
            echo "Error: phpMyAdmin-4.0.9-all-languages.tar.gz not found!!!download now......"
            wget -c $pkgmirror/phpMyAdmin-4.0.9-all-languages.tar.gz
        fi
        tar zxvf phpMyAdmin-4.0.9-all-languages.tar.gz -C /var/www/html
        mv /var/www/html/phpMyAdmin-4.0.9-all-languages /var/www/html/phpMyAdmin
    fi
    chown -R apache:apache /var/www/html
    cd $down_dir
    if [ `getconf WORD_BIT` = '32' ] && [ `getconf LONG_BIT` = '64' ] ; then
        if [ -s rarlinux-x64-5.0.0.tar.gz ]; then
            echo "rarlinux-x64-5.0.0.tar.gz [found]"
        else
            echo "Error: rarlinux-x64-5.0.0.tar.gz not found!!!download now......"
            wget -c $pkgmirror/rarlinux-x64-5.0.0.tar.gz
        fi
        tar zxvf rarlinux-x64-5.0.0.tar.gz
        \cp rar/unrar /bin/
    else
        if [ -s rarlinux-5.0.0.tar.gz ]; then
            echo "rarlinux-5.0.0.tar.gz [found]"
        else
            echo "Error: rarlinux-5.0.0.tar.gz not found!!!download now......"
            wget -c $pkgmirror/rarlinux-5.0.0.tar.gz
        fi
        tar zxvf rarlinux-5.0.0.tar.gz
        \cp rar/unrar /bin/
    fi
    /etc/init.d/httpd start
    /etc/init.d/crond start
    clear
    echo ""
    echo "Install LAAMP Beta v1.1 completed! enjoy it."
    echo "========================================================================="
    echo "LAAMP Beta v1.1 for CentOS/RadHat Written by kelvin"
    echo "========================================================================="
    echo ""
    echo "For more information please visit http://www.xtgly.com/"
    echo ""
    echo "phpMyAdmin : http://$ip:8282/phpMyAdmin/"
    echo "MySQL User : root"
    echo "MySQL Passwd : $mysqlrootpwd"
    echo ""
    echo "The path of some dirs:"
    echo "mysql dir:   $install_dir/mysql"
    echo "php dir:     $install_dir/php"
    echo "apache dir:   $install_dir/apache"
    echo "pureftpd dir:   $install_dir/pureftpd"
    echo "web dir :     $userdir"
    echo "web log :     $logs"
    echo ""
    echo "========================================================================="
}

##################################################################### Press Any Key #####################################################################
function get_char(){
    SAVEDSTTY=`stty -g`
    stty -echo
    stty cbreak
    dd if=/dev/tty bs=1 count=1 2> /dev/null
    stty -raw
    stty echo
    stty $SAVEDSTTY
}
##################################################################### Menu #####################################################################
echo "============================================"
echo
echo "1. Apache 2.2.26"
echo
echo "2. Apache 2.4.7"
echo
echo "10. Nginx 1.4.4"
echo
echo "20. Tomcat 7.0.47" 
echo
echo "30. Squid 2.7.9"
echo
echo "40. Varnish 3.0.4"
echo
echo "50. MySQL 5.1.72"
echo
echo "51. MySQL 5.5.35"
echo
echo "52. MySQL 5.6.15"
echo
echo "60. PHP 5.2.17"
echo
echo "61. PHP 5.3.27"
echo
echo "62. PHP 5.4.22"
echo
echo "63. PHP 5.5.6"
echo
echo "70. pure-ftpd 1.0.36"
echo
echo "80. BIND 9.8.6-P1"
echo
echo "81. BIND-MySQL 9.8.6-P1"
echo
echo "90. Nagios 4.0.2"
echo
echo "91. NRPE 2.15 And SNMP"
echo
echo "92. Zabbix 2.2.1"
echo
echo "93. Zabbix_Agentd 2.2.1 And SNMP"
echo
echo "94. Cacti 0.8.8b"
echo
echo "95. SNMP And MRTG 2.17.4"
echo
echo "100. SYSTEM"
echo
echo "101. Firewall"
echo
echo "102. API"
echo
echo "============================================"
echo
echo "Please Input Choose:"
read -p "(Default : 1):" verchoose

case $verchoose in
    1|2)
        apache
    ;;
    10)
        nginx
    ;;
    20)
        tomcat
    ;;
    30)
        squid
    ;;
    40)
        varnish
    ;;
    50|51|52)
        mysql
    ;;
    60|61|62|63)
        php
    ;;
    70)
        pureftp
    ;;
    80|81)
        bind
    ;;
    90)
        nagios
    ;;
    91)
        nrpe
    ;;
    92)
        zabbix
    ;;
    93)
        zabbix_agentd
    ;;
    94)
        cacti
    ;;
    95)
        snmp
    ;;
    100)
        system
    ;;
    101)
        firewall
    ;;
    102)
        api
    ;;
    *)
        echo error
        exit 1
    ;;
esac

# clean
cd $cur_dir
# rm -f install.sh
for i in $down_dir/* ; do
    if [ -d $i ]; then
        rm -rf $i
    fi
done