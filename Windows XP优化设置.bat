@echo off
TITLE  Windows XP 优化设置 Powered By Fjcyz QQ:272713163
MODE con: COLS=50 LINES=30
color 2f
:startfjcyz
cls
echo         ╭───────────────╮
echo   ╭──┤    Windows XP 优 化 设 置    ├──╮
echo   │    ╰───────────────╯    │
echo   │                                          │
echo   │  1、系统维护                             │
echo   │                                          │
echo   │  2、系统优化                             │
echo   │                                          │
echo   │  3、进程开放端口查看                     │
echo   │                                          │
echo   │  4、测试网络连通                         │
echo   │                                          │
echo   │  5、局域网扫描                           │
echo   │                                          │
echo   │  6、Ghost全自动修改配置                  │
echo   │                                          │
echo   │  7、Internet Explorer 修复               │
echo   │                                          │
echo   │  8、系统常用工具                         │
echo   │                                          │
echo   │  9、系统安全防范                         │
echo   │                                          │
echo   │  0、结束任意进程                         │
echo   │                                          │
echo   │  Z、退 出                                │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
set /p choice=  请选择:
if "%choice%"=="1" goto 1
if "%choice%"=="2" goto 2
if "%choice%"=="3" goto 3
if "%choice%"=="4" goto 4
if "%choice%"=="5" goto 5
if "%choice%"=="6" goto 6
if "%choice%"=="7" goto 7
if "%choice%"=="8" goto 8
if "%choice%"=="9" goto 9
if "%choice%"=="0" goto 0
if "%choice%"=="0a" goto 0a
if "%choice%"=="z" goto exit
goto startfjcyz
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
:1
cls
echo         ╭───────────────╮
echo   ╭──┤    Windows XP 系 统 维 护    ├──╮
echo   │    ╰───────────────╯    │
echo   │                                          │
echo   │  1、禁止本地连接属性                     │
echo   │                                          │
echo   │  2、禁止注册表                           │
echo   │                                          │
echo   │  3、禁止组策略                           │
echo   │                                          │
echo   │  4、禁止更改密码、锁定计算机按钮         │
echo   │                                          │
echo   │  5、禁止CMD命令                          │
echo   │                                          │
echo   │  6、禁止任务管理器                       │
echo   │                                          │
echo   │  7、禁止运行 (注销生效)                  │
echo   │                                          │
echo   │  8、禁止指定程序                         │
echo   │                                          │
echo   │  9、运行指定程序 (注销生效)              │
echo   │                                          │
echo   │  0、返回上层菜单                         │
echo   │                                          │
echo   │  z、退 出                                │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
set /p list1=  请选择:
if "%list1%"=="1" goto list1_1
if "%list1%"=="1a" goto list1_1a
if "%list1%"=="2" goto list1_2
if "%list1%"=="2a" goto list1_2a
if "%list1%"=="3" goto list1_3
if "%list1%"=="3a" goto list1_3a
if "%list1%"=="4" goto list1_4
if "%list1%"=="4a" goto list1_4a
if "%list1%"=="5" goto list1_5
if "%list1%"=="5a" goto list1_5a
if "%list1%"=="6" goto list1_6
if "%list1%"=="6a" goto list1_6a
if "%list1%"=="7" goto list1_7
if "%list1%"=="7a" goto list1_7a
if "%list1%"=="8" goto list1_8
if "%list1%"=="8a" goto list1_8a
if "%list1%"=="9" goto list1_9
if "%list1%"=="9a" goto list1_9a
if "%list1%"=="0" goto startfjcyz
if "%list1%"=="z" goto exit
goto 1
goto 1
:list1_1
reg add HKCU\SOFTWARE\Policies\Microsoft\Windows\Network" "Connections /v NC_LanProperties /t reg_dword /d 00000000 /f
reg add HKCU\SOFTWARE\Policies\Microsoft\Windows\Network" "Connections /v NC_EnableAdminProhibits /t reg_dword /d 00000001 /f
goto 1
:list1_1a
reg add HKCU\SOFTWARE\Policies\Microsoft\Windows\Network" "Connections /v NC_LanProperties /t reg_dword /d 00000000 /f
reg add HKCU\SOFTWARE\Policies\Microsoft\Windows\Network" "Connections /v NC_EnableAdminProhibits /t reg_dword /d 00000000 /f
goto 1
:list1_2
echo Windows Registry Editor Version 5.00>C:\sys.reg
echo.>>C:\sys.reg
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t reg_dword /d 00000001 /f
goto 1
:list1_2a
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /f
goto 1
:list1_3
reg add HKCU\Software\Policies\Microsoft\MMC\{8FC0B734-A0E1-11D1-A7D3-0000F87571E3} /v Restrict_Run /t reg_dword /d 00000001 /f
goto 1
:list1_3a
reg delete HKCU\Software\Policies\Microsoft\MMC\{8FC0B734-A0E1-11D1-A7D3-0000F87571E3} /v Restrict_Run /f
goto 1
:list1_4
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableChangePassword /t reg_dword /d 00000001 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableLockWorkstation /t reg_dword /d 00000001 /f
goto 1
:list1_4a
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableChangePassword /f
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableLockWorkstation /f
goto 1
:list1_5
reg add HKCU\Software\Policies\Microsoft\Windows\System /v DisableCMD /t reg_dword /d 00000001 /f
goto 1
:list1_5a
reg delete HKCU\Software\Policies\Microsoft\Windows\System /v DisableCMD /f
goto 1
:list1_6
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\system /v DisableTaskMgr /t reg_dword /d 00000001 /f
goto 1
:list1_6a
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f
goto 1
:list1_7
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /t reg_dword /d 00000001 /f
goto 1
:list1_7a
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /f
goto 1
:list1_8
cls
set /p a=     输入禁用程序编号：
echo.
set /p b=     输入指定程序名称：
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun /v %a% /d %b% /f
goto 1
:list1_8a
reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun /va /f
goto 1
:list1_9
cls
set /p c=     输入指定程序编号：
echo.
set /p d=     输入指定程序名称：
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v RestrictRun /t reg_dword /d 00000001 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\RestrictRun /v %c% /d %d% /f
goto 1
:list1_9a
reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v RestrictRun /f
reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\RestrictRun /f
goto 1
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
:2
cls
echo         ╭───────────────╮
echo   ╭──┤    Windows XP 优 化 大 全    ├──╮
echo   │    ╰───────────────╯    │
echo   │                                          │
echo   │  1、网吧系统服务优化                     │
echo   │                                          │
echo   │  2、恢复默认系统服务                     │
echo   │                                          │
echo   │  3、最精简系统服务优化                   │
echo   │                                          │
echo   │  4、备份当前系统所有服务                 │
echo   │                                          │
echo   │  5、德国人原版 Windows XP 优化           │
echo   │                                          │
echo   │  6、注册表项目优化                       │
echo   │                                          │
echo   │  7、清理系统垃圾                         │
echo   │                                          │
echo   │  8、封杀135、445端口                     │
echo   │                                          │
echo   │  9、恢复135、445端口                     │
echo   │                                          │
echo   │  0、返回上层菜单                         │
echo   │                                          │
echo   │  Z、退出                                 │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
set /p list2=  请选择:
if "%list2%"=="1" goto list2_1
if "%list2%"=="2" goto list2_2
if "%list2%"=="3" goto list2_3
if "%list2%"=="4" goto list2_4
if "%list2%"=="5" goto list2_5
if "%list2%"=="6" goto list2_6
if "%list2%"=="7" goto list2_7
if "%list2%"=="8" goto list2_8
if "%list2%"=="9" goto list2_9
if "%list2%"=="0" goto startfjcyz
if "%list2%"=="z" goto exit
goto 2
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
:list2_1
cls
echo 网吧系统服务优化,稍侯片刻......
sc config Alerter start= DISABLED
sc config ALG start= DISABLED
sc config AppMgmt start= DEMAND
sc config AudioSrv start= AUTO
sc config BITS start= DISABLED
sc config Browser start= DISABLED
sc config CiSvc start= DISABLED
sc config ClipSrv start= DISABLED
sc config COMSysApp start= DEMAND
sc config CryptSvc start= DEMAND
sc config DcomLaunch start= AUTO
sc config Dhcp start= DISABLED
sc config dmadmin start= DEMAND
sc config dmserver start= DEMAND
sc config Dnscache start= DISABLED
sc config ERSvc start= DISABLED
sc config Eventlog start= AUTO
sc config EventSystem start= DEMAND
sc config helpsvc start= DISABLED
sc config HidServ start= DISABLED
sc config HTTPFilter start= DEMAND
sc config ImapiService start= DISABLED
sc config lanmanserver start= DISABLED
sc config lanmanworkstation start= AUTO 
sc config LmHosts start= DISABLED
sc config Messenger start= DISABLED
sc config mnmsrvc start= DISABLED
sc config MSDTC start= DISABLED
sc config MSIServer start= DEMAND
sc config NetDDE start= DISABLED
sc config NetDDEdsdm start= DISABLED
sc config Netlogon start= DISABLED
sc config Netman start= DEMAND
sc config Nla start= DISABLED
sc config NtLmSsp start= DISABLED
sc config NtmsSvc start= DEMAND
sc config PlugPlay start= AUTO
sc config PolicyAgent start= DEMAND
sc config ProtectedStorage start= AUTO
sc config RasAuto start= DEMAND
sc config RasMan start= DEMAND
sc config RDSessMgr start= DISABLED
sc config remoteAccess start= DISABLED
sc config remoteRegistry start= DISABLED
sc config RpcLocator start= DISABLED
sc config RpcSs start= AUTO
sc config SamSs start= AUTO
sc config SCardSvr start= DISABLED
sc config Schedule start= DISABLED
sc config seclogon start= DISABLED
sc config SENS start= AUTO
sc config SharedAccess start= DEMAND
sc config ShellHWDetection start= DISABLED
sc config Spooler start= DISABLED
sc config stisvc start= DEMAND
sc config swprv start= DISABLED
sc config SysmonLog start= DISABLED
sc config TapiSrv start= DEMAND
sc config TermService start= AUTO
sc config Themes start= DISABLED
sc config TrkWks start= DISABLED
sc config UMWdf start= DEMAND
sc config UPS start= DISABLED
sc config VSS start= DISABLED
sc config W32Time start= DISABLED
sc config WebClient start= DISABLED
sc config winmgmt start= AUTO
sc config WmdmPmSN start= DISABLED 
sc config Wmi start= DEMAND 
sc config WmiApSrv start= DISABLED 
sc config wuauserv start= DISABLED 
sc config WZCSVC start= DISABLED 
sc config xmlprov start= DEMAND 
sc config DcomLaunch start= AUTO 
sc config FastUserSwitchingCompatibility start= DEMAND 
sc config srservice start= DISABLED 
sc config SSDPSRV start= DISABLED 
sc config TlntSvr start= DISABLED 
sc config upnphost start= DEMAND 
sc config wscsvc start= DISABLED 
echo 网吧系统优化结束,按任意键返回!
pause >nul
goto 2
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
:list2_2
cls
echo Windows XP 系统默认服务,稍侯片刻......
sc config   Alerter start= DISABLED 
sc config   ALG start= DEMAND 
sc config   AppMgmt start= DEMAND 
sc config   AudioSrv start= AUTO 
sc config   BITS start= DEMAND 
sc config   Browser start= AUTO 
sc config   CiSvc start= DEMAND 
sc config   ClipSrv start= DISABLED 
sc config   COMSysApp start= DEMAND 
sc config   CryptSvc start= AUTO 
sc config   DcomLaunch start= AUTO 
sc config   Dhcp start= AUTO 
sc config   dmadmin start= DEMAND 
sc config   dmserver start= AUTO 
sc config   Dnscache start= AUTO 
sc config   ERSvc start= AUTO 
sc config   Eventlog start= AUTO 
sc config   EventSystem start= DEMAND 
sc config   FastUserSwitchingCompatibility start= DEMAND 
sc config   helpsvc start= AUTO 
sc config   HidServ start= DISABLED 
sc config   HTTPFilter start= DEMAND 
sc config   ImapiService start= DEMAND 
sc config   lanmanserver start= AUTO 
sc config   lanmanworkstation start= AUTO 
sc config   LmHosts start= AUTO 
sc config   Messenger start= DISABLED 
sc config   mnmsrvc start= DEMAND 
sc config   MSDTC start= DEMAND 
sc config   MSIServer start= DEMAND 
sc config   NetDDE start= DISABLED 
sc config   NetDDEdsdm start= DISABLED 
sc config   Netlogon start= DEMAND 
sc config   Netman start= DEMAND 
sc config   Nla start= DEMAND 
sc config   NtLmSsp start= DEMAND 
sc config   NtmsSvc start= DEMAND 
sc config   PlugPlay start= AUTO 
sc config   PolicyAgent start= AUTO 
sc config   ProtectedStorage start= AUTO 
sc config   RasAuto start= DEMAND 
sc config   RasMan start= DEMAND 
sc config   RDSessMgr start= DEMAND 
sc config   RemoteAccess start= DISABLED 
sc config   RemoteRegistry start= AUTO 
sc config   RpcLocator start= DEMAND 
sc config   RpcSs start= AUTO 
sc config   RSVP start= DEMAND 
sc config   SamSs start= AUTO 
sc config   SCardSvr start= DEMAND 
sc config   Schedule start= AUTO 
sc config   seclogon start= AUTO 
sc config   SENS start= AUTO 
sc config   SharedAccess start= AUTO 
sc config   ShellHWDetection start= AUTO 
sc config   Spooler start= AUTO 
sc config   srservice start= DISABLED 
sc config   SSDPSRV start= DEMAND 
sc config   stisvc start= DEMAND 
sc config   SwPrv start= DEMAND 
sc config   SysmonLog start= DEMAND 
sc config   TapiSrv start= DEMAND 
sc config   TermService start= DEMAND 
sc config   Themes start= AUTO 
sc config   TlntSvr start= DISABLED 
sc config   TrkWks start= AUTO 
sc config   UMWdf start= DEMAND 
sc config   upnphost start= DEMAND 
sc config   UPS start= DEMAND 
sc config   VSS start= DEMAND 
sc config   W32Time start= AUTO 
sc config   WebClient start= AUTO 
sc config   winmgmt start= AUTO 
sc config   WmdmPmSN start= DEMAND 
sc config   Wmi start= DEMAND 
sc config   WmiApSrv start= DEMAND 
sc config   wscsvc start= AUTO 
sc config   wuauserv start= AUTO 
sc config   WZCSVC start= AUTO 
sc config   xmlprov start= DEMAND 
echo 恢复Windows Xp系统服务结束,按任意键返回!
pause >nul
goto 2
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
:list2_3
cls
echo 最精简系统优化,稍侯片刻...
sc config   Alerter start= DISABLED 
sc config   ALG start= DISABLED 
sc config   AppMgmt start= DEMAND 
sc config   AudioSrv start= AUTO 
sc config   BITS start= DEMAND 
sc config   Browser start= DISABLED 
sc config   CiSvc start= DISABLED 
sc config   ClipSrv start= DISABLED 
sc config   COMSysApp start= DEMAND 
sc config   CryptSvc start= AUTO 
sc config   DcomLaunch start= AUTO 
sc config   Dhcp start= AUTO 
sc config   dmadmin start= DEMAND 
sc config   dmserver start= DEMAND 
sc config   Dnscache start= DISABLED 
sc config   ERSvc start= DISABLED 
sc config   Eventlog start= AUTO 
sc config   EventSystem start= AUTO 
sc config   FastUserSwitchingCompatibility start= DEMAND 
sc config   helpsvc start= DISABLED 
sc config   HidServ start= AUTO 
sc config   HTTPFilter start= DEMAND 
sc config   ImapiService start= DISABLED 
sc config   lanmanserver start= DISABLED 
sc config   lanmanworkstation start= AUTO 
sc config   LmHosts start= AUTO 
sc config   Messenger start= DISABLED 
sc config   mnmsrvc start= DEMAND 
sc config   MSDTC start= DEMAND 
sc config   MSIServer start= DEMAND 
sc config   NetDDE start= DISABLED 
sc config   NetDDEdsdm start= DISABLED 
sc config   Netlogon start= DEMAND 
sc config   Netman start= AUTO 
sc config   Nla start= DISABLED 
sc config   NtLmSsp start= DEMAND 
sc config   NtmsSvc start= DEMAND 
sc config   ose start= DEMAND 
sc config   PlugPlay start= AUTO 
sc config   PolicyAgent start= DISABLED 
sc config   ProtectedStorage start= AUTO 
sc config   RasAuto start= DEMAND 
sc config   RasMan start= DEMAND 
sc config   RDSessMgr start= DEMAND 
sc config   RemoteAccess start= DISABLED 
sc config   RemoteRegistry start= DISABLED 
sc config   RpcLocator start= DEMAND 
sc config   RpcSs start= AUTO 
sc config   RSVP start= DEMAND 
sc config   SamSs start= AUTO 
sc config   SCardSvr start= DEMAND 
sc config   Schedule start= DISABLED 
sc config   seclogon start= AUTO 
sc config   SENS start= AUTO 
sc config   SharedAccess start= DISABLED 
sc config   ShellHWDetection start= AUTO 
sc config   Spooler start= DISABLED 
sc config   srservice start= DISABLED 
sc config   SSDPSRV start= DISABLED 
sc config   stisvc start= AUTO 
sc config   SwPrv start= DEMAND 
sc config   SysmonLog start= DEMAND 
sc config   TapiSrv start= DEMAND 
sc config   TermService start= DISABLED 
sc config   Themes start= DISABLED 
sc config   TlntSvr start= DISABLED 
sc config   TrkWks start= AUTO 
sc config   UMWdf start= AUTO 
sc config   upnphost start= DEMAND 
sc config   UPS start= DEMAND 
sc config   VSS start= DEMAND 
sc config   W32Time start= DISABLED 
sc config   WebClient start= DISABLED 
sc config   winmgmt start= AUTO 
sc config   WMConnectCDS start= DEMAND 
sc config   WmdmPmSN start= DEMAND 
sc config   Wmi start= DEMAND 
sc config   WmiApSrv start= DEMAND 
sc config   wscsvc start= DISABLED 
sc config   wuauserv start= DISABLED 
sc config   WZCSVC start= DISABLED 
sc config   xmlprov start= DEMAND 
echo 最精简系统优化结束,按任意键返回!
pause >nul
goto 2
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
:list2_4
cls
rem  get current date and time
for /f "tokens=1, 2, 3, 4 delims=-/. " %%j in ('Date /T') do set FILENAME=srv_%%j_%%k_%%l_%%m
for /f "tokens=1, 2 delims=: " %%j in ('TIME /T') do set FILENAME=%FILENAME%_%%j_%%k.bat
rem get all service name
sc query type= service state= all| findstr /r /C:"SERVICE_NAME:" >tmpsrv.txt
echo Save Service Start State In %FILENAME%
rem save service start state into batch file 
echo @echo Restore The Service Start State Saved At %TIME% %DATE% >"%FILENAME%" 
echo @pause >>"%FILENAME%"
for /f "tokens=2 delims=:" %%j in (tmpsrv.txt) do @( sc qc %%j |findstr  START_TYPE >tmpstype.txt &&  for /f "tokens=4 delims=:_ " %%s in ( tmpstype.txt) do @echo sc config  %%j start= %%s >>"%FILENAME%")
echo @pause >>"%FILENAME%"
del tmpsrv.txt
del tmpstype.txt 
echo 备份文件名 : %FILENAME% 
echo    按任意键返回!
pause >nul
goto 2
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
:list2_6
cls
echo         ╭───────────────╮
echo   ╭──┤          优 化 内 容         ├──╮
echo   │    ╰───────────────╯    │
echo   │                                          │
echo   │  不加载多余的DLL文件、关闭文件系统保护   │
echo   │                                          │
echo   │  快速关程序、取消分组任务、设置CMD根目录 │
echo   │                                          │
echo   │  加快菜单显示速度、加快局域网访问速度    │
echo   │                                          │
echo   │  减少开机滚动条滚动次数、加快开关机速度  │
echo   │                                          │
echo   │  自动关闭停止响应的程序、关闭Dr_Warson   │
echo   │                                          │
echo   │  停止磁盘空间不足警告、禁止(IPC$)默认共享│
echo   │                                          │
echo   │  启用大系统缓存、禁止空用户连接          │
echo   │                                          │
echo   │  使XP系统支持137G以上的硬盘              │
echo   │                                          │
echo   │  修改注册信息、关闭自动重新启动功能      │
echo   │                                          │
echo   │  禁用桌面清理向导、禁用Windows XP漫游    │
echo   │                                          │
echo   │  删除共享文档、显示验证码、开启键盘灯    │
echo   │                                          │
echo   │  禁用错误报告、删除快捷方式的箭头等等(略)│
echo   ╰─────────────────────╯
echo         任意键继续!
pause >nul
cls
echo 不加载多余的DLL文件
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v AlwaysUnloadDLL /d 1 /f
echo 关闭文件系统保护
reg add HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion\Winlogon /v SFCDisable /t reg_dword /d 00000004 /f
echo 关闭程序仅等待1秒,程序出错时等待0.5秒
reg add HKCU\Control" "Panel\Desktop /v HungAppTimeout /d 200 /f
reg add HKCU\Control" "Panel\Desktop /v WaitToKillAppTimeout /d 1000 /f
echo 加快菜单显示速度
reg add HKCU\Control" "Panel\Desktop /v MenuShowDelay /d 0 /f
echo 加快局域网访问速度
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace\{D6277990-4C6A-11CF-8D87-00AA0060F5BF}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace\{2227A280-3AEA-1069-A2DE-08002B30309D}" /f
echo 减少开机滚动条滚动次数
reg add HKLM\SYSTEM\CurrentControlSet\Control\Session" "Manager\Memory" "Management\PrefetchParameters /v EnablePrefetcher /t reg_dword /d 00000001 /f
echo 加快开关机速度
reg add HKCU\Control" "Panel\Desktop /v AutoEndTasks /d 0 /f
reg add HKCU\Control" "Panel\Desktop /v HungAppTimeout /d 5000 /f
reg add HKCU\Control" "Panel\Desktop /v WaitToKillAppTimeout /d 1000 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control /v WaitToKillServiceTimeout /d 1000 /f
echo 自动关闭停止响应的程序
reg add HKCU\Control" "Panel\Desktop /v AutoEndTasks /d 1 /f
echo 彻底关闭Dr_Warson
reg add HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion\AeDebug /v Auto /d 0 /f
echo 停止磁盘空间不足警告
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer /v NoLowDiskSpaceChecks /t reg_dword /d 00000001 /f
echo 禁止(IPC$)自动打开默认共享
reg add HKLM\SYSTEM\CurrentControlSet\Services\lanmanServer\parameters /v AutoShareServer /t reg_dword /d 00000000 /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\lanmanServer\parameters /v AutoShareWks /t reg_dword /d 00000000 /f
echo 启用大系统缓存
reg add HKLM\SYSTEM\CurrentControlSet\Control\Session" "Manager\Memory" "Management /v LargeSystemCache /t reg_dword /d 00000001 /f
echo 禁止空用户连接
reg add HKLM\SYSTEM\CurrentControlSet\Control\LSA /v restrictanonymous /t reg_dword /d 00000001 /f
echo 使XP系统支持137G以上的硬盘
reg add HKLM\SYSTEM\CurrentControlSet\Services\atapi\Parameters /v EnableBigLba /t reg_dword /d 00000001 /f
echo 修改注册信息 Fjcyz  网吧专用系统
reg add HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOwner /d QQ:272713163 /f
reg add HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOrganization /d 网吧专用系统 /f
echo 关闭自动重新启动功能
reg add HKLM\SYSTEM\CurrentControlSet\Control\CrashControl /v AutoReboot /t reg_dword /d 00000000 /f
echo 删除共享文档
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\DelegateFolders\{59031a47-3f72-44a7-89c5-5595fe6b30ee} /f
echo 显示验证码
reg add HKLM\SOFTWARE\Microsoft\Internet" "Explorer\Security /v BlockXBM /t reg_word /d 00000000 /f
echo 禁用Windows XP漫游 气球提醒
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Tour /v RunCount /t reg_dword /d 00000000 /f
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Applets\Tour /v RunCount /t reg_dword /d 00000000 /f
echo 移除最烦人的图形右键
reg delete HKCR\Directory\Background\shellex\ContextMenuHandlers\igfxcui /f
reg delete HKCR\Directory\Background\shellex\ContextMenuHandlers\NvCplDesktopContext /f
echo 开启小键盘指示灯
reg add HKU\.DEFAULT\Control" "Panel\Keyboard /v InitialKeyboardIndicators /d 2 /f
reg add HKU\.DEFAULT\Control" "Panel\KeyboardDelay /v InitialKeyboardIndicators /d 1 /f
reg add HKU\.DEFAULT\Control" "Panel\KeyboardSpeed /v InitialKeyboardIndicators /d 31 /f
echo 禁用桌面清理向导
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\CleanupWiz /v NoRun /t reg_dword /d 00000001 /f
echo 禁用错误报告，但在发生严重错误时通知我
reg add HKLM\SOFTWARE\Microsoft\PCHealth\ErrorReporting /v DoReport /t reg_dword /d 00000000 /f
echo 把Internet Explorer可同时下载的文件数目增大到10
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Internet" "Settings /v MaxConnectionsPer1_0Server /t reg_dword /d 0000000a /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Internet" "Settings /v MaxConnectionsPerServer /t reg_dword /d 0000000a /f
echo 删除快捷方式的箭头
reg delete HKCR\lnkfile /v IsShortcut /f
echo 去掉右键新建的公文包、BMP、WAV、rtf等
reg delete HKCR\.bfc\ShellNew /f
reg delete HKCR\.rtf\ShellNew /f
reg delete HKCR\.bmp\ShellNew /f
reg delete HKCR\.wav\ShellNew /f
echo 经典显示控制面板
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v ForceClassicControlPanel /t reg_dword /d 00000001 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\FontSmoothing /v DefaultValue /t reg_dword /d 00000001 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\FontSmoothing /v DefaultApplied /t reg_dword /d 00000001 /f
echo 移去开始中帮助菜单
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSMHelp /t reg_dword /d 00000001 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSMHelp /t reg_dword /d 00000000 /f
echo 关闭分组相似任务栏按钮
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarGlomming /t reg_dword /d 00000000 /f
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarGlomming /t reg_dword /d 00000000 /f
echo 去除点击这里开始
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\PolicIEs\Explorer /v NoStartBanner /t reg_dword /d 16777216 /f
rem echo 设置CMD默认目录为C：
rem reg add HKCU\Software\Microsoft\Command" "Processor /v AutoRun /d Cd\ /f
echo 去除打开文件安全警告
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1806 /t reg_dword /d 0 /f
echo 导入CS1.5、CS1.6、劲舞团CDkey
REG ADD "HKCU\Software\Valve\CounterStrike\Settings" /v Key /t REG_SZ /d 3818213577714 /f
reg add "HKCU\Software\Valve\Half-Life\Settings" /v ValveKey /d 5RP2E-EPH3K-BR3LG-KMGTE-FN8PY /f
reg add "HKCU\Software\AUDITION" /v VERSION /t REG_dword /d 1017 /f
rem regsvr32 /u /s zipfldr.dll
Regsvr32 /u /s Thumbvw.dll
echo 优化Xp系统结束,按任意键返回!
pause >nul
goto 2
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
:list2_7
cls
echo.
echo 正在帮您清除系统垃圾文件，请稍等......
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*._mp
rem del /f /s /q %systemdrive%\*.log
del /f /s /q %systemdrive%\*.gid
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*
rd /s /q %windir%\temp & md %windir%\temp
del /f /q %userprofile%\cookies\*.*
del /f /q %userprofile%\recent\*.*
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q "%userprofile%\recent\*.*"
echo 清除系统垃圾完成,按任意键返回!
pause >nul
goto 2
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
:list2_8
cls
echo 开始封杀135,445端口...
reg add HKLM\SOFTWARE\Microsoft\Ole /v EnableDCOM /d N /f
reg add HKLM\SOFTWARE\Microsoft\Rpc /v "DCOM Protocols" /t REG_MULTI_SZ /d ncacn_spx\0ncacn_nb_nb\0ncacn_nb_ipx\0 /f
sc config   MSDTC start= DISABLED
reg add HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters /v SMBDeviceEnabled /t REG_DWORD /d 0 /f
echo 封杀135,445端口结束,按任意键返回!
pause >nul
goto 2
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
rem ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
:list2_9
cls
echo 开始恢复135,445端口...
reg add HKLM\SOFTWARE\Microsoft\Ole /v EnableDCOM /d Y /f
reg add HKLM\SOFTWARE\Microsoft\Rpc /v "DCOM Protocols" /t REG_MULTI_SZ /d ncacn_spx\0ncacn_nb_nb\0ncacn_nb_ipx\0ncacn_ip_tcp\0 /f
sc config   MSDTC start= AUTO
reg add HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters /v SMBDeviceEnabled /t REG_DWORD /d 1 /f
echo 恢复135,445端口结束,按任意键返回!
pause >nul
goto 2
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
:3
cls
setlocal enabledelayedexpansion 
echo        ╔-                              -╗ 
echo          本机开放的端口及使用该端口的进程 
echo        ╚-                              -╝ 
echo -------------------------------------------------- 
echo          端口号           进程名称       
ECHO TCP协议: 
::利用netstat命令找出使用TCP协议通信的端口，并将结果分割； 
::将第二个参数(IP加端口)传给%%i，第五个参数(PID号)传给%%j; 
for /F "usebackq skip=4 tokens=2,5" %%i in (`"netstat -ano -p TCP"`) do ( 
  call :Assoc %%i TCP %%j 
  echo           !TCP_Port!           !TCP_Proc_Name!  
) 

