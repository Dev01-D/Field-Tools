

*Still to do - backup of pst files, change welcome name to remove the dot


title CMD Utility (C) Geoff Palmer Version 1.2
mode 48,40
@echo off
echo (C) Geoff Palmer Version 1.0
echo.
cls
goto start
rem ####################### START ######################
:start
echo (C) Geoff Palmer Version 1.2
echo.
mode 48,40
color 0f
@echo off
for /f "tokens=2*" %%a in ('net user "%Username%" /domain ^| find /i "Full Name"') do set DisplayName=%%b
echo %DisplayName% WELCOME TO THE CMD UTILITY (Beta)!!
echo What option would you like to execute?
echo.
echo NETWORKING:
echo _____________
echo 1) Ipconfig
echo 2) Reset Network
echo 3) Ping an ip address
echo 4) Trace Root
echo 5) NetStat
echo 6) Get Mac address
echo.
echo SYSTEM INFO:
echo ______________
echo 7) Who am I
echo 8) Uptime 
echo 9) PC Info
echo 10) Performance Check
echo 11) Disk Check
echo 12) Driver Check
echo 13) Mirror Drive
echo 14) Recover Drive
echo.
echo WINDOWS TOOLS:
echo __________________
echo 15) Clear recycle bin and Temporary files
echo 16) Hard drive Defrag
echo 17) Start or End a Task
echo 18) Battery Performance
echo 19) Outlook Backup
echo.
echo Cleanup:
echo __________________
echo 20) Remove Battery Performance Log
echo 21) Remove Driver Log
echo.
echo 22) Exit

echo.
set option=
echo.
set /p option=Select One:
echo.
if "%option%"=="1" goto ipconfig
if "%option%"=="2" goto Network
if "%option%"=="3" goto ping
if "%option%"=="4" goto tracert
if "%option%"=="5" goto netstat
if "%option%"=="6" goto getmac
if "%option%"=="7" goto whoami
if "%option%"=="8" goto uptime
if "%option%"=="9" goto pcinfo
if "%option%"=="10" goto perfmon
if "%option%"=="11" goto CHKDSK
if "%option%"=="12" goto DRIVER
if "%option%"=="13" goto MIR
if "%option%"=="14" goto recover
if "%option%"=="15" goto clearmgr
if "%option%"=="16" goto defrag
if "%option%"=="17" goto task
if "%option%"=="18" goto Power
if "%option%"=="19" goto pst
if "%option%"=="20" goto Cleanpwr
if "%option%"=="21" goto Cleandrv
if "%option%"=="22" goto Exit
echo.
ECHO “%option%” is not valid please try again
goto start
ECHO.
rem ###################### Options #####################
rem ###################### ipconfig #######################
:ipconfig
mode 70,40
cls
color 0c
echo.
ipconfig
pause
cls
goto start
rem ###################### Network #######################
:Network
mode 80,40
cls
color 0A
cls 
ipconfig /release 
ipconfig /renew 
ipconfig /registerdns 

goto start
rem ###################### ping #######################
:ping
cls
color 0b
@echo off
mode 45,2
color 0F
set /p a="Enter IP ADDRESS: "
MODE 60,15
ping %a%
echo [----------------------------------------------------------]
pause
cls
goto start
rem ###################### tracert #######################
:tracert
mode 60,5
cls
color 0b
echo Please enter web page you would like to trace?
echo [EXAMPLE] http://www.google.com
echo.
Set /p trace=
mode 75,50
echo.
echo Trace Root initiate
tracert %trace%
pause
cls
goto start
rem ###################### netstat #######################
:netstat
@echo off
color 0F
:options
mode 45,10
cls
echo MENU OPTIONS:
echo =====================
echo a All links
echo e Ethernet Statistics
echo f Displays FDQN
echo n Addresses and ports
echo =====================
echo q to quit
echo =====================
set /p input="Enter Options Here: "

if "%input%"=="a" goto:a
if "%input%"=="e" goto:e
if "%input%"=="f" goto:f
if "%input%"=="n" goto:n
if "%input%"=="q" goto:start

echo Please choose from the Options listed above!
pause
goto:options

:a
mode 80,60
netstat.exe -a
pause
goto:options

:e
mode 80,15
netstat.exe -e
pause
goto:options

:f
mode 80,25
netstat.exe -f
pause
goto:options

