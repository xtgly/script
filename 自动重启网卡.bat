@echo off 

set con=3
set curldate=%date% %time%

:start
if %con% equ 0 (goto:reset) else set /a con-=1
C:\WINDOWS\system32\ping.exe 218.93.211.225 -n 1 | findstr TTL
if %errorlevel% neq 0 goto:slz
exit

:slz
echo %curldate% >> C:\windows\time.log
ipconfig /flushdns
ipconfig /registerdns
taskkill /f /im netsh.exe
C:\windows\devcon.exe disable *DEV_8139*
netsh interface set interface name="Local Area Connection 2" admin=disabled


cls
set num=10

:time
if %num% equ 0 (goto:end) else set /a num-=1
echo %num%
ping -n 2 127.0.1>nul 2>nul&cls
goto:time

:end
C:\windows\devcon.exe enable *DEV_8139*
netsh interface set interface name="Local Area Connection 2" admin=enable
goto:start

:reset
C:\windows\system32\shutdown.exe -r -t 30

rem netsh interface set interface name="Local Area Connection" admin=disabled
rem netsh interface set interface name="Local Area Connection" admin=enable 