ECHO UDP协议: 
for /F "usebackq skip=4 tokens=2,4" %%i in (`"netstat -ano -p UDP"`) do (  
  call :Assoc %%i UDP %%j 
  echo           !UDP_Port!           !UDP_Proc_Name! 
) 
echo.
echo                按任意键退出 
pause>nul 
goto startfjcyz
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
:4
cls
echo.
echo.  正在测试本机Tcp/ip协议...
echo.
ping -n 1 127.0.0.1>nul
if %errorlevel% geq 1 (echo Tcp/ip 协议不能正常运行!) else (echo   Tcp/ip 协议运行正常!)
echo.
echo.  正在测试网卡驱动...
for /f "tokens=15 delims= " %%j in ('ipconfig ^|find /i "IP Address"') do ( 
   set tcpipipip=%%j )
ping -n 1 %tcpipipip% >nul
echo.
if %errorlevel% geq 1 (echo 网卡驱动不能正常运行!) else (echo   网卡驱动运行正常!)
echo.
echo   正在连接到广州电信...
echo.
ping -n 1 219.137.2.4>nul
if %errorlevel% geq 1 goto errorping
ping -n 10 219.137.2.4 >ping.txt
for /f "tokens=4 delims=m " %%a in ('type ping.txt ^|find /i "Minimum"') do (set sunsunnum=%%a)
for /f "tokens=9 delims=m " %%a in ('type ping.txt ^|find /i "Minimum"') do (set sunsunnum1=%%a)
for /f "tokens=13 delims=m " %%a in ('type ping.txt ^|find /i "Minimum"') do (set sunsunnum2=%%a)
echo   最小延时%sunsunnum%ms,最大延时%sunsunnum1%ms,平均延时%sunsunnum2%ms!
echo.
for /f "tokens=4 delims=, " %%j in ('type ping.txt ^|find /i "Packets:"') do set pingbbig=%%j
for /f "tokens=7 delims=, " %%j in ('type ping.txt ^|find /i "Packets:"') do set pingbbig2=%%j
for /f "tokens=10 delims=, " %%j in ('type ping.txt ^|find /i "Packets:"') do set pingbbig3=%%j
echo   共发送%pingbbig%个数据包,其中%pingbbig2%个数据包发送成功,%pingbbig3%个数据包发送失败!
echo.
echo.
echo.
del /f /q ping.txt
echo   测试完毕    任意键返回!
pause > nul
goto startfjcyz
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
:5
cls
echo         ╭───────────────╮
echo   ╭──┤   Windows XP 局 域 网 扫 描  ├──╮
echo   │    ╰───────────────╯    │
echo   │                                          │
echo   │  自动扫描IP尾数为 1~254 的电脑列表       │
echo   │                                          │
echo   │  根据Cscdkey.ini 及扫描结果生成          │
echo   │                                          │
echo   │  MACCFG.ini文件,该文件包含MAC列表        │
echo   │                                          │
echo   │  IP列表、机名列表、以及CS-CDKEY列表      │
echo   │                                          │
echo   │  可配合主菜单六的全自动修改配置          │
echo   │                                          │
echo   │  全自动修改IP、机名、CS-CDKEY            │
echo   │                                          │
echo   ╰─────────────────────╯
set /p ipq=请输入局域网IP的前3位(192.168.0)：
cls
if exist maccfg.ini set /p sure=发现配置文件MACCFG.ini,是否删除(y/n):
if "%sure%"=="y" del /f /q MACCFG.ini
echo.
echo.
echo.
if not exist cscdkey.ini set /p cccsss=找不到cscdkey.ini,是否自动生成 cscdkey.ini(y/n):
if "%cccsss%"=="y" goto cccsss

:startipscan
cls
echo         ╭───────────────╮
echo   ╭──┤   局 域 网 扫 描 By Fjcyz    ├──╮
echo   │    ╰───────────────╯    │
set startip=1
set online=0
set csnum=0
:scan
if %startip% GTR 254 goto scanipend
set ip=%ipq%.%startip%
ping -n 1 -w 1 %ip% >nul
if %errorlevel% GEQ 1 goto dz
set /a online+=1
for /f "tokens=1 delims=< " %%i in ('nbtstat -a %ip% ^| find /i "UNIQUE" ^| find /i "00"') do set pcname=%%i
if %startip% LSS 10 echo   │    %ip%     在  线     %pcname%
if %startip% LSS 100 (if %startip% GEQ 10 echo   │   %ip%     在  线     %pcname%)
if %startip% GEQ 100 echo   │  %ip%     在  线     %pcname%
for /f "tokens=4" %%i in ('nbtstat -a %ip% ^| find /i "MAC Address"')do set pcmac=%%i
for /f "tokens=2 delims=:" %%a in ('findstr a%csnum%: cscdkey.ini') do (set cdkey=%%a)
echo %ip% %pcmac% %pcname% %cdkey%>>MACCFG.INI
set /a startip+=1
set /a csnum+=1
goto scan
:dz
if %startip% LSS 10 echo   │    %ip%     离  线
if %startip% LSS 100 (if %startip% GEQ 10 echo   │   %ip%     离  线)
if %startip% GEQ 100 echo   │  %ip%     离  线
set /a startip+=1
goto scan
:scanipend
echo   │                  扫描完毕                │
echo   ╰─────────────────────╯
echo     共扫描254台PC 其中%online%台PC在线 按任意键返回
pause >nul
goto startfjcyz
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
:6
cls
echo         ╭───────────────╮
echo   ╭──┤   Windows XP 自动改IP、机名  ├──╮
echo   │    ╰───────────────╯    │
echo   │                                          │
echo   │  根据MACCFG.INI里的MAC对应的IP、机名、   │
echo   │                                          │
echo   │  CS列表全自动修改。                      │
echo   │                                          │
echo   │  DNS.INI配置里的DNS、子网、网关请手动    │
echo   │                                          │
echo   │  修改。                                  │
echo   │                                          │
echo   │  以上设置完后将自动本机ARP绑定           │
echo   │                                          │
echo   ╰─────────────────────╯
echo       按任意键继续
pause >nul
cls
if exist maccfg.ini goto ipset
echo 找不到 MACCFG.ini 配置文件！  按任意键继续！
pause >nul
goto startfjcyz

:ipset
if not exist dns.ini goto dnssetdns
:setsetsetip
cls
echo 正在设置接口信息...

for /f "tokens=2 delims=:" %%h in ('ipconfig /all^|find /i "Description"') do ( set wk=%%h )
echo 网卡  :  %wk%

for /f  "tokens=3 delims=: " %%s in ('ipconfig /all^|find /i "本地连接"') do (set name=%%s)
echo 接口  :  %name%

for /f "tokens=12 delims= " %%i in ('ipconfig /all^|find /i "Physical Address"') do ( set mac=%%i )
echo MAC   :  %mac%

for /f "tokens=* delims=" %%z in ('type MACCFG.ini^|find /i "%mac%"') do echo %%z > ComputerCfg.ini

for /f "tokens=1-4 delims= " %%j in (ComputerCfg.ini) do ( 
   set newip=%%j
   set cpn=%%l 
   set cskey=%%m )

for /f "tokens=1-4 delims= " %%r in (dns.ini) do ( 
   set dddnso=%%r
   set dddnst=%%s 
   set gggateway=%%t
   set mmmask=%%u )

