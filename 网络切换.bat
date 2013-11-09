@echo off
TITLE  网络切换批处理
MODE con: COLS=50 LINES=35
color 2f
:start
cls
echo.
echo         ╭───────────────╮
echo   ╭──┤     网 络 切 换 批 处 理     ├──╮
echo   │    ╰───────────────╯    │
echo   │                                          │
echo   │  1、电信联通双线                         │
echo   │                                          │
echo   │  2、联通专线                             │
echo   │                                          │
echo   │  3、福建电信 DNS                         │
echo   │                                          │
echo   │  4、福建联通 DNS                         │
echo   │                                          │
echo   │  5、福建移动 DNS                         │
echo   │                                          │
echo   │  6、CNNIC DNS                            │
echo   │                                          │
echo   │  7、Google DNS                           │
echo   │                                          │
echo   │  8、OpenDNS                              │
echo   │                                          │
echo   │  9、OpenDNS                              │
echo   │                                          │
echo   │  10、Norton DNS                          │
echo   │                                          │
echo   │  11、Comodo Secure DNS                   │
echo   │                                          │
echo   │  ?、任意键退出                           │
echo   │                                          │
echo   │Powered By c QQ:1049832302                │
echo   ╰─────────────────────╯
echo.
set /p choice=  请选择:
if "%choice%"=="1" goto double
if "%choice%"=="2" goto cu
if "%choice%"=="3" goto ctdns
if "%choice%"=="4" goto cudns
if "%choice%"=="5" goto cmdns
if "%choice%"=="6" goto cnnicdns
if "%choice%"=="7" goto googledns
if "%choice%"=="8" goto opendns
if "%choice%"=="9" goto openfamilydns
if "%choice%"=="10" goto nortondns
if "%choice%"=="11" goto comododns
exit

:double
netsh interface ip set address name="本地连接" source=static addr=192.168.1.68 mask=255.255.255.0 gateway=192.168.1.1 gwmetric=0
netsh interface ip set dns name="本地连接" source=static addr=218.85.157.99 register=PRIMARY
netsh interface ip add dns name="本地连接" addr=58.22.96.66 index=2
exit

:cu
netsh interface ip set address name="本地连接" source=static addr=192.168.1.84 mask=255.255.255.0 gateway=192.168.1.1 gwmetric=0
netsh interface ip set dns name="本地连接" source=static addr=58.22.96.66 register=PRIMARY
netsh interface ip add dns name="本地连接" addr=218.104.128.106 index=2
exit

:ctdns
netsh interface ip set dns name="本地连接" source=static addr=218.85.157.99 register=PRIMARY
netsh interface ip add dns name="本地连接" addr=218.85.152.99 index=2
exit

:cudns
netsh interface ip set dns name="本地连接" source=static addr=58.22.96.66 register=PRIMARY
netsh interface ip add dns name="本地连接" addr=218.104.128.106 index=2
exit

:cmdns
netsh interface ip set dns name="本地连接" source=static addr=211.138.145.194 register=PRIMARY
netsh interface ip add dns name="本地连接" addr=211.138.151.161 index=2
exit

:cnnicdns
netsh interface ip set dns name="本地连接" source=static addr=1.2.4.8 register=PRIMARY
netsh interface ip add dns name="本地连接" addr=210.2.4.8 index=2
exit

:googledns
netsh interface ip set dns name="本地连接" source=static addr=8.8.8.8 register=PRIMARY
netsh interface ip add dns name="本地连接" addr=8.8.4.4 index=2
exit

:opendns
netsh interface ip set dns name="本地连接" source=static addr=208.67.222.222 register=PRIMARY
netsh interface ip add dns name="本地连接" addr=208.67.220.220 index=2
exit

:openfamilydns
netsh interface ip set dns name="本地连接" source=static addr=208.67.222.123 register=PRIMARY
netsh interface ip add dns name="本地连接" addr=208.67.220.123 index=2
exit

:nortondns
netsh interface ip set dns name="本地连接" source=static addr=198.153.192.1 register=PRIMARY
netsh interface ip add dns name="本地连接" addr=198.153.194.1 index=2
exit

:comododns
netsh interface ip set dns name="本地连接" source=static addr=156.154.70.22 register=PRIMARY
netsh interface ip add dns name="本地连接" addr=156.156.71.22 index=2
exit