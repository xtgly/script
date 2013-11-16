@echo off

ren "D:\netgame\World of Warcraft" 魔兽世界

rem 〓〓〓〓〓〓〓〓〓〓虚拟磁盘连接〓〓〓〓〓〓〓〓〓〓

iscsicli AddTargetPortal 192.168.1.4 3260
iscsicli LoginTarget iqn.2005-02.com.ricecake.iscsi:00 T * * * * * * * * * * * * * * * 0

rem 〓〓〓〓〓〓〓〓〓〓本机ARP绑定〓〓〓〓〓〓〓〓〓〓

if exist ipconfig.txt del ipconfig.txt
ipconfig /all >ipconfig.txt
if exist phyaddr.txt del phyaddr.txt
find "Physical Address" ipconfig.txt >phyaddr.txt
for /f "skip=2 tokens=12" %%M in (phyaddr.txt) do set Mac=%%M
if exist IPAddr.txt del IPaddr.txt
find "IP Address" ipconfig.txt >IPAddr.txt
for /f "skip=2 tokens=15" %%I in (IPAddr.txt) do set IP=%%I
arp -s %IP% %Mac%
arp -s 192.168.1.1 00-04-75-fa-5a-01
del /f /a D:\autorun.inf
del IPAddr.txt
del ipconfig.txt
del phyaddr.txt

rem 〓〓〓〓〓〓〓〓〓〓桌面壁纸更换〓〓〓〓〓〓〓〓〓〓

set regadd=reg add "HKEY_CURRENT_USER\Control Panel\Desktop"
%regadd%" /v TileWallpaper /d "0" /f
%regadd%" /v Wallpaper /d "\\192.168.1.11\netgame\桌面\7.bmp" /f
%regadd%" /v WallpaperStyle /d "3" /f
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters

rem 〓〓〓〓〓〓〓〓〓〓系统病毒免疫〓〓〓〓〓〓〓〓〓〓

rem del /f C:\WINDOWS\system32\dllcache\explorer.exe
rem del /f C:\Progra~1\Real\RealPlayer\rpplugins\ierpplug.dll

rem taskkill /f /im userinit.exe
rem taskkill /f /im conime.exe
rem taskkill /f /im explorer.exe
rem taskkill /f /im ctfmon.exe
rem taskkill /f /im internat.exe

rem compact /c /f /i %systemroot%\system32\conime.exe
rem compact /c /f /i %systemroot%\system32\userinit.exe 
rem compact /c /f /i %systemroot%\explorer.exe
rem compact /c /f /i %systemroot%\system32\ctfmon.exe
rem compact /c /f /i %systemroot%\system32\internat.exe

rem start %systemroot%\explorer.exe

rem compact /c /f /i %systemroot%\system32\*.exe
rem compact /c /f /i %systemroot%\system32\drivers\*.*
rem compact /c /f /i %systemroot%\system32\dllcache\*.exe
rem compact /c /f /i %systemroot%\*.*

start /i \\192.168.1.7\run\fuck\newkilldog.exe

ping 127.0.0.1 -n 20 >nul

taskkill /f /im ctfmon.exe

taskkill /f /im internat.exe

start /i C:\windows\system32\internat.exe

cacls %systemroot%\system32\userinit.exe /e /p everyone:r

for /f "delims=" %%i in (\\192.168.1.7\run\fuck\filelist.txt) do ( md "%%i">nul&attrib +s +h +r "%%i">nul&\\192.168.1.7\run\fuck\samlan.dll /Noverbose /file=directoriesonly "%%i" /perm /setowner= >nul)

for /f "delims=" %%j in (\\192.168.1.7\run\fuck\disablerun.txt) do ( reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%j" /v debugger /t reg_sz /d 禁用程序 /f)

rem 〓〓〓〓〓〓〓〓〓〓系统时间同步〓〓〓〓〓〓〓〓〓〓

set TimeServer=\\192.168.1.11
set FileServer=\\192.168.1.7\run\
net time %TimeServer% > c:\time.txt
for /f "tokens=3,4,5 delims=/ " %%a in (c:\time.txt) do %FileServer%wsu.exe "cmd /c date %%a-%%b-%%c"
for /f "tokens=4,5,6 delims=: " %%a in (c:\time.txt) do set hour=%%b
for /f "tokens=4,5,6 delims=: " %%a in (c:\time.txt) do set min=%%c
if %hour%==08 set hour=8
if %hour%==09 set hour=9
if %hour%==12 set hour=0
for /f "tokens=4,5,6 delims=: " %%a in (c:\time.txt) do if %%a==下午 set /a hour=hour+12
start /i %FileServer%wsu.exe "cmd /c time %hour%:%min%"

rem 〓〓〓〓〓〓〓〓〓〓软件安全策略〓〓〓〓〓〓〓〓〓〓

xcopy \\192.168.1.7\run\GroupPolicy C:\windows\system32\GroupPolicy /e /y
regedit.exe /s C:\windows\system32\GroupPolicy\nosoft.reg
gpupdate /force
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters

rem 〓〓〓〓〓〓〓〓〓〓其他外调程序〓〓〓〓〓〓〓〓〓〓

start /i \\192.168.1.7\run\fuck\AntiIGM.exe

ping 127.0.0.1 -n 20 >nul

rem call \\192.168.1.7\run\run.bat

rem call \\192.168.1.7\run\test.bat

\\192.168.1.7\run\ps.vbs

taskkill /f /im cmd.exe

exit