netsh interface ip set address %name% static %newip% %mmmask% %gggateway% 1 >nul
netsh interface ip set dns name="%name%" source=static addr=%dddnso% >nul
netsh interface ip add dns name="%name%" addr=%dddnst% index=2 >nul

for /f "tokens=2 delims=:" %%o in ('ipconfig /all^|find /i "IP Address"') do ( set owip=%%o )
for /f "tokens=2 delims=:" %%p in ('ipconfig /all^|find /i "Subnet Mask"') do ( set owmask=%%p )
for /f "tokens=2 delims=:" %%q in ('ipconfig /all^|find /i "Default Gateway"') do ( set owgateway=%%q )
for /f "tokens=2 delims=:" %%r in ('ipconfig /all^|find /i "DNS Servers"') do ( set owdns=%%r )

echo IP    :  %owip%
echo DNS1  :  %owdns%
echo 掩码  :  %owmask%
echo 网关  :  %owgateway%

REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName /v "ComputerName" /t REG_SZ /d %cpn% /f >nul 2>NUL
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v "ComputerName" /t REG_SZ /d %cpn% /f >nul 2>NUL
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v "Hostname"    /t REG_SZ /d %cpn% /f >nul 2>NUL
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v "NV Hostname" /t REG_SZ /d %cpn% /f >nul 2>NUL
echo 机名  :  %cpn%

REG ADD HKCU\Software\Valve\CounterStrike\Settings /v "Key" /t REG_SZ /d %cskey% /f >nul 2>nul
echo CSKEY :  %cskey%
echo.
echo 正在执行本机ARP绑定...
arp -s %newip% %mac%
del /f /q ComputerCfg.ini
echo 设置成功！按任意键返回
pause > nul
goto startfjcyz
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
rem ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
:7
cls
echo         ╭───────────────╮
echo   ╭──┤   Windows XP IE 浏览器修复   ├──╮
echo   │    ╰───────────────╯    │
echo   │                                          │
echo   │  1、Internet Explorer 组件修复           │
echo   │                                          │
echo   │  2、Internet Explorer 常规修复           │
echo   │                                          │
echo   │  3、返回上层菜单                         │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
set /p list7=     请选择:
if "%list7%"=="1" goto list7_1
if "%list7%"=="2" goto list7_2
if "%list7%"=="3" goto startfjcyz
goto 7
:list7_1
cls
echo 任意键开始修复...
pause >nul 
echo.
echo       正在修复，这个过程可能需要几分钟，请稍候……
rundll32.exe advpack.dll /DelNodeRunDLL32 %systemroot%\System32\dacui.dll
rundll32.exe advpack.dll /DelNodeRunDLL32 %systemroot%\Catroot\icatalog.mdb
regsvr32 /s urlmon.dll
regsvr32 /s urlmon.dll /i
regsvr32 /s comcat.dll
regsvr32 /s asctrls.ocx
regsvr32 /s oleaut32.dll
regsvr32 /s shdocvw.dll /I
regsvr32 /s shdocvw.dll
regsvr32 /s browseui.dll
regsvr32 /s browseui.dll /I
regsvr32 /s msrating.dll
regsvr32 /s mlang.dll
regsvr32 /s hlink.dll
regsvr32 /s mshtml.dll
regsvr32 /s mshtmled.dll
regsvr32 /s plugin.ocx
regsvr32 /s sendmail.dll
regsvr32 /s mshtml.dll /i
regsvr32 /s scrobj.dll
regsvr32 /s corpol.dll
regsvr32 /s jscript.dll
regsvr32 /s msxml.dll
regsvr32 /s imgutil.dll
regsvr32 /s cryptext.dll
regsvr32 /s inseng.dll
regsvr32 /s iesetup.dll /i
regsvr32 /s cryptdlg.dll
regsvr32 /s actxprxy.dll
regsvr32 /s dispex.dll
regsvr32 /s occache.dll
regsvr32 /s iepeers.dll
regsvr32 /s cdfview.dll
regsvr32 /s webcheck.dll
regsvr32 /s mobsync.dll
regsvr32 /s pngfilt.dll
regsvr32 /s licmgr10.dll
regsvr32 /s hhctrl.ocx
regsvr32 /s inetcfg.dll
regsvr32 /s trialoc.dll
regsvr32 /s tdc.ocx
regsvr32 /s MSR2C.DLL
regsvr32 /s msident.dll
regsvr32 /s msieftp.dll
regsvr32 /s xmsconf.ocx
regsvr32 /s ils.dll
regsvr32 /s msoeacct.dll
regsvr32 /s wab32.dll
regsvr32 /s wabimp.dll
regsvr32 /s wabfind.dll
regsvr32 /s oemiglib.dll
regsvr32 /s directdb.dll
regsvr32 /s inetcomm.dll
regsvr32 /s msoe.dll
regsvr32 /s oeimport.dll
regsvr32 /s msdxm.ocx
regsvr32 /s dxmasf.dll
regsvr32 /s laprxy.dll
regsvr32 /s l3codecx.ax
regsvr32 /s acelpdec.ax
regsvr32 /s mpg4ds32.ax
regsvr32 /s danim.dll
regsvr32 /s Daxctle.ocx
regsvr32 /s lmrt.dll
regsvr32 /s datime.dll
regsvr32 /s dxtrans.dll
regsvr32 /s dxtmsft.dll
regsvr32 /s wshom.ocx
regsvr32 /s wshext.dll
regsvr32 /s vbscript.dll
regsvr32 /s scrrun.dll mstinit.exe /setup
regsvr32 /s msnsspc.dll /SspcCreateSspiReg
regsvr32 /s msapsspc.dll /SspcCreateSspiReg
echo.
echo 修复完毕，按任意键继续！
pause >nul
goto startfjcyz
:list7_2
cls
echo         ╭───────────────╮
echo   ╭──┤    Windows XP 优 化 设 置    ├──╮
echo   │    ╰───────────────╯    │
echo   │                                          │
echo   │ 本次修复项目:                            │
echo   │                                          │
echo   │ 恢复EXE文件打开方式、删除地址栏下拉菜单  │
echo   │                                          │
echo   │ 恢复被隐藏桌面图标、恢复IE工具栏链接名称 │
echo   │                                          │
echo   │ 恢复internet选项安全页面自定义按钮       │
echo   │                                          │
echo   │ 恢复IE主页设置锁定状态、恢复被隐藏的分区 │
echo   │                                          │
echo   │ 删除分级审查密码、修复文件属性里面的广告 │
echo   │                                          │
echo   │ 恢复internet选项、修复IE察看源文件按钮   │
echo   │                                          │
echo   │ 修复右键菜单广告、修复运行等项目         │
echo   │                                          │
echo   │ 恢复IE搜索引擎、修复IE工具栏广告         │
echo   │                                          │
echo   │ 修复IE的默认页面和起始为空白页           │
echo   │                                          │
echo   │ 恢复IE标题栏、恢复主页修改               │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
echo.
echo     修复前，请关闭所有浏览器及其他应用程序窗口！
echo.
echo     按任意键继续……
pause>nul
echo.
echo        开始修复 IE 及相关的系统设置项目……
echo.
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f /v DisableRegistryTools /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f /v DisableRegistryTools /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKLM\Software\CLASSES\.reg" /f /ve /d regfile>nul 2>nul

echo        恢复EXE文件打开方式
reg add "HKCR\exefile\shell\open\command" /f /ve /t REG_SZ /d ""%1" %*">nul 2>nul

echo        删除地址栏下拉菜单内的网址
reg delete "HKCU\Software\Microsoft\Internet Explorer\TypedURLs" /f>nul 2>nul
reg add "HKCU\Software\Microsoft\Internet Explorer\TypedURLs">nul 2>nul

echo        还原桌面,我的电脑里面的右键菜单
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoViewContextMenu /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoViewContextMenu /t REG_DWORD /d 00000000>nul 2>nul

echo        恢复被隐藏的桌面图标
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoDesktop>nul 2>nul
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoDesktop>nul 2>nul

echo        恢复被隐藏的控制面板
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoSetFolders>nul 2>nul
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoSetFolders>nul 2>nul

echo        恢复IE工具栏的链接名称
reg add "HKCU\Software\Microsoft\Internet Explorer\Toolbar" /f /v LinksFolderName /d "链接">nul 2>nul

echo        恢复internet选项安全页面自定义按钮
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /f /v SecChangeSettings /t REG_DWORD /d 00000000>nul 2>nul

echo        恢复IE浏览器缺省主页的设置锁定状态
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /f /v Settings /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /f /v Links /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /f /v SecAddSites /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKU\.DEFAULT\Software\Policies\Microsoft\Internet Explorer\Control Panel" /f /v homepage /t REG_DWORD /d 00000000>nul 2>nul

echo        恢复被隐藏的分区
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoDrives /t REG_DWORD /d 00000000>nul 2>nul

echo        删除分级审查密码
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ratings" /f>nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ratings">nul 2>nul

echo        允许下载
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /f /v 1803 /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /f /v NoSelectDownloadDir /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Restrictions" /f /v NoSelectDownloadDir /t REG_DWORD /d 00000000>nul 2>nul

echo        修复文件属性里面的广告
reg add "HKCU\Control Panel\International" /f /v sLongDate /d "yyyy'年'M'月'd'日">nul 2>nul

echo        恢复internet选项
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\restrictions" /f /v NoBrowserOptions /t REG_DWORD /d 00000000>nul 2>nul

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoFolderOptions /t REG_DWORD /d 00000000>nul 2>nul

reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /f /v GeneralTab /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /f /v SecurityTab /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /f /v ContentTab /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /f /v ConnectionsTab /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /f /v ProgramsTab /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /f /v AdvancedTab /t REG_DWORD /d 00000000>nul 2>nul

echo        修复IE察看源文件按钮
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /f /v NoViewSource /t REG_DWORD /d 00000000>nul 2>nul

reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Restrictions" /f /v NoViewSource /t REG_DWORD /d 00000000>nul 2>nul

echo        修复网页中右键菜单的广告
reg delete "HKCU\Software\Microsoft\Internet Explorer\MenuExt" /f>nul 2>nul
reg add "HKCU\Software\Microsoft\Internet Explorer\MenuExt" /f>nul 2>nul
reg delete "HKCU\Software\Microsoft\Internet Explorer\MenuExt2" /f>nul 2>nul
reg add "HKCU\Software\Microsoft\Internet Explorer\MenuExt2" /f>nul 2>nul

echo        修复开始菜单的运行等项目
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoRun /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoRun /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoClose /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoClose /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoDrives /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoDrives /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoLogOff /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoLogOff /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoDesktop /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoDesktop /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoSetFolders /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoSetFolders /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoSetTaskBar /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoSetTaskBar /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoViewContextMenu /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoViewContextMenu /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoFileMenu /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f /v NoFileMenu /t REG_DWORD /d 00000000>nul 2>nul

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp" /f /v NoRealMode /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp" /f /v NoRealMode /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp" /f /v Disabled /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp" /f /v Disabled /t REG_DWORD /d 00000000>nul 2>nul


echo        恢复一系列文件名
reg add "HKCR\CLSID\{BDEADF00-C265-11d0-BCED-00A0C90AB50F}" /f /ve /d "Web 文件夹">nul 2>nul
reg add "HKCR\CLSID\{BDEADF00-C265-11d0-BCED-00A0C90AB50F}" /f /v InfoTip /d "您可以创建快捷方式，使它们指向您公司 Intranet 或万维网上的 Web 文件夹。要将文档发布到 Web 文件夹中或要管理文件夹中的文件，请单击该文件夹的快捷方式。">nul 2>nul

reg add "HKCR\CLSID\{992CFFA0-F557-101A-88EC-00DD010CCC48}" /f /ve /d "拨号网络">nul 2>nul
reg add "HKCR\CLSID\{992CFFA0-F557-101A-88EC-00DD010CCC48}" /f /v InfoTip /d "即使计算机不在网络上,仍可以使用拨号网络来访问另一计算机上的共享信息。要使用共享资源，拨入的计算机必须设为网络服务器。">nul 2>nul

reg add "HKCR\CLSID\{2227A280-3AEA-1069-A2DE-08002B30309D}" /f /ve /d "打印机">nul 2>nul
reg add "HKCR\CLSID\{2227A280-3AEA-1069-A2DE-08002B30309D}" /f /v InfoTip /d "使用打印机文件夹添加并安装本地或网络打印机，或更改现有打印机的设置。">nul 2>nul

reg add "HKCR\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}" /f /ve /d "回收站">nul 2>nul
reg add "HKCR\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}" /f /v InfoTip /d "包含可以恢复或永久删除的已删除项目。">nul 2>nul

reg add "HKCR\CLSID\{D6277990-4C6A-11CF-8D87-00AA0060F5BF}" /f /ve /d "计划任务">nul 2>nul
reg add "HKCR\CLSID\{D6277990-4C6A-11CF-8D87-00AA0060F5BF}" /f /v InfoTip /d "使用“任务计划”安排重复的任务，如磁盘碎片整理或例程报告等在您最方便的时候运行。“任务计划”每次在启动 Windows 时启动并在后台运行，因此例程任务不会影响您的工作。">nul 2>nul

reg add "HKCR\CLSID\{21EC2020-3AEA-1069-A2DD-08002B30309D}" /f /ve /d "控制面版">nul 2>nul
reg add "HKCR\CLSID\{21EC2020-3AEA-1069-A2DD-08002B30309D}" /f /v InfoTip /d "使用“控制面板”个性化您的计算机。例如，您可以指定桌面的显示(“显示”图标)、事件的声音(“声音”图标)、音频音量的大小(“多媒体”图标)和其它内容。">nul 2>nul

reg add "HKCR\CLSID\{871C5380-42A0-1069-A2EA-08002B30309D}" /f /ve /d "Internet Explorer">nul 2>nul
reg add "HKCR\CLSID\{871C5380-42A0-1069-A2EA-08002B30309D}" /f /v InfoTip /d "显示 WWW 或您所在公司 Intranet 上的网页，或者将您连接到 Internet。">nul 2>nul

echo        恢复网页右键菜单
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /f /v NoBrowserContextMenu /t REG_DWORD /d 00000000>nul 2>nul

echo        恢复OE标题栏广告
reg add "HKCU\Software\Microsoft\Outlook Express" /f /v WindowTitle /t REG_DWORD /d 00000000>nul 2>nul

echo        恢复时间显示样式
reg add "HKEY_CURRENT_USER\Control Panel\International" /f /v sLongDate /d "yyyy'年'M'月'd'日'">nul 2>nul
reg add "HKEY_CURRENT_USER\Control Panel\International" /f /v sLongDate16 /d "dddd', 'MMMM' 'dd', 'yyyy">nul 2>nul
reg add "HKEY_CURRENT_USER\Control Panel\International" /f /v s1159 /d "上午">nul 2>nul
reg add "HKEY_CURRENT_USER\Control Panel\International" /f /v s2359 /d "下午">nul 2>nul
reg add "HKEY_CURRENT_USER\Control Panel\International" /f /v sShortDate /d "yyyy-M-d">nul 2>nul

echo        恢复IE标题栏
reg add "HKLM\Software\Microsoft\Internet Explorer\Main" /f /v "Window Title" /d "Microsoft Internet Explorer">nul 2>nul
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /f /v "Window Title" /d "Microsoft Internet Explorer">nul 2>nul

echo        恢复主页修改
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /f /v homepage /t REG_DWORD /d 00000000>nul 2>nul

echo        取消开机对话框
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon" /f /v LegalNoticeCaption /d "">nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon" /f /v LegalNoticeText /d "">nul 2>nul

echo        解开注册表
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f /v DisableRegistryTools /t REG_DWORD /d 00000000>nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f /v DisableRegistryTools /t REG_DWORD /d 00000000>nul 2>nul

echo        修复IE的默认页面和起始为空白页
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /f /v "Default_Page_URL" /d "about:blank">nul 2>nul
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /f /v "Start Page" /d "about:blank">nul 2>nul

echo        恢复IE搜索引擎
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /f /v "Search Page" /d "http://www.google.com/intl/zh-CN/">nul 2>nul
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /f /v "SearchAssistant" /d "about:blank">nul 2>nul
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /f /v "CustomizeSearch" /d "about:blank">nul 2>nul
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /f /v "SearchUrl" /d "about:blank">nul 2>nul
reg add "HKCU\Software\Microsoft\Internet Explorer\" /f /ve /d "http://ie.search.msn.com/{SUB_RFC1766}/srchasst/srchasst.htm">nul 2>nul
reg add "HKLM\Software\Microsoft\Internet Explorer\Main" /f /v "Search Page" /d "http://www.google.com/intl/zh-CN/">nul 2>nul
reg add "HKLM\Software\Microsoft\Internet Explorer\Main" /f /v "SearchAssistant" /d "about:blank">nul 2>nul
reg add "HKLM\Software\Microsoft\Internet Explorer\Main" /f /v "CustomizeSearch" /d "about:blank">nul 2>nul
reg add "HKLM\Software\Microsoft\Internet Explorer\Main" /f /v "SearchUrl" /d "about:blank">nul 2>nul
reg add "HKLM\Software\Microsoft\Internet Explorer\" /f /ve /d "about:blank">nul 2>nul

echo        修复IE工具栏广告
reg delete "HKLM\Software\Microsoft\Internet Explorer\Extensions" /f>nul 2>nul
reg delete "HKCU\Software\Microsoft\Internet Explorer\Extensions" /f>nul 2>nul

echo        修复XP系统验证码显示异常
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Security" /f /v BlockXBM /t REG_DWORD /d 00000000>nul 2>nul

