@echo off
TITLE  �����л�������
MODE con: COLS=50 LINES=35
color 2f
:start
cls
echo.
echo         �q�������������������������������r
echo   �q������     �� �� �� �� �� �� ��     �������r
echo   ��    �t�������������������������������s    ��
echo   ��                                          ��
echo   ��  1��������ͨ˫��                         ��
echo   ��                                          ��
echo   ��  2����ͨר��                             ��
echo   ��                                          ��
echo   ��  3���������� DNS                         ��
echo   ��                                          ��
echo   ��  4��������ͨ DNS                         ��
echo   ��                                          ��
echo   ��  5�������ƶ� DNS                         ��
echo   ��                                          ��
echo   ��  6��CNNIC DNS                            ��
echo   ��                                          ��
echo   ��  7��Google DNS                           ��
echo   ��                                          ��
echo   ��  8��OpenDNS                              ��
echo   ��                                          ��
echo   ��  9��OpenDNS                              ��
echo   ��                                          ��
echo   ��  10��Norton DNS                          ��
echo   ��                                          ��
echo   ��  11��Comodo Secure DNS                   ��
echo   ��                                          ��
echo   ��  ?��������˳�                           ��
echo   ��                                          ��
echo   ��Powered By c QQ:1049832302                ��
echo   �t�������������������������������������������s
echo.
set /p choice=  ��ѡ��:
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
netsh interface ip set address name="��������" source=static addr=192.168.1.68 mask=255.255.255.0 gateway=192.168.1.1 gwmetric=0
netsh interface ip set dns name="��������" source=static addr=218.85.157.99 register=PRIMARY
netsh interface ip add dns name="��������" addr=58.22.96.66 index=2
exit

:cu
netsh interface ip set address name="��������" source=static addr=192.168.1.84 mask=255.255.255.0 gateway=192.168.1.1 gwmetric=0
netsh interface ip set dns name="��������" source=static addr=58.22.96.66 register=PRIMARY
netsh interface ip add dns name="��������" addr=218.104.128.106 index=2
exit

:ctdns
netsh interface ip set dns name="��������" source=static addr=218.85.157.99 register=PRIMARY
netsh interface ip add dns name="��������" addr=218.85.152.99 index=2
exit

:cudns
netsh interface ip set dns name="��������" source=static addr=58.22.96.66 register=PRIMARY
netsh interface ip add dns name="��������" addr=218.104.128.106 index=2
exit

:cmdns
netsh interface ip set dns name="��������" source=static addr=211.138.145.194 register=PRIMARY
netsh interface ip add dns name="��������" addr=211.138.151.161 index=2
exit

:cnnicdns
netsh interface ip set dns name="��������" source=static addr=1.2.4.8 register=PRIMARY
netsh interface ip add dns name="��������" addr=210.2.4.8 index=2
exit

:googledns
netsh interface ip set dns name="��������" source=static addr=8.8.8.8 register=PRIMARY
netsh interface ip add dns name="��������" addr=8.8.4.4 index=2
exit

:opendns
netsh interface ip set dns name="��������" source=static addr=208.67.222.222 register=PRIMARY
netsh interface ip add dns name="��������" addr=208.67.220.220 index=2
exit

:openfamilydns
netsh interface ip set dns name="��������" source=static addr=208.67.222.123 register=PRIMARY
netsh interface ip add dns name="��������" addr=208.67.220.123 index=2
exit

:nortondns
netsh interface ip set dns name="��������" source=static addr=198.153.192.1 register=PRIMARY
netsh interface ip add dns name="��������" addr=198.153.194.1 index=2
exit

:comododns
netsh interface ip set dns name="��������" source=static addr=156.154.70.22 register=PRIMARY
netsh interface ip add dns name="��������" addr=156.156.71.22 index=2
exit