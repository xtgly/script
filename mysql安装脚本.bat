@echo off
TITLE Powered By 莆阳IDC 1049832302@qq.com
MODE con: COLS=50 LINES=22
color 27

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

gpupdate /force
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters

sc start mysql