echo        修复完毕！         任意键返回……
pause >nul
goto startfjcyz
:8
cls
echo         ╭───────────────╮
echo   ╭──┤        系统常用工具          ├──╮
echo   │    ╰───────────────╯    │
echo   │                                          │
echo   │  secpol.msc         本地安全策略         │
echo   │                                          │
echo   │  eventvwr.msc       事件查看器           │
echo   │                                          │
echo   │  oobe/msoobe /a     检查XP是否激活       │
echo   │                                          │
echo   │  lusrmgr.msc        本机用户和组         │
echo   │                                          │
echo   │  ncpa.cpl           网络连接             │
echo   │                                          │
echo   │  diskmgmt.msc       磁盘管理实用程序     │
echo   │                                          │
echo   │  0、返回上层菜单                         │
echo   │                                          │
echo   │  z、退出                                 │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
set /p list8=  请输入您要运行的程序名：
if "%list8%"=="0" goto startfjcyz
if "%list8%"=="z" goto exit
start /i %list8%
goto 8
:9
cls
echo         ╭───────────────╮
echo   ╭──┤        系统安全防范          ├──╮
echo   │    ╰───────────────╯    │
echo   │                                          │
echo   │  1、Winpcap 免疫安装                     │
echo   │                                          │
echo   │  2、单个疫苗目录安装                     │
echo   │                                          │
echo   │  3、批量禁用系统程序                     │
echo   │                                          │
echo   │  4、批量疫苗目录安装                     │
echo   │                                          │
echo   │  5、批量安装系统补丁                     │
echo   │                                          │
echo   │  6、端口防火墙操作                       │
echo   │                                          │
echo   │  7、Hosts网址屏蔽                        │
echo   │                                          │
echo   │  8、机器狗压缩权限防穿透                 │
echo   │                                          │
echo   │  9、3389远程端口号更改                   │
echo   │                                          │
echo   │  0、返回上层菜单                         │
echo   │                                          │
echo   │  z、退出                                 │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
set /p list9=  请选择:
if "%list9%"=="1" goto list9_1
if "%list9%"=="1a" goto list9_1a
if "%list9%"=="2" goto list9_2
if "%list9%"=="2a" goto list9_2a
if "%list9%"=="3" goto list9_3
if "%list9%"=="3a" goto list9_3a
if "%list9%"=="4" goto list9_4
if "%list9%"=="4a" goto list9_4a
if "%list9%"=="5" goto list9_5
if "%list9%"=="6" goto list9_6
if "%list9%"=="6a" goto list9_6a
if "%list9%"=="7" goto list9_7
if "%list9%"=="8" goto list9_8
if "%list9%"=="9" goto list9_9
if "%list9%"=="0" goto startfjcyz
if "%list9%"=="z" goto exit
goto 9
:list9_1
cls
md "%systemroot%\system32\packet.dll">nul&attrib +s +h +r "%systemroot%\system32\packet.dll">nul&samlan.dll /Noverbose /file=directoriesonly "%systemroot%\system32\packet.dll" /perm /setowner=>nul
md "%systemroot%\system32\pthreadVC.dll">nul&attrib +s +h +r "%systemroot%\system32\pthreadVC.dll">nul&samlan.dll /Noverbose /file=directoriesonly "%systemroot%\system32\pthreadVC.dll" /perm /setowner=>nul
md "%systemroot%\system32\wpcap.dll">nul&attrib +s +h +r "%systemroot%\system32\wpcap.dll">nul&samlan.dll /Noverbose /file=directoriesonly "%systemroot%\system32\wpcap.dll" /perm /setowner=>nul
del /f /q "%systemroot%\system32\drivers\npf.sys">nul&md "%systemroot%\system32\drivers\npf.sys">nul&attrib +s +h +r "%systemroot%\system32\drivers\npf.sys">nul&samlan.dll /Noverbose /file=directoriesonly "%systemroot%\system32\drivers\npf.sys" /perm /setowner=>nul
goto 9
:list9_1a
cls
samlan.dll /Noverbose /file=directoriesonly "%systemroot%\system32\packet.dll" /setowner=everyone /grant=everyone>nul&attrib -s -h -r "%systemroot%\system32\packet.dll">nul&rd /s /q "%systemroot%\system32\packet.dll">nul
samlan.dll /Noverbose /file=directoriesonly "%systemroot%\system32\pthreadVC.dll" /setowner=everyone /grant=everyone>nul&attrib -s -h -r "%systemroot%\system32\pthreadVC.dll">nul&rd /s /q "%systemroot%\system32\pthreadVC.dll">nul
samlan.dll /Noverbose /file=directoriesonly "%systemroot%\system32\wpcap.dll" /setowner=everyone /grant=everyone&attrib -s -h -r "%systemroot%\system32\wpcap.dll">nul&rd /s /q "%systemroot%\system32\wpcap.dll">nul
samlan.dll /Noverbose /file=directoriesonly "%systemroot%\system32\drivers\npf.sys" /setowner=everyone /grant=everyone>nul&attrib -s -h -r "%systemroot%\system32\drivers\npf.sys">nul&rd /s /q "%systemroot%\system32\drivers\npf.sys">nul
goto 9
:list9_2
cls
set /p list9_3a=  请输入要安装的疫苗目录:
md "%list9_3a%">nul&attrib +s +h +r "%list9_3a%">nul&samlan.dll /Noverbose /file=directoriesonly "%list9_3a%" /perm /setowner=>nul
goto 9
:list9_2a
cls
set /p list9_3b=  请输入要卸载的疫苗目录:
samlan.dll /Noverbose /file=directoriesonly "%list9_3b%" /setowner=everyone /grant=everyone>nul&attrib -s -h -r "%list9_3b%">nul&rd /s /q "%list9_3b%">nul
goto 9
:list9_3
cls
echo   ╭─────────────────────╮
echo   │                                          │
echo   │  使用说明：                              │
echo   │                                          │
echo   │      请将要禁用程序隔行一一列在          │
echo   │                                          │
echo   │      本批处理目录下的disablerun.txt里    │
echo   │                                          │
echo   │                                          │
echo   │                                          │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
echo.
echo    按任意键继续.....
pause > nul
if not exist disablerun.txt goto notxt
for /f "delims=" %%j in (disablerun.txt) do ( reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%j" /v debugger /t reg_sz /d 禁用程序 /f)
goto 9
:list9_3a
cls
echo   ╭─────────────────────╮
echo   │                                          │
echo   │  使用说明：                              │
echo   │                                          │
echo   │      请将要解禁程序隔行一一列在          │
echo   │                                          │
echo   │      本批处理目录下的disablerun.txt里    │
echo   │                                          │
echo   │                                          │
echo   │                                          │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
echo.
echo    按任意键继续.....
pause > nul
if not exist disablerun.txt goto notxt
for /f "delims=" %%j in (disablerun.txt) do ( reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%j" /f)
goto 9
:list9_4
cls
echo   ╭─────────────────────╮
echo   │                                          │
echo   │  使用说明：                              │
echo   │                                          │
echo   │      请将要疫苗文件隔行一一列在          │
echo   │                                          │
echo   │      本批处理目录下的safefile.txt里      │
echo   │                                          │
echo   │                                          │
echo   │                                          │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
echo.
echo    按任意键继续.....
pause > nul
if not exist safefile.txt goto notxt
for /f "delims=" %%j in (safefile.txt) do ( md "%%j">nul&attrib +s +h +r "%%j">nul&samlan.dll /Noverbose /file=directoriesonly "%%j" /perm /setowner=>nul)
goto 9
:list9_4a
cls
echo   ╭─────────────────────╮
echo   │                                          │
echo   │  使用说明：                              │
echo   │                                          │
echo   │      请将要疫苗文件隔行一一列在          │
echo   │                                          │
echo   │      本批处理目录下的safefile.txt里      │
echo   │                                          │
echo   │                                          │
echo   │                                          │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
echo.
echo    按任意键继续.....
pause > nul
if not exist safefile.txt goto notxt
for /f "delims=" %%j in (safefile.txt) do ( samlan.dll /Noverbose /file=directoriesonly "%%j" /setowner=everyone /grant=everyone>nul&attrib -s -h -r "%%j">nul&rd /s /q "%%j">nul)
goto 9
:notxt
cls
echo   ╭─────────────────────╮
echo   │                                          │
echo   │ 没有打到对应文本配置文件......           │
echo   │                                          │
echo   │                                          │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
echo.
echo    按任意键继续.....
pause >nul
goto 9
:list9_5
cls
echo   ╭─────────────────────╮
echo   │                                          │
echo   │  使用说明：                              │
echo   │                                          │
echo   │      请将补丁文件放在本批处理目录下      │
echo   │                                          │
echo   │                                          │
echo   │                                          │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
echo.
echo    按任意键继续.....
pause > nul
for %%i in (*.exe) do %%i /passive /norestart /nobackup
goto 9
:list9_6
cls
echo.
set /p disportsname=  输入规则名(英文):
echo.
set /p disportssip=  源地址(任意*,0本机):
echo.
set /p disportsport=  源地址端口(空为任意):
echo.
set /p disportsdip=  目的地址(任意*,0本机):
echo.
set /p disportdport=  目的地址端口(空为任意):
echo.
set /p disportsnet=  通讯协议(TCP,UDP,ICMP,IGMP):
echo.
ipseccmd  -w REG -p "fjcyz"
ipseccmd -w REG -p "fjcyz" -r "%disportsname%" -f %disportssip%:%disportsport%+%disportsdip%:%disportdport%:%disportsnet% -n BLOCK -x
gpupdate /force
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
goto 9
:list9_6a
ipseccmd  -w REG -p "fjcyz" -o
gpupdate >nul
goto 9
:list9_7
cls
echo.
echo.
set /p dishostsip=  请输入真实IP地址:
echo.
set /p dishostswww=  请输入屏蔽的网址:
echo.
echo %dishostsip%   %dishostswww% >> C:\windows\system32\drivers\etc\hosts
gpupdate /force
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
goto 9
:list9_8
cls
echo.
taskkill /f /im userinit.exe
taskkill /f /im conime.exe
taskkill /f /im ctfmon.exe
taskkill /f /im internat.exe
taskkill /f /im explorer.exe
ping 127.0.0.1 -n 3 >nul
compact /c /f /i %systemroot%\system32\conime.exe
compact /c /f /i %systemroot%\system32\userinit.exe 
compact /c /f /i %systemroot%\explorer.exe
compact /c /f /i %systemroot%\system32\ctfmon.exe
compact /c /f /i %systemroot%\system32\internat.exe
ping 127.0.0.1 -n 3 >nul
start %systemroot%\explorer.exe
cacls %systemroot%\system32\userinit.exe /e /p everyone:r
echo y|cacls "C:\Documents and Settings\Administrator\「开始」菜单\程序\启动" /d everyone
cacls "C:\Documents and Settings\Administrator\「开始」菜单\程序\启动" /e /p everyone:r
echo y|cacls "C:\Documents and Settings\All Users\「开始」菜单\程序\启动" /d everyone
cacls "C:\Documents and Settings\All Users\「开始」菜单\程序\启动" /e /p everyone:r
ping 127.0.0.1 -n 3 >nul
goto 9
:list9_9
cls
set /p port= 请输入远程桌面端口号:
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t reg_dword /d %port% /f
goto 9
:0
@echo off
cls
echo         ╭───────────────╮
echo   ╭──┤   Windows XP 结束任意进程    ├──╮
echo   │    ╰───────────────╯    │
echo   │                                          │
echo   │  1、结束指定程序名                       │
echo   │                                          │
echo   │  2、结束指定PID号                        │
echo   │                                          │
echo   │  3、强制结束指定程序名                   │
echo   │                                          │
echo   │  4、强制结束指定PID号                    │
echo   │                                          │
echo   │  0、返回上层菜单                         │
echo   │                                          │
echo   │  z、退出                                 │
echo   │                                          │
echo   │Powered By Fjcyz E-mail:fjcyz@hotmail.com │
echo   ╰─────────────────────╯
echo.
set /p list0=  请选择:
if "%list0%"=="1" goto list0_1
if "%list0%"=="2" goto list0_2
if "%list0%"=="3" goto list0_3
if "%list0%"=="4" goto list0_4
if "%list0%"=="0" goto startfjcyz
if "%list0%"=="z" goto exit
:list0_1
cls
set /p PName=  请输入您想关闭的程序名后回车：
taskkill /im %PName% /t
echo.
echo.
echo.
echo        操作结束,任意键返回!
pause >nul
goto startfjcyz
:list0_2
cls
set /p PName=  请输入您想关闭的PID号后回车：
taskkill /pid %PName% /t
echo.
echo.
echo.
echo        操作结束,任意键返回!
pause >nul
goto startfjcyz
:list0_3
cls
set /p PName=  请输入您想强制关闭的程序名后回车：
ntsd -c q -pn %PName%
echo.
echo.
echo.
echo        操作结束,任意键返回!
goto startfjcyz
:list0_4
cls
set /p PName=  请输入您想强制关闭的PID号后回车：
ntsd -c q -p %PName%
echo.
echo.
echo.
echo        操作结束,任意键返回!
goto startfjcyz
:errorone
echo 没有找到MAC列表、请重新配置MACCFG.ini文件。按任意键继续！
pause >nul
goto startfjcyz
:cccsss
echo a0:0638526668827>cscdkey.ini
echo a1:1502584252836>>cscdkey.ini
echo a2:1467833311398>>cscdkey.ini
echo a3:5967582477335>>cscdkey.ini
echo a4:0579478512245>>cscdkey.ini
echo a5:3007023284581>>cscdkey.ini
echo a6:7677766839768>>cscdkey.ini
echo a7:0098459371414>>cscdkey.ini
echo a8:3407604726468>>cscdkey.ini
echo a9:9930573897634>>cscdkey.ini
echo a10:5390754524674>>cscdkey.ini
echo a11:1838103002746>>cscdkey.ini
echo a12:4592552155390>>cscdkey.ini
echo a13:4203357910656>>cscdkey.ini
echo a14:3818213577714>>cscdkey.ini
echo a15:0373816670125>>cscdkey.ini
echo a16:3354441341210>>cscdkey.ini
echo a17:2383818619033>>cscdkey.ini
echo a18:4443670243963>>cscdkey.ini
echo a19:4443670243963>>cscdkey.ini
echo a20:5137822594993>>cscdkey.ini
echo a21:5583046059598>>cscdkey.ini
echo a22:7612323732045>>cscdkey.ini
echo a23:5188917935553>>cscdkey.ini
echo a24:4861391830325>>cscdkey.ini
echo a25:3907076813715>>cscdkey.ini
echo a26:4644495498543>>cscdkey.ini
echo a27:0031582643348>>cscdkey.ini
echo a28:6783662171095>>cscdkey.ini
echo a29:8269935407697>>cscdkey.ini
echo a30:4863005877827>>cscdkey.ini
echo a31:6260997777351>>cscdkey.ini
echo a32:1458301840704>>cscdkey.ini
echo a33:7845489005407>>cscdkey.ini
echo a34:2489897731900>>cscdkey.ini
echo a35:6499698156635>>cscdkey.ini
echo a36:5004330130048>>cscdkey.ini
echo a37:1756419667795>>cscdkey.ini
echo a38:7689721378182>>cscdkey.ini
echo a39:5093461323692>>cscdkey.ini
echo a40:8510227259389>>cscdkey.ini
echo a41:6946449975174>>cscdkey.ini
echo a42:2541519346302>>cscdkey.ini
echo a43:2213365605231>>cscdkey.ini
echo a44:9293793182059>>cscdkey.ini
echo a45:6521148336408>>cscdkey.ini
echo a46:6096548635740>>cscdkey.ini
echo a47:5898764553380>>cscdkey.ini
echo a48:6374026889880>>cscdkey.ini
echo a49:5641741106871>>cscdkey.ini
echo a50:2800688911404>>cscdkey.ini
echo a51:4601617644888>>cscdkey.ini
echo a52:0325946149741>>cscdkey.ini
echo a53:7830984227339>>cscdkey.ini
echo a54:8257638225113>>cscdkey.ini
echo a55:3742704466530>>cscdkey.ini
echo a56:2594687609010>>cscdkey.ini
echo a57:6366247775680>>cscdkey.ini
echo a58:8851509110177>>cscdkey.ini
echo a59:1148893550144>>cscdkey.ini
echo a60:9405511067133>>cscdkey.ini
echo a61:5763426869283>>cscdkey.ini
echo a62:2170387050341>>cscdkey.ini
echo a63:9703625565216>>cscdkey.ini
echo a64:5219654733899>>cscdkey.ini
echo a65:1982236823838>>cscdkey.ini
echo a66:9249954430811>>cscdkey.ini
echo a67:4665408853338>>cscdkey.ini
echo a68:1171447030915>>cscdkey.ini
echo a69:1102836202206>>cscdkey.ini
echo a70:2418690209084>>cscdkey.ini
echo a71:9984286702596>>cscdkey.ini
echo a72:4241100504750>>cscdkey.ini
echo a73:8013760670212>>cscdkey.ini
echo a74:1975446719529>>cscdkey.ini
echo a75:4924580718421>>cscdkey.ini
echo a76:5252738778597>>cscdkey.ini
echo a77:9757894819822>>cscdkey.ini
echo a78:6262732097403>>cscdkey.ini
echo a79:0362533412239>>cscdkey.ini
echo a80:2401800195784>>cscdkey.ini
echo a81:2936401896445>>cscdkey.ini
echo a82:4302820828165>>cscdkey.ini
echo a83:4827662702573>>cscdkey.ini
echo a84:4927669412573>>cscdkey.ini
echo a85:5155817371648>>cscdkey.ini
echo a86:0285481823635>>cscdkey.ini
echo a87:3036267862947>>cscdkey.ini
echo a88:1750975451876>>cscdkey.ini
echo a89:3245247787477>>cscdkey.ini
echo a90:4245244496379>>cscdkey.ini
echo a91:2374611654192>>cscdkey.ini
echo a92:7107928145687>>cscdkey.ini
echo a93:7107925755681>>cscdkey.ini
echo a94:3959115282334>>cscdkey.ini
echo a95:1187567136684>>cscdkey.ini
echo a96:7167998903507>>cscdkey.ini
echo a97:0782424602734>>cscdkey.ini
echo a98:7782628506912>>cscdkey.ini
echo a99:3694457645028>>cscdkey.ini
echo a100:6762752189651>>cscdkey.ini
echo a101:5000209262814>>cscdkey.ini
echo a102:5595577378400>>cscdkey.ini
echo a103:1080539029727>>cscdkey.ini
echo a104:2328885798803>>cscdkey.ini
echo a105:7833729557573>>cscdkey.ini
echo a106:1842527682217>>cscdkey.ini
echo a107:8150104018207>>cscdkey.ini
echo a108:8775836002618>>cscdkey.ini
echo a109:7458218517380>>cscdkey.ini
echo a110:9181690009493>>cscdkey.ini
echo a111:4686663750723>>cscdkey.ini
echo a112:6171925196213>>cscdkey.ini
echo a113:7271020415226>>cscdkey.ini
echo a114:2914115614067>>cscdkey.ini
echo a115:7419278465398>>cscdkey.ini
echo a116:1528078880024>>cscdkey.ini
echo a117:7886890291287>>cscdkey.ini
echo a118:2381835150869>>cscdkey.ini
echo a119:8509314977950>>cscdkey.ini
echo a120:4341594404694>>cscdkey.ini
echo a121:7480761087140>>cscdkey.ini
echo a122:1400430210237>>cscdkey.ini
echo a123:8581866306156>>cscdkey.ini
echo a124:5510238344969>>cscdkey.ini
echo a125:9728011075227>>cscdkey.ini
echo a126:8728014356229>>cscdkey.ini
echo a127:7372213507451>>cscdkey.ini
echo a128:0472913922183>>cscdkey.ini
echo a129:5254573008745>>cscdkey.ini
echo a130:7383843071391>>cscdkey.ini
echo a131:2403417522388>>cscdkey.ini
echo a132:6681954279471>>cscdkey.ini
echo a133:0770135130262>>cscdkey.ini
echo a134:7444701548201>>cscdkey.ini
echo a135:0811229561828>>cscdkey.ini
echo a136:4730898603906>>cscdkey.ini
echo a137:1821224880836>>cscdkey.ini
echo a138:7386820384341>>cscdkey.ini
echo a139:0583075831768>>cscdkey.ini
echo a140:0029206096362>>cscdkey.ini
echo a141:6009637863272>>cscdkey.ini
echo a142:8732158258949>>cscdkey.ini
echo a143:9080165925369>>cscdkey.ini
echo a144:9227310594447>>cscdkey.ini
echo a145:4812486635767>>cscdkey.ini
echo a146:8684035701326>>cscdkey.ini
echo a147:9684033410333>>cscdkey.ini
echo a148:9447013363812>>cscdkey.ini
echo a149:0317546096095>>cscdkey.ini
echo a150:0269537049574>>cscdkey.ini
echo a151:3477215340836>>cscdkey.ini
echo a152:0478519244003>>cscdkey.ini
echo a153:7527453779641>>cscdkey.ini
echo a154:5379332783212>>cscdkey.ini
echo a155:5498935453587>>cscdkey.ini
echo a156:5567446271392>>cscdkey.ini
echo a157:2964538656094>>cscdkey.ini
echo a158:2499138357752>>cscdkey.ini
echo a159:8084209727086>>cscdkey.ini
echo a160:1093005913819>>cscdkey.ini
echo a161:4064630685902>>cscdkey.ini
echo a162:5074634814814>>cscdkey.ini
echo a163:3826513818480>>cscdkey.ini
echo a164:5549033213154>>cscdkey.ini
echo a165:4510868469516>>cscdkey.ini
echo a166:0590199336424>>cscdkey.ini
echo a167:8213809206367>>cscdkey.ini
echo a168:7293033879002>>cscdkey.ini
echo a169:4708979667695>>cscdkey.ini
echo a170:3045123307850>>cscdkey.ini
echo a171:4898100850240>>cscdkey.ini
echo a172:2680322448989>>cscdkey.ini
echo a173:1363707343758>>cscdkey.ini
echo a174:0234531699119>>cscdkey.ini
echo a175:6214962467022>>cscdkey.ini
echo a176:7245455067224>>cscdkey.ini
echo a177:1493275549471>>cscdkey.ini
echo a178:4632540832927>>cscdkey.ini
echo a179:4532543222926>>cscdkey.ini
echo a180:1335394385500>>cscdkey.ini
echo a181:1860995085370>>cscdkey.ini
echo a182:8494231290146>>cscdkey.ini
echo a183:6058201549713>>cscdkey.ini
echo a184:2959024978923>>cscdkey.ini
echo a185:4167802389272>>cscdkey.ini
echo a186:5405058948351>>cscdkey.ini
echo a187:9425727181335>>cscdkey.ini
echo a188:8792442398221>>cscdkey.ini
echo a189:8792449907228>>cscdkey.ini
echo a190:0515953683983>>cscdkey.ini
echo a191:3802247032954>>cscdkey.ini
echo a192:0039692286307>>cscdkey.ini
echo a193:6010923054212>>cscdkey.ini
echo a194:2852103571964>>cscdkey.ini
echo a195:8832534449988>>cscdkey.ini
echo a196:2614083514445>>cscdkey.ini
echo a197:3715198743458>>cscdkey.ini
echo a198:0874034659085>>cscdkey.ini
echo a199:0101273618154>>cscdkey.ini
echo a200:8062141437269>>cscdkey.ini
echo a201:7339628752492>>cscdkey.ini
echo a202:9062148147160>>cscdkey.ini
echo a203:4657204298486>>cscdkey.ini
echo a204:8350255936348>>cscdkey.ini
echo a205:5350559839519>>cscdkey.ini
echo a206:5825948139854>>cscdkey.ini
echo a207:4201415378525>>cscdkey.ini
echo a208:9044590577364>>cscdkey.ini
echo a209:4470155999985>>cscdkey.ini
echo a210:1935751583493>>cscdkey.ini
echo a211:2668264168152>>cscdkey.ini
echo a212:0371974038092>>cscdkey.ini
echo a213:3837777826870>>cscdkey.ini
echo a214:2550585305713>>cscdkey.ini
echo a215:5569281501537>>cscdkey.ini
echo a216:3035981314958>>cscdkey.ini
echo a217:1540619988455>>cscdkey.ini
echo a218:4858495099617>>cscdkey.ini
echo a219:8086046437238>>cscdkey.ini
echo a220:8213295497302>>cscdkey.ini
echo a221:9213292006300>>cscdkey.ini
echo a222:0374054731148>>cscdkey.ini
echo a223:0046705782060>>cscdkey.ini
echo a224:6889993819728>>cscdkey.ini
echo a225:2384056670040>>cscdkey.ini
echo a226:1611209300215>>cscdkey.ini
echo a227:3879328906640>>cscdkey.ini
echo a228:7008721191746>>cscdkey.ini
echo a229:8583094536246>>cscdkey.ini
echo a230:4127194139558>>cscdkey.ini
echo a231:0316507212909>>cscdkey.ini
echo a232:2286035273191>>cscdkey.ini
echo a233:8039225791843>>cscdkey.ini
echo a234:4930047220057>>cscdkey.ini
echo a235:1247093193103>>cscdkey.ini
echo a236:6426307275540>>cscdkey.ini
echo a237:5426300566642>>cscdkey.ini
echo a238:0842864988165>>cscdkey.ini
echo a239:3822492040359>>cscdkey.ini
echo a240:2258628986946>>cscdkey.ini
echo a241:3596874555024>>cscdkey.ini
echo a242:7515543787108>>cscdkey.ini
echo a243:1219584425055>>cscdkey.ini
echo a244:2498197172672>>cscdkey.ini
echo a245:0417569010589>>cscdkey.ini
echo a246:2635345132744>>cscdkey.ini
echo a247:7407995107307>>cscdkey.ini
echo a248:3963591701812>>cscdkey.ini
echo a249:6943128752006>>cscdkey.ini
echo a250:4825576963307>>cscdkey.ini
echo a251:2182199241385>>cscdkey.ini
echo a252:5084213193661>>cscdkey.ini
echo a253:4508950868172>>cscdkey.ini
echo a254:6548099648062>>cscdkey.ini
echo.
echo.
echo.
echo 生成cscdkey.ini结束,任意键继续!
pause>nul
goto :startipscan
:errorping 
echo   网络连接失败!   按任意键返回! 
pause >nul
goto startfjcyz
:dnssetdns
cls
echo 找不到dns.ini,请手动设置!
echo.
echo.
echo.
set /p dddns1=  输入DNS1信息:
echo.
set /p dddns2=  输入DNS2信息:
echo.
set /p gggate=  输入网关信息:
echo.
set /p zzzwym=  输入掩码信息:
echo %dddns1% %dddns2% %gggate% %zzzwym%>dns.ini
goto setsetsetip
:exit
exit
:list2_5
@echo off
cls
rem Copyright (C) 2003-05 Ansgar Wiechers & Torsten Mann
rem Contact: admin@ntsvcfg.de
rem
rem This program is free software; you can redistribute it and/or modify it under
rem the terms of the GNU General Public License as published by the Free Software Foundation;
rem either version 2 of the License, or (at your option) any later version.
rem This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
rem without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
rem See the GNU General Public License for more details.
rem
rem You should have received a copy of the GNU General Public License along with this program;
rem if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
rem MA 02111-1307, USA.
echo.
REM Tested on ... WinXP_SP2
REM Always basic XP64 Support
REM Modifications to BITS service (cause of v5 WindowsUpdate) - #discharged#
REM Additional notices corresponding to DHCP issue
REM Variables problems during RESTORE_DEFAULT usage fixed
REM SMBDEVICEENABLED Restore Bug fixed
REM Mod_history-09-27-2005**11-08-2005**11-29-2005**12-07-2005**12-18-2005

setlocal

REM *** INIT_VARS ***
set CHK_SVC=YES
set XPSP2=FALSE
set SERVER=FALSE
set NT_SERVER_CHK=TRUE


:START
echo  "svc2kXp.cmd" v2.2_build7b (18.12.2005), published under GNU GPL
echo  ================================================================
set find=%SystemRoot%\System32\find.exe
set regedit=%SystemRoot%\regedit.exe
if not exist "%find%" goto :NOFIND
if not exist "%regedit%" goto :NOREGEDIT
if not "%1" == "%*" goto :SYNTAX
if /I "%1"=="/?" goto :HELP
if /I "%1"=="/help" goto :HELP
if /I "%1"=="-h" goto :HELP
if /I "%1"=="--help" goto :HELP
if /I "%1"=="-?" goto :HELP
if /I "%1"=="--?" goto :HELP
if /I "%1"=="/fix" goto :FIX
goto :VERSION

:SYNTAX
echo.
echo.
echo  !!Syntax error!!
echo  ________________
echo  Es kann nur ein oder kein Parameter angegeben werden.
echo.
echo  Only one or no parameter allowed.
goto :QUIT

:HELP
echo.
echo                                 -= Hilfe =-
echo  Parameter:
echo  /lan.......Einige Dienste fuer LAN-Betrieb werden nicht veraendert.
echo  /std.......Schliesst alle Ports, einige Dienste bleiben unveraendert.
echo  /all.......Setzt alle Vorschlaege nach www.ntsvcfg.de um (hardening).
echo  /restore...Nimmt die zuletzt vorgenommenen Aenderungen zurueck.
echo  /reLAN.....Reaktiviert Dienste, die fuer LAN-Betrieb benoetigt werden.
echo  /default...Setzt alle Diensteinstellungen auf urspr黱gliche Werte zur點k.
echo.
echo  Parameters:
echo  /lan.......Some services needed for LAN-usage stay unchanged!
echo  /std.......Closes all Ports, but some services stay unchanged
echo  /all.......Changes all issues recommended by www.ntsvcfg.de ("hardening")
echo  /restore...Undo last changes.
echo  /reLAN.....Reactivates services required for LAN.
echo  /default...Restoring factory service settings (before first time usage)
echo.
echo  example: svc2kxp.cmd /all
echo.
set /P CHS= [Press "G" for GNU GPL informations or "Q" for quit]?
if /I "%CHS%"=="G" goto :GNU_GPL
if /I "%CHS%"=="Q" goto :QUIT_EXT
CLS
goto :HELP

:GNU_GPL
CLS
echo  Informations about GNU-General Public License for "svc2kxp.cmd"
echo  ===============================================================
echo.
echo  Copyright (C) 2003-05 Ansgar Wiechers, Torsten Mann
echo  Contact: admin@ntsvcfg.de
echo.
echo  This program is free software; you can redistribute it and/or modify it under
echo  the terms of the GNU General Public License as published by the Free Software
echo  Foundation; either version 2 of the License, or (at your option) any later
echo  version. This program is distributed in the hope that it will be useful, but
echo  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
echo  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
echo  details.
echo.
echo  You should have received a copy of the GNU General Public License along with
echo  this program; if not, write to the:
echo.
echo  Free Software Foundation, Inc.
echo  59 Temple Place, Suite 330
echo  Boston, MA 02111-1307, USA.
echo.
set /P CHS= [Press "H" for help or "Q" for quit]?
CLS
if /I "%CHS%"=="H" goto :HELP
if /I "%CHS%"=="Q" goto :QUIT_EXT
goto GNU_GPL

:VERSION
echo  Checking system version ...


if /I "%NT_SERVER_CHK%"=="FALSE" goto :SKIP_NT_SERVER_CHK
REM Checking for running server version
        "%regedit%" /e "%TEMP%\~svr.txt" "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ProductOptions"
                 type "%TEMP%\~svr.txt"|"%find%" /i "Server" >NUL
                if not errorlevel 1 set SERVER=TRUE
                 type "%TEMP%\~svr.txt"|"%find%" /i "LanMan" >NUL
                if not errorlevel 1 set SERVER=TRUE
                if exist "%TEMP%\~svr.txt" del /F /Q "%TEMP%\~svr.txt"
                if /I "%SERVER%"=="TRUE" goto :NTSERVER


:SKIP_NT_SERVER_CHK

ver | "%find%"  /i "Windows 2000" > nul
if not errorlevel 1 goto :OS2K

ver | "%find%"  /i "Windows XP" > nul
if not errorlevel 1 goto :OSXP

ver | "%find%"  /i "Microsoft Windows [Version 5.2.3790]" > nul
if not errorlevel 1 goto :OSXP64

echo  !!Failed!!
echo  __________
echo.
echo  Dieses Script ist nur unter Windows 2000 oder XP lauffaehig!
echo.
echo  This script works only on Windows 2000/XP machines!
echo.
goto :QUIT

:NOFIND
echo.
echo  !!Failed!!
echo  __________
echo.
echo  Leider konnte folgende Datei nicht gefunden werden:
echo.
echo  Sorry, but following file is missing:
echo.
echo.
echo  # %SystemRoot%\System32\FIND.EXE
echo.
echo.
goto :QUIT

:NOREGEDIT
echo.
echo  !!Failed!!
echo  __________
echo.
echo  Leider konnte folgende Datei nicht gefunden werden:
echo.
echo  Sorry, but following file is missing:
echo.
echo.
echo  # %SystemRoot%\REGEDIT.EXE
echo.
echo.
goto :QUIT

:NTSERVER
echo.
echo  !!Failed!!
echo  __________
echo.
echo  Dieses Script unterstuetzt keine NT Server Versionen!
echo.
echo  This script doesn't support NT server versions!
echo.
goto :QUIT


:OS2K
rem Specific OS Detection I
set SYSTEM=2k

rem Testing for XP ServicePacks

        "%regedit%" /e "%TEMP%\~svclist.txt" "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
        type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 4" >NUL
        if errorlevel==1 (

                  type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 3" >NUL
                  if errorlevel==1 (

                        type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 2" >NUL
                          if errorlevel==1 (

                                type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 1" >NUL
                                if errorlevel==1 (

                                        echo  !Windows 2000 [no or unknown Service Pack] detected!
                                        goto NO_2KSP
                                        )

                                echo  !Windows 2000 [Service Pack 1] detected!
                                  goto :NO_2KSP
                                )


                        echo  !Windows 2000 [Service Pack 2] detected!
                          goto :NO_2KSP
                        )


                echo  !Windows 2000 [Service Pack 3] detected!
                goto :NO_2KSP
                )


        echo  !Windows 2000 [Service Pack 4] detected!
        goto :NO_2KSP

:NO_2kSP
if exist "%TEMP%\~svclist.txt" del /F /Q "%TEMP%\~svclist.txt"
goto :CONTINUE


:OSXP
rem Specific OS detection II
set SYSTEM=xp
rem Testing for XP ServicePack 2

        "%regedit%" /e "%TEMP%\~svclist.txt" "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
        type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 2" >NUL
        if errorlevel==1 (

                  type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 1" >NUL
                  if errorlevel==1 (

                        SET XPSP2=FALSE
                        echo  !Windows XP [no or unknown Service Pack] detected!
                        goto NO_XPSP
                        )

                SET XPSP2=FALSE
                  echo  !Windows XP [Service Pack 1] detected!
                  goto :NO_XPSP
                )

        SET XPSP2=TRUE
        echo  !Windows XP [ServicePack 2] detected!
        goto :NO_XPSP

:OSXP64
rem Specific OS detection II
set SYSTEM=xp
rem Testing for XP ServicePack 2

        "%regedit%" /e "%TEMP%\~svclist.txt" "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
        type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 2" >NUL
        if errorlevel==1 (

                  type "%TEMP%\~svclist.txt"|"%find%" /i "Service Pack 1" >NUL
                  if errorlevel==1 (

                        SET XPSP2=FALSE
                        echo  !EXPERIMENTAL! Windows XP64 [no or unknown Service Pack] detected!
                        goto NO_XPSP
                        )

                SET XPSP2=FALSE
                  echo  !EXPERIMENTAL! Windows XP64 [Service Pack 1] detected!
                  goto :NO_XPSP
                )

        SET XPSP2=TRUE
        echo  !EXPERIMENTAL! Windows XP64 [ServicePack 2] detected!
        goto :NO_XPSP


:NO_XPSP
if exist "%TEMP%\~svclist.txt" del /F /Q "%TEMP%\~svclist.txt"
goto :CONTINUE


:CONTINUE

REM Creating subdirectory "ntsvcfg" in userprofile if necessary
if not exist "%USERPROFILE%\ntsvcfg\*.*" mkdir "%USERPROFILE%\ntsvcfg"

REM Moving old script backup files to ...\%USERNAME%\ntsvcfg :
        if exist "%USERPROFILE%\dcom.reg" move /Y "%USERPROFILE%\dcom.reg" "%USERPROFILE%\ntsvcfg\dcom.reg"
        if exist "%USERPROFILE%\dcomp.reg" move /Y "%USERPROFILE%\dcomp.reg" "%USERPROFILE%\ntsvcfg\dcomp.reg"
        if exist "%USERPROFILE%\services.reg" move /Y "%USERPROFILE%\services.reg" "%USERPROFILE%\ntsvcfg\services.reg"
        if exist "%USERPROFILE%\current_services_config.reg" move /Y "%USERPROFILE%\current_services_config.reg" "%USERPROFILE%\ntsvcfg\current_services_config.reg"
        if exist "%USERPROFILE%\smb.reg" move /Y "%USERPROFILE%\smb.reg" "%USERPROFILE%\ntsvcfg\smb.reg"
        if exist "%USERPROFILE%\FPRINT.REF" move /Y "%USERPROFILE%\FPRINT.REF" "%USERPROFILE%\ntsvcfg\FPRINT.REF"
        if exist "%USERPROFILE%\handler_aim.reg" move /Y "%USERPROFILE%\handler_aim.reg" "%USERPROFILE%\ntsvcfg\handler_aim.reg"
        if exist "%USERPROFILE%\handler_gopher.reg" move /Y "%USERPROFILE%\handler_gopher.reg" "%USERPROFILE%\ntsvcfg\handler_gopher.reg"
        if exist "%USERPROFILE%\handler_telnet.reg" move /Y "%USERPROFILE%\handler_telnet.reg" "%USERPROFILE%\ntsvcfg\handler_telnet.reg"
        if exist "%USERPROFILE%\services.reg.default" move /Y "%USERPROFILE%\services.reg.default" "%USERPROFILE%\ntsvcfg\services.reg.default"
        if exist "%USERPROFILE%\dcom.reg.default" move /Y "%USERPROFILE%\dcom.reg.default" "%USERPROFILE%\ntsvcfg\dcom.reg.default"
        if exist "%USERPROFILE%\dcomp.reg.default" move /Y "%USERPROFILE%\dcomp.reg.default" "%USERPROFILE%\ntsvcfg\dcomp.reg.default"
        if exist "%USERPROFILE%\smb.reg.default" move /Y "%USERPROFILE%\smb.reg.default" "%USERPROFILE%\ntsvcfg\smb.reg.default"
        if exist "%USERPROFILE%\handler_aim.reg.default" move /Y "%USERPROFILE%\handler_aim.reg.default" "%USERPROFILE%\ntsvcfg\handler_aim.reg.default"
        if exist "%USERPROFILE%\handler_gopher.reg.default" move /Y "%USERPROFILE%\handler_gopher.reg.default" "%USERPROFILE%\ntsvcfg\handler_gopher.reg.default"
        if exist "%USERPROFILE%\handler_telnet.reg.default" move /Y "%USERPROFILE%\handler_telnet.reg.default" "%USERPROFILE%\ntsvcfg\handler_telnet.reg.default"


REM *****Declarations*****
set SELECT="no"
set SVC_BAK=%USERPROFILE%\ntsvcfg\services.reg
set SVC_SAV=%USERPROFILE%\ntsvcfg\current_services_config.reg
set DCOM_BAK=%USERPROFILE%\ntsvcfg\dcom.reg
set DCOMP_BAK=%USERPROFILE%\ntsvcfg\dcomp.reg
set SMB_BAK=%USERPROFILE%\ntsvcfg\smb.reg
set DCOM_TMP=%TEMP%\dcomoff.reg
set DCOMP_TMP=%TEMP%\dcompoff.reg
set SMB_TMP=%TEMP%\smboff.reg
set FPRINT=%USERPROFILE%\ntsvcfg\FPRINT.REF
set HANDLER1=%USERPROFILE%\ntsvcfg\handler_aim.reg
set HANDLER2=%USERPROFILE%\ntsvcfg\handler_gopher.reg
set HANDLER3=%USERPROFILE%\ntsvcfg\handler_telnet.reg
set NB_TMP=%TEMP%\nb_off.vbs
set srctmp=%USERPROFILE%\ntsvcfg\~srcreate.vbs
set DHCP_CHANGES="YES"

REM *****Options*****
set SCHEDULER_ENABLED=NO
set UseXPSysRestore=YES
set RESTORE=NO
set SVC_MOD=NO
set USE_FPRINT=YES
set Deactivate_NetBIOS=YES
set RESTORE_MODE=2

REM *****APP_PATHs******
set NET=%SystemRoot%\system32\net.exe
set SC=%SystemRoot%\system32\sc.exe
set FC=%SystemRoot%\system32\fc.exe
set IPCONFIG=%SystemRoot%\system32\ipconfig.exe


echo  Checking available permissions: [local], please wait ...
"%net%" user "%USERNAME%" 2> nul | "%find%"  /i "admin" | "%find%"  /i /v "name" > nul
if errorlevel 1 (
        echo     "         "          "     : [domain], please wait ...
        "%net%" user "%USERNAME%" /domain 2> nul | "%find%"  /i "admin" | "%find%"  /i /v "name" > nul
        if errorlevel 1 (
                echo.
                echo  Failed!
                echo  __________
                echo  Leider verfuegen Sie nicht ueber die erforderlichen Rechte!
                echo  Melden Sie sich bitte als Administrator an.
                echo.
                echo  Sorry but you don't have the permissions required for this task.
                echo  Please login as Administrator.
                echo.
                goto :END
                )
        )

set IMPORT_OLD_FILES=FALSE
rem searching for sc.exe
if not exist "%FPRINT%" echo  Checking for presence of SC.EXE ...
"%sc%" qc > nul 2>&1
if errorlevel 1 (
        echo  !!Failed!!
        echo  __________
        echo  Die notwendige Datei SC.EXE konnte leider nicht unter
        echo  [%SystemRoot%\SYSTEM32\] gefunden werden.
        echo  Bitte laden Sie sich diese Datei von der unten genannten Adresse herunter:
        echo.
        echo  SC.EXE couldn't be found in [%SystemRoot%\SYSTEM32\].
        echo  Please download it from following location:
        echo.
        echo.
        echo            -= ftp://ftp.microsoft.com/reskit/win2000/sc.zip =-
        echo.
        echo                                Self-installing SC.EXE
        echo                                ======================
        echo  svx2kxp.cmd kann versuchen, die notwendige Datei selbst zu installieren.
        echo  Hierzu benoetigen Sie eine bestehende Internetverbindung.
        echo.
        echo  svc2kxp.cmd may try to download the required file SC.EXE itself if an
        echo  active internet connection exists.
        goto :SC_DOWNLOAD
        )


if /I "%1"=="/all" (
        set SELECT="/all"
        goto :SKIP_MENUE
        )

if /I "%1"=="/relan" (
        set SELECT="/relan"
        goto :SKIP_MENUE
        )

if /I "%1"=="/std" (
        set SELECT="/std"
        goto :SKIP_MENUE
        )

if /I "%1"=="/default" goto :RESTORE_DEFAULTS


rem checking for modified services
if /I %CHK_SVC%==YES (
        if /I %USE_FPRINT%==YES (
                if exist "%FPRINT%" (
                        rem Creating fingerprint of current service settings...
                        if exist "%USERPROFILE%\ntsvcfg\svc2cmp.sav" del /F /Q "%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                        "%sc%" query type= service state= all bufsize= 8192 | %FIND% "SERVICE_NAME" >%TEMP%\~svclist.txt
                        for /F "tokens=1*" %%a in (%TEMP%\~svclist.txt) do (
                                echo %%b >>"%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                                "%sc%" query "%%b" | %FIND% "STATE" >>"%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                                "%sc%" qc "%%b" | %FIND% "DISPLAY_NAME" >>"%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                                "%SC%" qc "%%b" | %FIND% "START_TYPE" >>"%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                                echo. >> "%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                                )
                        del "%TEMP%\~svclist.txt"


                        "%FC%" "%FPRINT%" "%USERPROFILE%\ntsvcfg\svc2cmp.sav" >NUL
                        if errorlevel 1 goto :DIFF
                        goto OK

                        :DIFF
                        echo  Checking for modified services ... failed-services maybe modified! [E]valuate
                        set SVC_MOD=YES
                        goto :MOD_END

                        :OK
                        echo  Checking for modified services ... OK
                        set SVC_MOD=NO
                        if exist "%USERPROFILE%\ntsvcfg\svc2cmp.sav" del /F /Q "%USERPROFILE%\ntsvcfg\svc2cmp.sav"
                        goto :MOD_END

                        :MOD_END
                        REM
                        )
                )
        )
set CHK_SVC=NO


if /I "%1"=="/restore" goto :RESTORE


:MENUE
if /I "%1"=="/lan" goto :SKIP_MENUE
echo.
echo                            -= Auswahl / Overview =-
echo.
echo  Bitte waehlen sie einen Punkt aus, den sie ausfuehren moechten:
echo.
echo  (1) LAN:       Einige Dienste fuer LAN-Betrieb werden nicht veraendert.
echo  (2) Standard:  Schliesst alle Ports, aber einige Dienste bleiben unveraendert.
echo  (3) ALL:       Setzt alle Vorschlaege nach www.ntsvcfg.de um (hardening).
echo  (4) Restore:   Nimmt die zuletzt vorgenommenen Aenderungen zurueck.
echo  ______________________________________________________________________________
echo.
echo  Please choose one task you want to do:
echo.
echo  (1) LAN:       Some services needed for LAN-usage stay unchanged
echo  (2) Standard:  Close ports but some services stay unchanged
echo  (3) ALL:       Making all changes described at www.ntsvcfg.de (hardening)
echo  (4) restore:   Restores last changes made.
echo.
set /P CHS= Bitte waehlen Sie/Please choose: [1],[2],[3],[4], [M]ore options or [Q]uit?

if /I "%CHS%"=="1" (
        set SELECT="/lan"
        goto :SKIP_MENUE
        )

if /I "%CHS%"=="2" (
        set SELECT="/std"
        goto :SKIP_MENUE
        )

if /I "%CHS%"=="3" (
        set SELECT="/all"
        goto :SKIP_MENUE
        )

if /I "%CHS%"=="4" goto :RESTORE
if /I "%CHS%"=="R" goto :RESTORE
if /I "%CHS%"=="M" goto :MORE_OPTIONS
if /I "%SVC_MOD%"=="YES" if /I "%CHS%"=="E" goto :EVALUATE_SERVICES
if /I "%CHS%"=="G" goto :CREATING_NEW_FINGERPRINT
if /I "%CHS%"=="Q" goto :QUIT
cls
goto :START


:SKIP_MENUE



rem Checking if old restorefiles exists.
rem if it is so old files will be restored before new changes
if not exist "%SVC_BAK%" goto :NO_RESTORE
if /I %RESTORE_MODE%==3 goto :NO_RESTORE
if /I %RESTORE_MODE%==4 goto :NO_RESTORE
set RESTORE=YES
echo.
echo  _______________________________________________________________________
echo.
echo  [Selected Restore Mode: %RESTORE_MODE%]
echo.
echo  # Achtung: Alte Sicherungsdateien gefunden!
echo.
echo     "Svc2kXp.cmd" wurde schon einmal ausgefuehrt. Damit neue Aenderungen
echo     korrekt durchgefuehrt werden koennen, werden die Sicherungsdateien
echo     eingespielt.
echo.
echo.
echo    Attention: old restore-files found!
echo.
echo     This program runs not for the first time. To apply all new changes
echo     correctly old restore files will used to get an definite state.
echo.
echo.
echo  # Starting restore ...
goto RESTORE_EXT



:NO_RESTORE
rem query if taskplaner should run
if /I "%SYSTEM%"=="2k" goto :SKIP_SQUERY
if /I "%SYSTEM%"=="xp" (
        if /I %SELECT%=="" goto :SKIP_SQUERY
        if /I %SELECT%=="/all" goto :SKIP_SQUERY
        if /I %XPSP2%==True (
                set SCHEDULER_ENABLED=YES
                goto :SKIP_SQUERY
                )

        )


echo.
echo.
echo  Rueckfrage / Query
echo  ==================
echo.
echo  Soll der Dienst "Taskplaner" beendet werden?
echo.
echo  Wenn sie zeitgesteuerten Aufgaben [z.B. Antiviren-Updates] oder die automati-
echo  sche Erstellung von Systemwiederherstellungspunkten nicht benoetigen, druecken
echo  Sie eine BELIEBIGE TASTE, um auch Port 135 [RPC] sowie Port 1025 [Taskplaner]
echo  zu schliessen [empfohlen!]. Andernfalls druecken Sie "N"!
echo.
echo.
echo  Should the "scheduler service" be disabled?
echo.
echo  If you have time-controlled tasks [i.e. AV-Updates] or you will not set
echo  automatic system restore points press ANY KEY TO CONTINUE to close port 135
echo  [RPC] and port 1025 [scheduler] instantly. Otherwise press "N"
echo  ___________________________________________
echo.
set /P UNDO= Taskplaner beenden - Close scheduler [y/n]?
if /I "%UNDO%"=="n" set SCHEDULER_ENABLED=YES



:SKIP_SQUERY

if not exist "%SVC_BAK%.default" (
        echo.
        echo  Creating backup of defaults ...
        "%regedit%" /e "%SVC_BAK%.default" HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services
        "%regedit%" /e "%DCOM_BAK%.default" HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Ole
        "%regedit%" /e "%DCOMP_BAK%.default" HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc
        "%regedit%" /e "%SMB_BAK%.default" HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters
        "%regedit%" /e "%HANDLER1%.default" HKEY_CLASSES_ROOT\AIM
        "%regedit%" /e "%HANDLER2%.default" HKEY_CLASSES_ROOT\gopher
        "%regedit%" /e "%HANDLER3%.default" HKEY_CLASSES_ROOT\telnet
        echo                             ... done.
        )

if exist "%SVC_BAK%" (
        if /I %RESTORE_MODE%==2 goto :SKIP_SAVING
        if /I %RESTORE_MODE%==4 goto :SKIP_SAVING
        )

rem saving registry settings
echo  _________________________________________________________________________
echo.
echo  [Selected Restore Mode: %RESTORE_MODE%]
echo.
echo     Saving services settings to
echo       %SVC_BAK% ...
"%regedit%" /e "%SVC_BAK%" HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services
echo     Saving DCOM settings to
echo       %DCOM_BAK% ...
"%regedit%" /e "%DCOM_BAK%" HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Ole
echo     Saving DCOM standard protocols settings to
echo       %DCOMP_BAK% ...
"%regedit%" /e "%DCOMP_BAK%" HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc
echo     Saving SMB settings to
echo       %SMB_BAK%
"%regedit%" /e "%SMB_BAK%" HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters
echo     Saving URL-Handler [AIM, GOPHER, TELNET] to
echo       %HANDLER1%
"%regedit%" /e "%HANDLER1%" HKEY_CLASSES_ROOT\AIM
echo       %HANDLER2%
"%regedit%" /e "%HANDLER2%" HKEY_CLASSES_ROOT\gopher
echo       %HANDLER3%
"%regedit%" /e "%HANDLER3%" HKEY_CLASSES_ROOT\telnet
echo.

echo  All done.
echo  ___________________________________________
echo.


:SKIP_SAVING

if /I "%SYSTEM%"=="xp" (
        if /I %UseXPSysRestore%==YES (
                goto :XPSYSRESTORE
                )
        )
:XPSYSRESTORE_DONE

rem reconfigure services
rem startup: demand
echo.
echo  Setting services to "demand" ...

echo  ___________________________________________
echo.
echo  # Checking DHCP ...
"%ipconfig%" -all | "%find%"  /i "Lease" > nul
if errorlevel 1 (
        rem trying other method for DHCP
        "%ipconfig%" -all | "%find%"  /i "DHCP-Server" > nul
        if errorlevel 1 (
          echo                ... no active DHCP found.
          echo.
	  echo  Hinweis
	  echo  =======
	  echo  Ihre Konfiguration deutet an, das kein DHCP benoetigt wird. Falls
          echo  Sie dennoch einen DSL-Internetzugang besitzen und DHCP irrtuemlich 
	  echo  deaktivert wurde, kann es nach einem Neustart zu Problemen mit der 
	  echo  Internetverbindung kommen. Starten sie zur Problembehebung den 
	  echo  DHCP-Dienst manuell neu.
	  echo.
	  echo  Notice
	  echo  ======
	  echo  Your configuration indicates that DHCP no longer will be required.
	  echo  But if you use a DSL internet connection this choice probably 
          echo  might be wrong. If you experiences problems during accessing the 
	  echo  internet please re-activate the "DHCP Service" manually.
	  echo.
	  echo  ___________________________________________
	  echo.
          "%sc%" config DHCP start= demand
          goto :SKIP_DHCP
        )
)
set DHCP_CHANGES="NO"
echo  ... DHCP active, status of service will NOT be changed!
echo.

:SKIP_DHCP
"%sc%" config dmadmin start= demand
"%sc%" config DNSCache start= demand
"%sc%" config mnmsrvc start= demand
"%sc%" config MSIServer start= demand
"%sc%" config NetDDE start= demand
"%sc%" config NetDDEdsdm start= demand
"%sc%" config Netman start= demand
"%sc%" config NTLMSsp start= demand
"%sc%" config NtmsSvc start= demand
"%sc%" config PolicyAgent start= demand
"%sc%" config RASAuto start= demand
"%sc%" config RASMan start= demand
"%sc%" config RSVP start= demand
"%sc%" config Scardsvr start= demand

"%sc%" query ScardDrv | "%find%"  /i "OpenService FAILED" >NUL
if errorlevel 1 "%sc%" config ScardDrv start= demand

if /I %XPSP2%==True (
        rem If XP SP2 is installed there are less changes to XP-ICF
        if /I %SELECT%=="/std" goto :SKIP_FIREWALL
        )
"%sc%" config SharedAccess start= demand

:SKIP_FIREWALL
"%sc%" config Sysmonlog start= demand
"%sc%" config TAPISrv start= demand
"%sc%" config TrkWks start= demand
"%sc%" config UPS start= demand
"%sc%" config W32Time start= demand
"%sc%" config WMI start= demand

if /I %SELECT%=="/all" (
        "%sc%" config SamSs start= demand
        "%sc%" config LmHosts start= demand
        "%sc%" config Winmgmt start= demand
        )

if /I "%SYSTEM%"=="2k" (
        "%sc%" config AppMgmt start= demand
        "%sc%" config Browser start= demand
        "%sc%" config clipsrv start= demand
        "%sc%" config EventSystem start= demand
        "%sc%" config Fax start= demand
        "%sc%" config netlogon start= demand
        "%sc%" config RPCLocator start= demand
        "%sc%" config Utilman start= demand
        if /I %SELECT%=="/all" (
                "%sc%" config seclogon start= demand
                "%sc%" config RPCSs start= demand
                "%sc%" config lanmanServer start= demand
                )
        )


if /I "%SYSTEM%"=="xp" (
        "%sc%" config ALG start= demand
        "%sc%" config FastUserSwitchingCompatibility start= demand
        "%sc%" config helpsvc start= demand
        "%sc%" config ImapiService start= demand
        "%sc%" config Nla start= demand
        "%sc%" config RdSessMgr start= demand
        "%sc%" config seclogon start= demand
        "%sc%" config stisvc start= demand
        "%sc%" config SwPrv start= demand
        "%sc%" config TermService start= demand
        "%sc%" config upnphost start= demand
        "%sc%" config VSS start= demand

        "%sc%" query WmdmPmSp | "%find%"  /i "OpenService FAILED" >NUL
        if errorlevel 1 "%sc%" config WmdmPmSp start= demand

        "%sc%" config WmiApSrv start= demand
        rem Wireless Zero Configuration - fuer WLAN-Verbindungen notwendig.
        rem Falls erforderlich auf AUTO stellen.
        rem "%sc%" config WZCSVC start= demand
        )
echo.




rem startup: auto
echo  Setting services to "auto" ...
"%sc%" config dmserver start= auto
"%sc%" config eventlog start= auto
"%sc%" config PlugPlay start= auto
"%sc%" config ProtectedStorage start= auto
"%sc%" config sens start= auto
"%sc%" config spooler start= auto

if /I "%SYSTEM%"=="2k" (
        "%sc%" config lanmanworkstation start= auto
        "%sc%" config alerter start= auto
        )

if /I "%SYSTEM%"=="xp" (
        "%sc%" query InteractiveLogon | "%find%"  /i "OpenService FAILED" >NUL
        if errorlevel 1 "%sc%" config InteractiveLogon start= auto
        "%sc%" config Audiosrv start= auto
        "%sc%" config CryptSvc start= auto
        "%sc%" config RPCSs start= auto
        "%sc%" config ShellHWDetection start= auto
        "%sc%" config srservice start= auto
        "%sc%" query uploadmgr | "%find%"  /i "OpenService FAILED" >NUL
        if errorlevel 1 "%sc%" config uploadmgr start= auto
        "%sc%" config WebClient start= auto
        )
echo.





rem startup: disabled
echo  Setting services to "disabled" ...
"%sc%" config cisvc start= disabled
"%sc%" config MSDTC start= disabled
"%sc%" config RemoteAccess start= disabled
"%sc%" config TlntSvr start= disabled
"%sc%" config messenger start= disabled


if /I %SELECT%=="/all" (
        "%sc%" query BITS | "%find%"  /i "SERVICE_NAME" >NUL
        if not errorlevel 1 "%sc%" config BITS start= disabled
        "%sc%" query wuauserv | "%find%"  /i "SERVICE_NAME" >NUL
        if not errorlevel 1 "%sc%" config wuauserv start= disabled
        "%sc%" config schedule start= disabled
        "%sc%" config RemoteRegistry start= disabled
        )

if /I "%SYSTEM%"=="xp" (
        "%sc%" config ERSvc start= disabled
        "%sc%" config HidServ start= disabled
        "%sc%" config SSDPSRV start= disabled

        if /I %SELECT%=="/lan" (
                if /I %SCHEDULER_ENABLED%==NO "%sc%" config schedule start= disabled
                )

        if /I %SELECT%=="/std" (
                if /I %SCHEDULER_ENABLED%==NO "%sc%" config schedule start= disabled
                )

        if /I %XPSP2%==True (
                echo.
                echo  XPSP2: Disabling Security Center ...
                "%sc%" config wscsvc start= disabled
                )
        )


echo.
echo  ------------------
echo  # Checking and stopping unnecessary system services ...
echo.
"%sc%" query cisvc | "%find%"  /i "4  RUNNING" >NUL
        if not errorlevel 1 "%net%" stop cisvc
"%sc%" query RemoteAccess | "%find%"  /i "4  RUNNING" >NUL
        if not errorlevel 1 "%net%" stop RemoteAccess
"%sc%" query TlntSvr | "%find%"  /i "4  RUNNING" >NUL
        if not errorlevel 1 "%net%" stop TlntSvr
"%sc%" query MSDTC | "%find%"  /i "4  RUNNING" >NUL
        if not errorlevel 1 "%net%" stop MSDTC
"%sc%" query messenger | "%find%"  /i "4  RUNNING" >NUL
        if not errorlevel 1 "%net%" stop messenger

if /I %SELECT%=="/all" (
        "%sc%" query BITS | "%find%"  /i "SERVICE_NAME" >NUL
        if not errorlevel 1 (
                "%sc%" query BITS | "%find%"  /i "4  RUNNING" >NUL
                if not errorlevel 1 "%net%" stop BITS
                )
        "%sc%" query wuauserv | "%find%"  /i "SERVICE_NAME" >NUL
        if not errorlevel 1 (
                "%sc%" query wuauserv | "%find%"  /i "4  RUNNING" >NUL
                if not errorlevel 1 "%net%" stop wuauserv
                )
        "%sc%" query schedule | "%find%"  /i "4  RUNNING" >NUL
        if not errorlevel 1 "%net%" stop schedule
        )

if /I "%SYSTEM%"=="xp" (
        if /I %SELECT%=="/lan" (
                if /I %SCHEDULER_ENABLED%==NO "%net%" (
                        "%sc%" query schedule | "%find%"  /i "4  RUNNING" >NUL
                        if not errorlevel 1 "%net%" stop schedule
                        )
                )

        if /I %SELECT%=="/std" (
                if /I %SCHEDULER_ENABLED%==NO "%net%" (
                        "%sc%" query schedule | "%find%"  /i "4  RUNNING" >NUL
                        if not errorlevel 1 "%net%" stop schedule
                )

        if /I %XPSP2%==True (
                "%sc%" query wscsvc | "%find%"  /i "4  RUNNING" >NUL
                if not errorlevel 1 "%net%" stop wscsvc
                )

        )

echo  ------------------
echo  Disabling DCOM ...
echo REGEDIT4 > "%DCOM_TMP%"
echo. >> "%DCOM_TMP%"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Ole] >> "%DCOM_TMP%"
echo "EnableDCOM"="N" >> "%DCOM_TMP%"
echo "EnableDCOMHTTP"="N" >> "%DCOM_TMP%"
echo. >> "%DCOM_TMP%"
echo. >> "%DCOM_TMP%"
"%regedit%" /s "%DCOM_TMP%"
del /F /Q "%DCOM_TMP%"

echo  Disabling DCOM standard protocols ...
echo REGEDIT4 > "%DCOMP_TMP%"
echo. >> "%DCOMP_TMP%"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc] >> "%DCOMP_TMP%"
echo "DCOM Protocols"=hex(7):00,00,00,00 >> "%DCOMP_TMP%"
echo. >> "%DCOMP_TMP%"
echo. >> "%DCOMP_TMP%"
"%regedit%" /s "%DCOMP_TMP%"
del /F /Q "%DCOMP_TMP%"

   echo  Disabling port 135 (maybe 1025 too) ...
   echo    - Removing RPC Client Protocols
   echo REGEDIT4 > "%SMB_TMP%"
   echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc\ClientProtocols] >> "%SMB_TMP%"
   echo. >> "%SMB_TMP%"

   if /I %SCHEDULER_ENABLED%==NO (
    echo    - Advanced RPC Configuration
    echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc\Internet] >> "%SMB_TMP%"
    echo "PortsInternetAvailable"="N" >> "%SMB_TMP%"
    echo "UseInternetPorts"="N" >> "%SMB_TMP%"
    echo. >> "%SMB_TMP%"
    )

   if /I %XPSP2%==TRUE (
    echo    - Advanced RPC Configuration
    echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc\Internet] >> "%SMB_TMP%"
    echo "PortsInternetAvailable"="N" >> "%SMB_TMP%"
    echo "UseInternetPorts"="N" >> "%SMB_TMP%"
    echo. >> "%SMB_TMP%"
    )

   echo    - Removing needless URL Handler [AIM,gopher,telnet]
   echo [-HKEY_CLASSES_ROOT\AIM] >> "%SMB_TMP%"
   echo [-HKEY_CLASSES_ROOT\gopher] >> "%SMB_TMP%"
   echo [-HKEY_CLASSES_ROOT\telnet] >> "%SMB_TMP%"
   echo. >> "%SMB_TMP%"
   echo. >> "%SMB_TMP%"
  "%regedit%" /s "%SMB_TMP%"
  del /F /Q "%SMB_TMP%"

