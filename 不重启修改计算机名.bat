@echo off
TITLE 不重启修改计算机名
MODE con: COLS=50 LINES=20
color 2f
:name 
set /p cname=请输入计算机名:

echo Windows Registry Editor Version 5.00 >c:\windows\reg.reg

echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName] >> c:\windows\reg.reg

echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName] >> c:\windows\reg.reg 
echo "ComputerName"="%cname%" >> c:\windows\reg.reg

echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName] >> c:\windows\reg.reg 
echo "ComputerName"="%cname%" >> c:\windows\reg.reg

echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Control\ComputerName\ComputerName] >> c:\windows\reg.reg 
echo "ComputerName"="%cname%" >> c:\windows\reg.reg

echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters] >> c:\windows\reg.reg 
echo "NV Hostname"="%cname%" >> c:\windows\reg.reg 
echo "Hostname"="%cname%" >> c:\windows\reg.reg

echo [HKEY_USERS\S-1-5-18\Software\Microsoft\Windows\ShellNoRoam] >> c:\windows\reg.reg 
echo @="%cname%" >> c:\windows\reg.reg

echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName] >> c:\windows\reg.reg 
echo "ComputerName"="%cname%" >> c:\windows\reg.reg

echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Tcpip\Parameters] >> c:\windows\reg.reg 
echo "NV Hostname"="%cname%" >> c:\windows\reg.reg 
echo "Hostname"="%cname%" >> c:\windows\reg.reg

echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon] >> c:\windows\reg.reg 
echo "DefaultDomainName"="%cname%" >> c:\windows\reg.reg 
echo "AltDefaultDomainName"="%cname%" >> c:\windows\reg.reg

regedit /s c:\windows\reg.reg 
cmd