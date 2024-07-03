@echo off
echo ......................................
echo WELCOME TO WIPASS EXPLORER
echo ......................................
echo.
echo This script is written by Apollos_Dev
echo.
REM Enable delayed expansion for variables
setlocal enabledelayedexpansion

REM Loop through all the Wi-Fi profiles stored on the computer
for /F "tokens=2 delims=:" %%i in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    REM Remove leading spaces from the profile name
    set "ssid=%%i"
    set "ssid=!ssid:~1!"
    
    REM Display the SSID (Wi-Fi network name)
    echo SSID: !ssid!
    
    REM Show the Wi-Fi profile details and extract the password (Key Content)
    netsh wlan show profile name="!ssid!" key=clear | findstr /C:"Key Content"
    
    REM Add a blank line for better readability
    echo.
)

REM Uncomment the following line to require a password before running the script
REM set /p pass="Apollos" && if NOT %pass%==Apollos exit

REM End local environment changes
endlocal

REM Pause the script to allow the user to see the results
pause
 