if /I %SELECT%=="/all" (
        echo.
        echo  Disabling SMB port 445 ...
        echo REGEDIT4 > "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters] >> "%SMB_TMP%"
        echo "SMBDeviceEnabled"=dword:00000000 >> "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        "%regedit%" /s "%SMB_TMP%"
        del /F /Q "%SMB_TMP%"
        set REBOOT_REQUIRED=yes
        )

if /I %SELECT%=="/std" (
        echo.
        echo  Disabling SMB port 445 ...
        echo REGEDIT4 > "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters] >> "%SMB_TMP%"
        echo "SMBDeviceEnabled"=dword:00000000 >> "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        "%regedit%" /s "%SMB_TMP%"
        del /F /Q "%SMB_TMP%"
        set REBOOT_REQUIRED=yes
        )

if /I %SELECT%=="/std" goto :NB_DISABLE
if /I %SELECT%=="/all" goto :NB_DISABLE
goto :SKIP_NB_DISABLE

:NB_DISABLE
  if /I %DEACTIVATE_NETBIOS%==NO (
                echo.
                echo.  Due problems with SP2 and deactivating NetBIOS this option
                echo   will be skipped.
                echo.
                goto :SKIP_NB_DISABLE
                )

  rem Because of problems with SP2 Netbios:
  if /I %XPSP2%==True (
                echo.
                echo  Note:
                echo  -----
                echo  If you experiencing problems after updating Windows XP with
                echo  Service Pack 2 please do following:
                echo.
                echo                          set Deactivate_NetBIOS=NO
                echo.
                )
  rem *** Thx2 Johannes Lichtenberger for the following lines using VBScript***
  echo  Disable NetBios on all local interfaces ...
  echo.
  echo On Error Resume Next>> "%nb_tmp%"
  echo.>> "%nb_tmp%"
  echo TcpipoverNetbios = 2 '0=NetbiosfromDHCP 1=EnableNetbios 2=DisableNetbios>> "%nb_tmp%"
  echo.>> "%nb_tmp%"
  echo strComputer = ".">> "%nb_tmp%"
  echo Set objWMIService = GetObject("winmgmts:\\" ^& strComputer ^& "\root\cimv2")>> "%nb_tmp%"
  echo Set objNICs = objWMIService.ExecQuery _>> "%nb_tmp%"
  echo    ("Select * From Win32_NetworkAdapterConfiguration Where IPEnabled = True")>> "%nb_tmp%"
  echo For Each objNic In objNICs>> "%nb_tmp%"
  echo    errTcpipNetbios = objNic.SetTCPIPNetBIOS(TcpipoverNetbios)>> "%nb_tmp%"
  echo Next>> "%nb_tmp%"
  "%SYSTEMROOT%\SYSTEM32\CSCRIPT.EXE" "%nb_tmp%"
  del /F /Q "%nb_tmp%"
  set REBOOT_REQUIRED=yes

