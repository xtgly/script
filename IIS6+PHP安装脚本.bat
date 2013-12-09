@echo off
TITLE Powered By 莆阳IDC 1049832302@qq.com
MODE con: COLS=50 LINES=22
color 27

set option=%1
if "%option%"=="gzip" goto gzip
if "%option%"=="ea" goto ea
if "%option%"=="disgzip" goto disgzip

::停止IIS
sc stop w3svc
sc stop httpfilter
iisreset /stop

::删除注册表PHP键值
REG DELETE "HKLM\Software\PHP" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v PHPRC /f

::复制DLL文件
copy /y D:\local\php\php.ini %windir%\php.ini
copy /y D:\local\php\zlib.dll %windir%\system32\zlib.dll
copy /y D:\local\php\php5ts.dll %windir%\system32\php5ts.dll
copy /y D:\local\php\libmysql.dll %windir%\system32\libmysql.dll
copy /y D:\local\php\libmcrypt.dll %windir%\system32\libmcrypt.dll
copy /y D:\local\php\libeay32.dll %windir%\system32\libeay32.dll
copy /y D:\local\php\libmhash.dll %windir%\system32\libmhash.dll
copy /y D:\local\php\libpq.dll %windir%\system32\libpq.dll
copy /y D:\local\php\ssleay32.dll %windir%\system32\ssleay32.dll
copy /y D:\local\php\ntwdblib.dll %windir%\system32\ntwdblib.dll
copy /y D:\local\php\ext\php_pdo.dll %windir%\system32\php_pdo.dll

::PHP权限
echo y|cacls "D:\local\php"  /E /T /G USERS:R
echo y|cacls "D:\local\php\temp"  /E /T /G everyone:F
echo y|cacls "%windir%\php.ini"  /E /G USERS:R
echo y|cacls "%windir%\system32\zlib.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\php5ts.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\libmysql.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\libmcrypt.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\libeay32.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\libmhash.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\libpq.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\ssleay32.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\ntwdblib.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\php_pdo.dll"  /E /G USERS:R

::IIS PHP设置
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set W3SVC/DefaultDOC "default.htm,default.asp,index.htm,index.html,index.php,index.asp,index.aspx"
cscript D:\local\php\chglist.vbs W3SVC/ScriptMaps ".php" "" /REMOVE /RECURSE /ALL /COMMIT
cscript D:\local\php\chglist.vbs W3SVC/ScriptMaps "" ".php,D:\local\php\php5isapi.dll,5" /INSERT /COMMIT 
cscript %windir%\system32\iisext.vbs /AddFile D:\local\php\php5isapi.dll 1 php 1 "PHP ISAPI"

::站点phpMyAdmin
echo y|cacls "D:\local\php\phpMyAdmin"  /E /T /G everyone:R
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs create_vserv  w3svc/99
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/servercomment "phpMyAdmin"
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/serverbindings ":8081:"
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/enabledefaultdoc true
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs create_vdir w3svc/99/root
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/root/path D:\local\php\phpMyAdmin
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/root/accessread true
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/root/enabledefaultdoc true
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/root/accessscript true
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/99/root/appfriendlyName 默认应用程序
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs start_server w3svc/99

::启动服务
sc start w3svc && sc start httpfilter
gpupdate /force
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
exit

:gzip
::启用Gzip
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
exit

:disgzip
::禁用Gzip
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/filters/compression/parameters/HcDoDynamicCompression FLASE
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/filters/compression/parameters/HcDoStaticCompression FLASE
cscript %systemdrive%\Inetpub\AdminScripts\adsutil.vbs set w3svc/filters/compression/parameters/HcDoOnDemandCompression FLASE
exit

:ea
::启用eAccelerator
echo.>> %windir%\php.ini
echo extension="eAccelerator.dll">> %windir%\php.ini
echo eaccelerator.shm_size="64">> %windir%\php.ini
echo eaccelerator.cache_dir="D:\local\php\temp">> %windir%\php.ini
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
iisreset /restart
exit