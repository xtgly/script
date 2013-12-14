@echo off
SetLocal EnableDelayedExpansion
set curldate=%date% %time%
set num=%count%
C:\WINDOWS\system32\ping.exe 8.8.8.8 -n 1 | findstr TTL
if %errorlevel% neq 0 (
    if %count% leq 1 (
        echo %curldate% restart iis now ... >> C:\windows\time.log
        iisreset /restart
    )
    if %count% GTR 1 (
        if %count% LEQ 3 (
            taskkill /f /im netsh.exe
            echo %curldate% disable interFace now ... >> C:\windows\time.log
::          netsh interface set interface name="本地连接" admin=DISABLED
            C:\windows\devcon.exe disable *DEV_8139*
            ping -n 3 127.0.1>nul 2>nul&cls
::          netsh interface set interface name="本地连接" admin=ENABLE
            C:\windows\devcon.exe enable *DEV_8139*
        )
        if %count% GEQ 4 (
            setx count "0" -m
            echo %curldate% reboot system now ... >> C:\windows\time.log
            shutdown -r -t 0
        )
    )
    set /a num=num+1
    setx count "!num!" -m
) else (
    setx count "0" -m
)