:SKIP_NB_DISABLE
rem Skip Billboard because /all is used
if /I %SELECT%=="/all" goto :SW_ALL
if /I %SELECT%=="/std" goto :SW_ALL
if /I %SELECT%=="/relan" goto :SW_ALL
echo.
echo  ___________________________________________________________________
echo.
echo                   *** Zusammenfassung / Result ***
echo.
echo  Es wurden NICHT alle Aenderungen umgesetzt!
echo  Um alle Vorschlaege von kssysteme.de umzusetzen, verwenden Sie
echo  bitte den Parameter '/all' oder waehlen Sie im Menue den Punkt "3".
if /I %DHCP_CHANGES%=="YES" (
         	echo.
	  	echo  Wichtiger DHCP Hinweis
	  	echo  ======================
	  	echo  Ihre Konfiguration deutete an, das kein DHCP benoetigt wird. Falls
          	echo  Sie jedoch einen DSL-Internetzugang besitzen und DHCP irrtuemlich 
	  	echo  deaktivert wurde, kann es nach einem Neustart zu Problemen mit der 
	  	echo  Internetverbindung kommen. Starten sie zur Problembehebung den 
	  	echo  DHCP-Dienst von Hand neu.
	  	echo.
		)

echo.
echo  Not all changes could be performed. To change all issues listed
echo  on www.ntsvcfg.de please use parameter '/all' or select item "3"!
if /I %DHCP_CHANGES%=="YES" (
         	echo.
	  	echo  Important DHCP Notice
	  	echo  =====================
	  	echo  Your configuration indicates that DHCP will no longer be required.
	  	echo  But if you are using a DSL internet connection this choice probably 
          	echo  might be wrong. If you experiences problems during accessing the 
	  	echo  internet please re-activate the "DHCP Service" manually.
		echo.
		)
