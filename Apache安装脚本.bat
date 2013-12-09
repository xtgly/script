@echo off
TITLE Powered By 莆阳IDC 1049832302@qq.com
MODE con: COLS=50 LINES=22
color 27

set option=%1
if "%option%"=="ea" goto ea

sc stop apache2.2
D:\local\apache\bin\httpd -k uninstall
sc delete apache2.2
D:\local\apache\bin\httpd -k install

::PHP权限
echo y|cacls "D:\local\apache\php"  /E /T /G USERS:R
echo y|cacls "D:\local\apache\php\temp"  /E /T /G everyone:F

::启动服务
sc start apache2.2
exit

:ea
::启用eAccelerator
echo.>> D:\local\apache\php\php.ini
echo extension="eAccelerator.dll">> D:\local\apache\php\php.ini
echo eaccelerator.shm_size="64">> D:\local\apache\php\php.ini
echo eaccelerator.cache_dir="D:\local\apache\php\temp">> D:\local\apache\php\php.ini
echo eaccelerator.enable="1">> D:\local\apache\php\php.ini
echo eaccelerator.optimizer="1">> D:\local\apache\php\php.ini
echo eaccelerator.check_mtime="1">> D:\local\apache\php\php.ini
echo eaccelerator.debug="0">> D:\local\apache\php\php.ini
echo eaccelerator.filter="">> D:\local\apache\php\php.ini
echo eaccelerator.shm_max="0">> D:\local\apache\php\php.ini
echo eaccelerator.shm_ttl="0">> D:\local\apache\php\php.ini
echo eaccelerator.shm_prune_period="0">> D:\local\apache\php\php.ini
echo eaccelerator.shm_only="0">> D:\local\apache\php\php.ini
echo eaccelerator.compress="1">> D:\local\apache\php\php.ini
echo eaccelerator.compress_level="9">> D:\local\apache\php\php.ini
echo eaccelerator.keys = "shm">> D:\local\apache\php\php.ini
echo eaccelerator.sessions = "shm">> D:\local\apache\php\php.ini
echo eaccelerator.content = "shm">> D:\local\apache\php\php.ini
D:\local\apache\bin\httpd.exe -k restart
exit