:n
mode 80,20
netstat.exe -n
pause
goto:options
rem ###################### getmac #######################
:getmac
mode 60,25
@echo off
cls
color 0e
echo.
arp -a
echo.
echo Have you got all the info needed?
pause
cls
goto start
rem ###################### whoami #######################
:whoami
mode 45,5
color 0d
whoami
pause
cls
goto start
rem ###################### uptime #######################
:uptime
mode 50,4
color 0d
systeminfo | find "System Boot Time:"
pause
cls
goto start
rem ###################### pcinfo #######################
:pcinfo
mode 80,60
cls
color 0e
systeminfo
pause
cls
goto start
rem ###################### perfmon #######################
:perfmon
mode 45,5
cls
color 0b
echo.
echo Please wait program starting!
PERFMON
pause
cls
goto start
rem ###################### CHKDSK#######################
:CHKDSK
mode 48,5
cls
echo Please enter the drive you would like to check?
echo.
Set /p DSK=
echo.
cls
echo Check disk initiate
CHKDSK %DSK%:
pause
cls
goto start
rem ###################### clearmgr#######################
:clearmgr
echo Just follow the On Screen instructions and Press OK, Press Delete and OK.
CleanMgr
echo DONE!!
pause
cls
goto start
rem ###################### defrag #######################
:defrag
echo You will need to run this program as Administrator
echo This will Defrag all volumes:
pause
defrag /C /H /V
pause
cls
goto start

rem ###################### DRIVER#######################
:DRIVER
mode 80,50
cls
echo Querying Drivers
echo Exporting to C Drive
driverquery /v /fo csv > "C:\driverlist.csv"
pause
C:\users\%username%\desktop\driverlist.csv
goto start
rem ###################### MIR #######################
:MIR
color 0c
echo Please Enter the Source DRIVE
echo.
set /p SOURCE=
echo Please Enter the Destination DRIVE
echo.
set /p DEST=
ROBOCOPY %SOURCE%: %DEST%: /MIR
pause
cls
goto start
rem ###################### recover #######################
:recover
echo Please Enter the Source file path
echo.
set /p SOURCE=
TYPE SOURCE
pause
cls
goto start

rem ###################### Power Check #######################
:Power
mode 80,10
cls
echo You will need to run this program as Administrator
echo.
echo This will save a battery report in the root hard drive
echo.
powercfg /batteryreport /output "C:\battery_report.html"
Pause
C:\battery_report.html
goto start
rem ###################### task #######################
:task
mode 40,10
cls
echo TASK KILL OR START TASK MENU
echo.
echo What option would you like to execute?
echo.
echo T) Tasklist
echo 1) Task Kill
echo 2) start task
echo 3) back
echo.
set option=
echo.
set /p option=Select One:
echo.
if "%option%"=="T" goto tasklist
if "%option%"=="1" goto taskkill
if "%option%"=="2" goto starttask
if "%option%"=="3" goto back
rem ################# tasklist ###################
:tasklist
mode 48,50
cls
echo The fowlling process are actives!
tasklist
pause
cls
goto task
rem ################# taskkill ###################
:taskkill
echo What process would you like to end?
echo.
set /p task_name= task name without .exe
taskkill /f /im %task_name%.exe
pause
cls
goto task
rem ################# starttask ###################
:starttask
echo What process would you like to start?
echo.
set /p task_name=
start %task_name%
cls
pause
goto task..
rem ################# back ###################
:back
cls
goto start
rem ###################### cleanpwr #######################
:Cleanpwr
cls
echo Removing Battery Performance Log
pause
del /f C:\battery_report.html
echo.
echo File Deleted!
pause
cls
goto start
rem ###################### cleandrv #######################
:Cleandrv
cls
echo Removing Driver List
pause
del /f C:\driverlist.csv
echo.
echo File Deleted!
pause
cls
goto start
rem ###################### PST #######################
:pst
mode 80,40
echo Format your USB stick you want to save PST files to as P
pause
cls
color 0a
robocopy "C:\users\%username%\appdata\local\Microsoft\Outlook" "P:\Backup" /mir
pause
cls
goto start
rem ###################### exit #######################
:exit
mode 45,5
cls
echo Are you sure you want to EXIT?
echo Select c to cancel or press ok to exit
set /p input="Enter Options Here: "
if "%input%"=="ok" goto:ok
if "%input%"=="c" goto:start