echo  ___________________________________________________________________

:SW_ALL

if /I %SELECT%=="/relan" (
        rem startup: auto
        echo.
        echo  ------------------
        echo  Re-enabling services ...
        "%sc%" config LmHosts  start= auto
        "%sc%" config RemoteRegistry start= auto
        "%sc%" config SamSs start= auto
        "%sc%" config Winmgmt start= auto
        if /I "%SYSTEM%"=="2k" (
                "%sc%" config RPCSs start= auto
                "%sc%" config lanmanServer start= auto
                "%sc%" config seclogon start= auto
                )
        if /I "%SYSTEM%"=="XP" (
                rem "%sc%" config SharedAccess start= auto
                )


        rem start re-enabled services
        echo.
        echo  ------------------
        echo  [Re]starting services ...
        echo.

        "%sc%" query RemoteRegistry | "%find%"  /i "1  STOPPED" >NUL
        if not errorlevel 1 "%net%" start RemoteRegistry
        "%sc%" query SamSs | "%find%"  /i "1  STOPPED" >NUL
        if not errorlevel 1 "%net%" start SamSs
        "%sc%" query LmHosts | "%find%"  /i "1  STOPPED" >NUL
        if not errorlevel 1 "%net%" start LmHosts
        "%sc%" query Winmgmt | "%find%"  /i "1  STOPPED" >NUL
        if not errorlevel 1 "%net%" start Winmgmt
        if /I "%SYSTEM%"=="2k" (
                "%sc%" query LanmanServer | "%find%"  /i "1  STOPPED" >NUL
                if not errorlevel 1 "%net%" start lanmanServer
                "%sc%" query RPCSs | "%find%"  /i "1  STOPPED" >NUL
                if not errorlevel 1 "%net%" start RPCSs
                "%sc%" query Seclogon | "%find%"  /i "1  STOPPED" >NUL
                if not errorlevel 1 "%net%" start seclogon
                )

        if /I "%SYSTEM%"=="XP" (
                rem "%net%" start SharedAccess
                )

        rem enable SMB port 445
        echo.
        echo  ------------------
        echo  Enabling SMB port 445 ...
        echo REGEDIT4 > "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters] >> "%SMB_TMP%"
        echo "SMBDeviceEnabled"=dword:00000001 >> "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        echo. >> "%SMB_TMP%"
        "%regedit%" /s "%SMB_TMP%"
        del /F /Q "%SMB_TMP%"
        set REBOOT_REQUIRED=yes
        )


rem Creating fingerprint of current service settings...
if exist "%FPRINT%" del /F /Q "%FPRINT%"
if /I %USE_FPRINT%==YES (
        echo.
        echo  Creating fingerprint which will take a few seconds ...
        "%sc%" query type= service state= all bufsize= 8192 | %FIND% "SERVICE_NAME" > %TEMP%\~svclist.txt
        for /F "tokens=1*" %%a in (%TEMP%\~svclist.txt) do (
                echo %%b >>"%FPRINT%"
                "%sc%" query "%%b" | %FIND% "STATE" >>"%FPRINT%"
                "%sc%" qc "%%b" | %FIND% "DISPLAY_NAME" >>"%FPRINT%"
                "%SC%" qc "%%b" | %FIND% "START_TYPE" >>"%FPRINT%"
                echo. >> "%FPRINT%"
                )
        del "%TEMP%\~svclist.txt"
        echo                                                      ... done.
        )
goto :END


:RESTORE
echo  ____________________________________________________
echo.
echo  Letzte Aenderungen zuruecknehmen [y/n]?
set /P UNDO= Undo last changes [y/n]?
if /I "%UNDO%"=="y" (
        echo  _______________________________________________________________
        echo.
        echo  Hinweis:
        echo  ========
        echo  Moeglicherweise meldet Windows Fehler beim Importieren.
        echo  Ignorieren Sie diese mit Klick auf "OK".
        echo.
        echo  Windows might probably report an error during importing the
        echo  backups. Just ignore this by clicking the "OK" button!
        echo  _______________________________________________________________
        echo  Status:
        echo  -------
        :RESTORE_EXT
        if exist "%SVC_BAK%" (
                echo     Importing services ...
                echo        ["%SVC_BAK%"]
                "%regedit%" /s "%SVC_BAK%"
                set action=""
                )

        if exist "%DCOM_BAK%" (
                echo     Importing DCOM ...
                echo        ["%DCOM_BAK%"]
                "%regedit%" /s "%DCOM_BAK%"
                )

        if exist "%DCOMP_BAK%" (
                echo     Importing DCOM-standard protocols ...
                echo        ["%DCOMP_BAK%"]
                "%regedit%" /s "%DCOMP_BAK%"
                )

        if exist "%SMB_BAK%" (
                echo     Importing SMB-settings ...
                echo        ["%SMB_BAK%"]
        	echo   - Removing SMBDeviceEnabled RegKey ...
		echo REGEDIT4 > "%USERPROFILE%\smbpatch~.reg"
		echo. >> "%USERPROFILE%\smbpatch~.reg"
		echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters] >> "%USERPROFILE%\smbpatch~.reg"
		echo "SMBDeviceEnabled"=- >> "%USERPROFILE%\smbpatch~.reg"
		echo. >> "%USERPROFILE%\smbpatch~.reg"
		echo. >> "%USERPROFILE%\smbpatch~.reg"
		"%SystemRoot%\regedit.exe" /s "%USERPROFILE%\smbpatch~.reg"
		del /F /Q "%USERPROFILE%\smbpatch~.reg"
                "%regedit%" /s "%SMB_BAK%"
                )

        if exist "%HANDLER1%" (
                echo     Importing URL_HANDLER AIM ...
                echo        ["%HANDLER1%"]
                "%regedit%" /s "%HANDLER1%"
                )

        if exist "%HANDLER2%" (
                echo     Importing URL_HANDLER GOPHER ...
                echo        ["%HANDLER2%"]
                "%regedit%" /s "%HANDLER2%"
                )

        if exist "%HANDLER3%" (
                echo     Importing URL_HANDLER TELNET ...
                echo        ["%HANDLER3%"]
                "%regedit%" /s "%HANDLER3%"
                )

        rem Skipping back to next state
        if /I "%RESTORE%"=="YES" goto :NO_RESTORE

        echo     Removing RPC Internet key ....
        echo REGEDIT4 >"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc\Internet] >>"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        "%regedit%" /s "%USERPROFILE%\svc_fix.reg"
        del /F /Q "%USERPROFILE%\svc_fix.reg"

        rem Creating fingerprint of current service settings...
        if exist "%FPRINT%" del /F /Q "%FPRINT%"
        if /I %USE_FPRINT%==YES (
                echo.
                echo  Creating fingerprint which will take a few seconds ...
                "%sc%" query type= service state= all bufsize= 8192 | %FIND% "SERVICE_NAME" > %TEMP%\~svclist.txt
                for /F "tokens=1*" %%a in (%TEMP%\~svclist.txt) do (
                        echo %%b >>"%FPRINT%"
                        "%sc%" query "%%b" | %FIND% "STATE" >>"%FPRINT%"
                        "%sc%" qc "%%b" | %FIND% "DISPLAY_NAME" >>"%FPRINT%"
                        "%SC%" qc "%%b" | %FIND% "START_TYPE" >>"%FPRINT%"
                        echo. >> "%FPRINT%"
                        )
                del "%TEMP%\~svclist.txt"
                echo                                                      ... done.
                )

        echo.
        echo  _______________________________________________________________
        echo.
        echo               *** Zusammenfassung / Result ***
        echo.
        echo  Die Ruecksicherung wurde ausgefuehrt. Wenn in der oberen Zeile
        echo  keine Statusmeldungen zu sehen sind, existierten keine rueckzu-
        echo  sichernden Dateien. Aktivieren Sie gegebenenfalls NetBios in
        echo  den Eigenschaften der jeweiligen Netzwerkkarte.
        echo  Bitte starten Sie abschliessend Ihren Rechner neu.
        echo.
        echo  Restore finished. If you don't see any messages in the status
        echo  box above, there were no files to restore. Please reactivate
        echo  NetBios for each NIC you want use with it and reboot afterwards.
        echo  ________________________________________________________________
        )

