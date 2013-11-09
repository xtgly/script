@echo off
TITLE Powered By 莆阳IDC 1049832302@qq.com
MODE con: COLS=50 LINES=22
color 27
:choose
cls
echo         ╭───────────────╮
echo   ╭──┤      WI(A)MP一键安装配置     ├──╮
echo   │    ╰───────────────╯    │
echo   │                                          │
echo   │  1、IIS+PHP+MySQL一键配置                │
echo   │                                          │
echo   │  2、Apache+PHP+MySQL一键配置             │
echo   │                                          │
echo   │  0、退 出                                │
echo   │                                          │
echo   ╰─────────────────────╯
set /p choose=  请选择 : 
if "%choose%"=="1" goto iisstart
if "%choose%"=="2" goto apachestart
if "%choose%"=="0" exit
goto choose
:iisstart
sc stop w3svc
sc stop httpfilter
iisreset /stop
REG DELETE "HKLM\Software\PHP" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v PHPRC /f
copy /y D:\local\php\php.ini %windir%
copy /y D:\local\php\php5ts.dll %windir%
copy /y D:\local\php\libmysql.dll %windir%
copy /y D:\local\php\libmcrypt.dll %windir%
copy /y D:\local\php\php.default.ini %windir%\php.ini
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set W3SVC/DefaultDOC "default.htm,default.asp,index.htm,index.html,index.php,index.asp,index.aspx"
cscript D:\local\chglist.vbs W3SVC/ScriptMaps ".php" "" /REMOVE /RECURSE /ALL /COMMIT
cscript D:\local\chglist.vbs W3SVC/ScriptMaps "" ".php,D:\local\php\php5isapi.dll,5" /INSERT /COMMIT 
cscript %windir%\system32\iisext.vbs /AddFile D:\local\php\php5isapi.dll 1 php 1 "PHP ISAPI"
echo.
echo 正在创建phpMyAdmin站点
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs create_vserv  w3svc/99
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/servercomment "phpMyAdmin"
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/serverbindings ":8081:"
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/enabledefaultdoc true
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs create_vdir w3svc/99/root
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/root/path D:\local\phpMyAdmin
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/root/accessread true
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/root/enabledefaultdoc true
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/root/accessscript true
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/root/appfriendlyName 默认应用程序
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs start_server w3svc/99
:gzip
echo.
set /p gzip=  是否启用 Gzip压缩 : (y/n)
if "%gzip%"=="y" goto engzip
if "%gzip%"=="" goto engzip
if "%gzip%"=="n" goto disgzip
goto gzip
:engzip
cscript %windir%\system32\iisext.vbs /AddFile %windir%\system32\inetsrv\gzip.dll 1 Gzip 1 "HTTPCompression"
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set W3Svc/Filters/Compression/GZIP/HcDoDynamicCompression TRUE
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/filters/compression/GZIP/HcDoStaticCompression TRUE
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/filters/compression/GZIP/HcDoOnDemandCompression TRUE
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set W3Svc/Filters/Compression/GZIP/HcDynamicCompressionLevel 9
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set W3Svc/Filters/Compression/GZIP/HcOnDemandCompLevel 9
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set W3Svc/Filters/Compression/GZIP/HcFileExtensions "htm" "html" "txt" "ppt" "xls" "xml" "pdf" "xslt" "doc" "xsl" "htc" "js" "css"
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set W3Svc/Filters/Compression/GZIP/HcScriptFileExtensions "asp" "dll" "exe" "aspx" "asmx" "php"
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set W3Svc/Filters/Compression/DEFLATE/HcDoDynamicCompression TRUE
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/filters/compression/DEFLATE/HcDoStaticCompression TRUE
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/filters/compression/DEFLATE/HcDoOnDemandCompression TRUE
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set W3Svc/Filters/Compression/DEFLATE/HcDynamicCompressionLevel 9
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set W3Svc/Filters/Compression/DEFLATE/HcOnDemandCompLevel 9
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set W3Svc/Filters/Compression/DEFLATE/HcFileExtensions "htm" "html" "txt" "ppt" "xls" "xml" "pdf" "xslt" "doc" "xsl" "htc" "js" "css"
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set W3Svc/Filters/Compression/DEFLATE/HcScriptFileExtensions "asp" "dll" "exe" "aspx" "asmx" "php"
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/filters/compression/parameters/HcDoDynamicCompression TRUE
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/filters/compression/parameters/HcDoStaticCompression TRUE
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/filters/compression/parameters/HcDoOnDemandCompression TRUE
goto zend
:disgzip
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/filters/compression/parameters/HcDoDynamicCompression FLASE
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/filters/compression/parameters/HcDoStaticCompression FLASE
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/filters/compression/parameters/HcDoOnDemandCompression FLASE
goto zend
:apachestart
sc stop apache2.2
D:\local\apache\bin\httpd -k uninstall
sc delete apache2.2
D:\local\apache\bin\httpd -k install
goto zend
:zend
echo.
set /p zend=  是否启用 Zend Optimizer V3.3.3 : (y/n)
if "%zend%"=="y" goto enzend
if "%zend%"=="" goto enzend
if "%zend%"=="n" goto eacc
goto zend
:enzend
echo.>> %windir%\php.ini
echo [Zend]>> %windir%\php.ini
echo zend_extension_manager.optimizer_ts="D:\local\zend\lib\Optimizer-3.3.0">> %windir%\php.ini
echo zend_extension_ts="D:\local\zend\lib\ZendExtensionManager.dll">> %windir%\php.ini
:eacc
echo.
set /p eacc=  是否启用 eAccelerator : (y/n)
if "%eacc%"=="y" goto eneacc
if "%eacc%"=="" goto eneacc
if "%eacc%"=="n" goto mysql
goto eacc
:eneacc
echo.>> %windir%\php.ini
echo extension="eAccelerator.dll">> %windir%\php.ini
echo eaccelerator.shm_size="64">> %windir%\php.ini
echo eaccelerator.cache_dir="C:\windows\temp">> %windir%\php.ini
echo eaccelerator.enable="1">> %windir%\php.ini
echo eaccelerator.optimizer="1">> %windir%\php.ini
echo eaccelerator.check_mtime="1">> %windir%\php.ini
echo eaccelerator.debug="0">> %windir%\php.ini
echo eaccelerator.filter="">> %windir%\php.ini
echo eaccelerator.shm_max="0">> %windir%\php.ini
echo eaccelerator.shm_ttl="0">> %windir%\php.ini
echo eaccelerator.shm_prune_period="0">> %windir%\php.ini
echo eaccelerator.shm_only="0">> %windir%\php.ini
echo eaccelerator.compress="1">> %windir%\php.ini
echo eaccelerator.compress_level="9">> %windir%\php.ini
echo eaccelerator.keys = "shm">> %windir%\php.ini
echo eaccelerator.sessions = "shm">> %windir%\php.ini
echo eaccelerator.content = "shm">> %windir%\php.ini
:mysql
sc stop mysql
sc delete mysql
reg query "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v Path | findstr "mysql"
if %errorlevel% neq 0 (
for /f "tokens=1,2,*" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v Path') do (
echo 当前的环境变量为 : %%c
REG ADD "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /d "%%c;D:\local\mysql\bin" /f
)
)
d:\local\mysql\bin\mysqld --install MySQL --defaults-file="d:\local\mysql\my.ini"
set password_len=8
set return=
set wordset=abcdefghijklmnopqrstuvwxyz023456789_
:randomPassword
set /a numof=%random%%%36
call set return=%return%%%wordset:~%numof%,1%%
set /a password_len-=1
if %password_len% gtr 0 goto randomPassword
echo 正在重置MySQL ROOT密码
echo use mysql; >C:\mysqlpass.txt
echo update user set password=password("%return%") where user="root";>>C:\mysqlpass.txt
echo flush privileges; >>C:\mysqlpass.txt
taskkill /f /im mysqld.exe >nul
taskkill /f /im mysqld-nt.exe >nul
start D:\local\mysql\bin\mysqld-nt.exe --skip-grant-tables
ping 127.0.0.1 -n 3 >nul
D:\local\mysql\bin\mysql -uroot < C:\mysqlpass.txt
if %errorlevel% neq 0 goto mysqlout
taskkill /f /im mysqld-nt.exe >nul
echo.
echo 启动所有服务...
if "%choose%"=="1" sc start w3svc && sc start httpfilter
if "%choose%"=="2" sc start apache2.2
sc start mysql
cls
echo.
echo 环境配置完成!
echo.
echo MySQL的初始密码是 %return%
echo.
echo %return%|clip
echo MySQL 密码已拷贝至剪贴板,任意键退出!
pause > nul
gpupdate /force
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
exit
:mysqlout
cls
echo.
taskkill /f /im mysqld-nt.exe >nul
echo MySQL 密码设置失败,任意键退出!
pause > nul
gpupdate /force
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
exit  