goto :END

:RESTORE_DEFAULTS
echo.
echo                     *** Restore Factory Settings ***
echo.
echo  ______________________________________________________________________________
echo.
echo  Einstellungen vor Erstanwendung des Scripts wiederherstellen (ausser NetBIOS)?
set /P UNDO= Restore defaults (before using script, except NetBIOS) [y/n]?
if /I "%UNDO%"=="y" (
        echo.
        echo   - Restoring original service settings [if exists] ...

        if exist "%SVC_BAK%.default" 	(
					echo      "%SVC_BAK%.default"
					"%regedit%" /s "%SVC_BAK%.default"
					)
        if exist "%DCOM_BAK%.default" 	(
					echo      "%DCOM_BAK%.default"
					"%regedit%" /s "%DCOM_BAK%.default"
					)
        if exist "%DCOMP_BAK%.default" 	(
					echo      "%DCOMP_BAK%.default"
					"%regedit%" /s "%DCOMP_BAK%.default"
					)
        if exist "%SMB_BAK%.default"	(
					echo      "%SMB_BAK%.default"
        				echo   - Removing SMBDeviceEnabled RegKey ...
					echo REGEDIT4 > "%USERPROFILE%\smbpatch~.reg"
					echo. >> "%USERPROFILE%\smbpatch~.reg"
					echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters] >> "%USERPROFILE%\smbpatch~.reg"
					echo "SMBDeviceEnabled"=- >> "%USERPROFILE%\smbpatch~.reg"
					echo. >> "%USERPROFILE%\smbpatch~.reg"
					echo. >> "%USERPROFILE%\smbpatch~.reg"
					"%SystemRoot%\regedit.exe" /s "%USERPROFILE%\smbpatch~.reg"
					del /F /Q "%USERPROFILE%\smbpatch~.reg"
					"%regedit%" /s "%SMB_BAK%.default"
					)
        if exist "%HANDLER1%.default" 	(
					echo      "%HANDLER1%.default"
					"%regedit%" /s "%HANDLER1%.default"
					)
        if exist "%HANDLER2%.default" 	(
					echo 	  "%HANDLER2%.default"
					"%regedit%" /s "%HANDLER2%.default"
					)
        if exist "%HANDLER3%.default" 	(
					echo "%HANDLER3%.default"
					"%regedit%" /s "%HANDLER3%.default"
					)
        echo                                                 ... done.

        echo   - Removing RPC Internet key ...
        echo REGEDIT4 >"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc\Internet] >>"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        "%regedit%" /s "%USERPROFILE%\svc_fix.reg"
        del /F /Q "%USERPROFILE%\svc_fix.reg"
        echo                                                 ... done.

        )
goto :QUIT


:SC_DOWNLOAD
echo  ______________________________________________________________
echo.
echo  Besteht eine aktive Internetverbindung?
echo  Are you currently connected to the internet?
echo.
set /P UNDO= Bitte waehlen/Please choose: [y/n]?
  if /I "%UNDO%"=="y" goto :SC_DOWNLOAD_OK
goto :END

:SC_DOWNLOAD_OK
if exist "%SYSTEMROOT%\sc.zip" goto :SCE
echo  Generating FTP-script ...
if exist "%USERPROFILE%"\script_sc.ls del /F "%USERPROFILE%\script_sc.ls"
echo open 207.46.133.140 >"%USERPROFILE%\script_sc.ls"
echo user anonymous anonymous@aol.com >>"%USERPROFILE%\script_sc.ls"
echo type binary >>"%USERPROFILE%\script_sc.ls"
echo user anonymous anonymous@aol.com >>"%USERPROFILE%\script_sc.ls"
echo type binary >>"%USERPROFILE%\script_sc.ls"
echo get /reskit/win2000/sc.zip "%SYSTEMROOT%\System32\SC.ZIP" >>"%USERPROFILE%\script_sc.ls"
echo quit >>"%USERPROFILE%\script_sc.ls"

echo  Downloading SC.EXE ...
ftp -s:"%USERPROFILE%\script_sc.ls"
del /F "%USERPROFILE%\script_sc.ls"

:SCE
if exist "%SYSTEMROOT%\System32\pkunzip.exe" goto :PKE
echo  Generating FTP-script ...
if exist "%USERPROFILE%"\script_pk.ls del /F "%USERPROFILE%\script_pk.ls"
echo open ftp.uni-duesseldorf.de >"%USERPROFILE%\script_pk.ls"
echo user anonymous anonymous@aol.com >>"%USERPROFILE%\script_pk.ls"
echo type binary >>"%USERPROFILE%\script_pk.ls"
echo user anonymous anonymous@aol.com >>"%USERPROFILE%\script_pk.ls"
echo type binary >>"%USERPROFILE%\script_pk.ls"
echo get /pub/ie/pkunzip.exe "%SYSTEMROOT%\System32\pkunzip.exe" >>"%USERPROFILE%\script_pk.ls"
echo quit >>"%USERPROFILE%\script_pk.ls"

echo  Downloading PKUNZIP.EXE ...
ftp -s:"%USERPROFILE%\script_pk.ls"
del /F "%USERPROFILE%\script_pk.ls"

:PKE
if not exist "%SYSTEMROOT%\System32\sc.zip" (
        echo.
        echo   Download fehlgeschlagen. Bitte laden sie sich die Datei SC.ZIP manuell
        echo   herunter und kopieren diese nach %SYSTEMROOT%\.
        echo.
        echo   Downloading SC.ZIP failed. Please download it manually an copy it to
        echo   %SYSTEMROOT%\.
        )

if not exist "%SYSTEMROOT%\System32\pkunzip.exe" (
        echo.
        echo   Die Datei PKUNZIP.EXE konnte nicht gefunden werden. Diese wird zum
        echo   Entpacken des Archivs SC.ZIP benoetigt!
        echo.
        echo   File PKUNZIP.EXE not found. It is needed to decompress the archive SC.EXE.
        )

if exist "%SYSTEMROOT%\System32\SC.ZIP" (
        if exist "%SYSTEMROOT%\System32\pkunzip.exe" (
                "%SYSTEMROOT%\System32\pkunzip.exe" -e "%SYSTEMROOT%\System32\sc.zip" sc.exe
                )
        )

move /Y sc.exe "%SYSTEMROOT%\System32\"
echo.
echo  Skript wird neu gestartet ...
echo  Restarting script ...
goto :START

:FIX
echo.
echo                     -= svc2kxp.cmd taskplaner fix =-
echo.
echo.
echo  Druecken Sie "Y", um das Problem mit dem Taskplaner ("falscher Parameter")
echo  unter Windows XP zu beheben.
echo.
echo  Press "Y", if you want fix issue "scheduler doesn't start under Windows XP
echo  after running script v2.0 - v2.1build0".
echo.
set /P UNDO= Fix problem [y/n]?
if /I "%UNDO%"=="y" (
        echo REGEDIT4 >"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Rpc\Internet] >>"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        echo. >>"%USERPROFILE%\svc_fix.reg"
        "%regedit%" /s "%USERPROFILE%\svc_fix.reg"
        del /F /Q "%USERPROFILE%\svc_fix.reg"
        echo  ______________________________________
        echo  OK. Bitte starten Sie den Rechner neu und kontrollieren Sie erneut,
        echo  ob hierdurch Ports geoeffnet wurden.
        echo.
        echo  Done. Please reboot and check again for open ports ...!
        )


rem Creating fingerprint of current service settings...
if exist "%FPRINT%" del /F /Q "%FPRINT%"
goto quit
if /I %USE_FPRINT%==YES (
        echo.
          echo  Creating fingerprint which will take a few seconds ...
          "%sc%" query type= service state= all bufsize= 8192 | %FIND% "SERVICE_NAME" > %TEMP%\~svclist.txt
          for /F "tokens=1*" %%a in (%TEMP%\~svclist.txt) do (
                echo %%b >>"%FPRINT%"
                "%sc%" query "%%b" | %FIND% "STATE" >>"%FPRINT%"
                "%sc%" qc "%%b" | %FIND% "DISPLAY_NAME" >>"%FPRINT%"
                "%SC%" qc "%%b" | %FIND% "START_TYPE" >>"%FPRINT%"
                echo. >> "%FPRINT%"
                )
        del "%TEMP%\~svclist.txt"
        echo                                                      ... done.
        )

goto :QUIT

rem **** Additional Feature List ****

:MORE_OPTIONS
cls
echo  ______________________________________________________________________________
echo.
echo                 *** Weitere Optionen / More Options Menue ***
echo                     =====================================
echo.
if /I "%SVC_MOD%"=="YES" (
        echo  [E]...Zeigt eine Liste an, welche Dienste seit der letzten Anwendung
        echo        von svc2kxp.cmd veraendert wurden.
        echo.
        echo        Shows a list with modified services since last use of scv2kxp.cmd
        echo.
        )

echo  [G]...Generiert einen neuen Fingerprint, um Veraenderungen bei
echo        Diensten zu erfassen
echo.
echo        Generates a new fingerprint to correctly detect changes of
echo        services
echo.
echo  [S]...Sichern der aktuellen Dienstekonfiguration.
echo        Saving current NT service configuration (auto/demand/disabled).
echo.
echo  ______________________________________________________________________________
echo.
if /I "%SVC_MOD%"=="NO" set /P CHS=       Bitte waehlen Sie/Please choose: [G], [S], [B]ack or [Q]uit?
if /I "%SVC_MOD%"=="YES" set /P CHS=       Bitte waehlen Sie/Please choose: [E], [G], [S], [B]ack or [Q]uit?
if /I "%SVC_MOD%"=="YES" if /I "%CHS%"=="E" GOTO :EVALUATE_SERVICES
if /I "%CHS%"=="G" GOTO :CREATING_NEW_FINGERPRINT
if /I "%CHS%"=="B" (
                    CLS
                    GOTO :START
                   )
if /I "%CHS%"=="S" GOTO :SAVE_SVC_SETTINGS
if /I "%CHS%"=="Q" GOTO :QUIT
GOTO :MORE_OPTIONS



:EVALUATE_SERVICES
cls
echo  ______________________________________________________________________________
echo.
echo                        *** Evaluate Services Menue ***
echo.
"%FC%" /N "%FPRINT%" "%USERPROFILE%\ntsvcfg\svc2cmp.sav"
echo  ______________________________________________________________________________
echo.
set /P CHS=       Bitte waehlen Sie/Please choose: [B]ack, [U]pdate or [Q]uit?
if /I "%CHS%"=="B" GOTO :MORE_OPTIONS
if /I "%CHS%"=="U" GOTO :CREATING_NEW_FINGERPRINT
if /I "%CHS%"=="Q" GOTO :QUIT
GOTO :MORE_OPTIONS


:SAVE_SVC_SETTINGS
cls
echo  ______________________________________________________________________________
echo.
echo               *** Manage current services configurations menue ***
echo                   --------------------------------------------
echo.
echo   Soll die aktuelle Dienstekonfiguration gesichert werden?
echo.
set /P CHS=  Should the current service configuration saved (y/n)?
if /I "%CHS%"=="N" GOTO :MORE_OPTIONS
if /I "%CHS%"=="Y" (
        echo   Saving current services settings to:
        echo.
        echo    - %SVC_SAV%
        "%regedit%" /e "%SVC_SAV%" HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services
        echo.
        echo   ... Done!
        echo  ______________________________________________________________________________
        echo.
        echo        Beliebige Taste druecken, um fortzufahren. Hit any key to return.
        pause>NUL
        )
if /I "%CHS%"=="Q" GOTO :QUIT
goto :MORE_OPTIONS




pause >NUL
goto :MORE_OPTIONS


:CREATING_NEW_FINGERPRINT
cls
echo  ______________________________________________________________________________
echo.
echo                     *** Creating new fingerprint menue ***
echo                         ------------------------------
echo.
set /P CHS=  Create new fingerprint [Y/N]?
if /I "%CHS%"=="Y" (
        if exist "%FPRINT%" del /F /Q "%FPRINT%"
        echo   Creating new fingerprint which will take a few seconds ...
        "%sc%" query type= service state= all bufsize= 8192 | %FIND% "SERVICE_NAME" > %TEMP%\~svclist.txt
        for /F "tokens=1*" %%a in (%TEMP%\~svclist.txt) do (
                echo %%b >>"%FPRINT%"
                "%sc%" query "%%b" | %FIND% "STATE" >>"%FPRINT%"
                "%sc%" qc "%%b" | %FIND% "DISPLAY_NAME" >>"%FPRINT%"
                "%SC%" qc "%%b" | %FIND% "START_TYPE" >>"%FPRINT%"
                echo. >> "%FPRINT%"
                )
        del "%TEMP%\~svclist.txt"
        echo                                                           ... done.
        echo  ______________________________________________________________________________
        echo.
        echo                          [Press any key to continue]
        set CHK_SVC=YES
        PAUSE >NUL
        )
cls
GOTO :MORE_OPTIONS


:XPSYSRESTORE
REM Creating A System Restore Point // Source Code: MS Technet Scriptcenter
        echo.
        echo  # Creating System Restore Point [if XP SysRestore is enabled] ...
        if exist "%srctmp%" del /F /Q "%srctmp%"
        echo CONST DEVICE_DRIVER_INSTALL = 10 >"%srctmp%"
        echo CONST BEGIN_SYSTEM_CHANGE = 100 >>"%srctmp%"
        echo.>>"%srctmp%"
        echo strComputer = ".">>"%srctmp%"
        echo Set objWMIService = GetObject("winmgmts:" _ >>"%srctmp%"
        echo         ^& "{impersonationLevel=impersonate}!\\" ^& strComputer ^& "\root\default")>>"%srctmp%"
        echo.>>"%srctmp%"
        echo Set objItem = objWMIService.Get("SystemRestore")>>"%srctmp%"
        echo errResults = objItem.CreateRestorePoint _ >>"%srctmp%"
        echo         ("svc2kxp.cmd created restore point", DEVICE_DRIVER_INSTALL, BEGIN_SYSTEM_CHANGE)>>"%srctmp%"
        "%srctmp%"
        del /F /Q "%srctmp%"
        echo.
goto :XPSYSRESTORE_DONE


:END
if "%REBOOT_REQUIRED%"=="yes" (
        echo.
        echo  ______________________________________________________
        echo.
        echo           *** Zusammenfassung / Result ***
        echo.
        if /I %SELECT%=="/all" echo  Es wurden alle gewuenschten Aenderungen durchgefuehrt.
        if /I %SELECT%=="/std" echo  Einige Dienste blieben unveraendert.
        if /I %SELECT%=="/relan" echo  Notwendige LAN-Einstellungen wurden aktiviert.
	if /I %DHCP_CHANGES%=="YES" (
         	echo.
	  	echo  Wichtiger DHCP Hinweis
	  	echo  ======================
	  	echo  Ihre Konfiguration deutete an, das kein DHCP benoetigt wird. Falls
          	echo  Sie jedoch einen DSL-Internetzugang besitzen und DHCP irrtuemlich 
	  	echo  deaktivert wurde, kann es nach einem Neustart zu Problemen mit der 
	  	echo  Internetverbindung kommen. Starten sie zur Problembehebung den 
	  	echo  DHCP-Dienst von Hand neu.
	  	echo.
		)
	echo.
        echo  Bitte starten Sie abschliessend Ihren Rechner neu.
        echo.
        if /I %SELECT%=="/all" echo  All changes applied successfully.
        if /I %SELECT%=="/std" echo  Some services stay unchanged.
        if /I %SELECT%=="/relan" echo  LAN settings reactivated.
	if /I %DHCP_CHANGES%=="YES" (
         	echo.
	  	echo  Important DHCP Notice
	  	echo  =====================
	  	echo  Your configuration indicates that DHCP will no longer be required.
	  	echo  But if you are using a DSL internet connection this choice probably 
          	echo  might be wrong. If you experiences problems during accessing the 
	  	echo  internet please re-activate the "DHCP Service" manually.
		echo.
		)
        echo  Please reboot.
        echo  ______________________________________________________
        )


:QUIT
echo            ________________________________________________________
echo.
echo                 Weitere Informationen: http://www.ntsvcfg.de
echo            For more informations: http://www.ntsvcfg.de/ntsvcfg_eng
echo            ________________________________________________________
echo             [Taste zum Beenden druecken]   [Press any key to quit]
echo             ------------------------------------------------------
echo.
if /I "%1"=="" pause>NUL

:QUIT_EXT
endlocal
if exist "%USERPROFILE%\ntsvcfg\svc2cmp.sav" del /F /Q "%USERPROFILE%\ntsvcfg\svc2cmp.sav"
echo.

:Assoc 
::对%1(第一个参数）进行分割，将第二个参数传给%%e。在本程序中，%1即为上面的%%i(形式为：IP:端口号) 
for /F "tokens=2 delims=:" %%e in ("%1") do ( 
    set  %2_Port=%%e 
  ) 
:: 查询PID等于%3(第三个参数)的进程，并将结果传给变量?_Proc_Name,?代表UDP或者TCP； 
for /F "skip=2 usebackq delims=, tokens=1" %%a in (`"Tasklist /FI "PID eq %3" /FO CSV"`) do ( 
   ::%%~a表示去掉%%a外面的引号，因为上述命令的结果是用括号括起来的。  
   set %2_Proc_Name=%%~a 
  )