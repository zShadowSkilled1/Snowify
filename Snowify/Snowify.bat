@echo off
title Snowify
echo Ready!

set n=^& echo.
IF EXIST configs\textcolorgreen Color 2
IF EXIST configs\textcolorblue Color 1
IF EXIST configs\textcolorred Color 4
IF EXIST configs\textcolorpurple Color 5
IF EXIST configs\redtheme Color 4B
IF EXIST configs\greentheme goto :greenthemestart
IF NOT EXIST configs goto :createconfigs
IF NOT EXIST others\logs.txt goto :createconfigs
IF NOT EXIST configs\configs.txt goto :createconfigs
IF NOT EXIST configs\msgboxes.vbs goto :createconfigs

:boot

for /f "tokens=1,2 delims==" %%a in (configs\config.json) do (
    if %%a==welcomemsg set %%a=%%b
)

echo %welcomemsg%

:choice
set /P c=What Do You Want To Do ? [ 1 = Execute A Command / 2 = Settings ]
if /I "%c%" EQU "1" goto :start
if /I "%c%" EQU "2" goto :settings
goto :choice

:start

echo.
echo Please enter your command.
echo.
set /p Cmd=
echo.
echo Executing the command %Cmd%
echo.
%Cmd%
echo %Cmd% >> others\logs.txt
echo.
goto :choice

pause
:end
echo Closing This Windows In Five Seconds!
timeout 5
exit

:settings

set /P set1=What Do You Want To Do ? [ 1 = Change text color / 2 = Open Snowify on Github / 3 = Change Theme / 4 = Customize /5 = Others]
if /I "%set1%" EQU "1" goto :colorchange
if /I "%set1%" EQU "2" goto :openweb
if /I "%set1%" EQU "3" goto :changetheme
if /I "%set1%" EQU "4" goto :customize
if /I "%set1%" EQU "5" goto :others

goto :settings

:others

set /P set18=What Do You Want To Do ? [ 1 = History / ]
if /I "%set18%" EQU "1" type others\logs.txt
goto :choice

:openweb

echo Opening Your Web Browser.
echo x=msgbox("Snowify Is Opening Your Web Browser .",0,"Snowify") > configs\msgboxes.vbs
start configs\msgboxes.vbs
start https://github.com/zShadowSkilled1/Snowify
goto :choice

:customize

set /P set12=What Do You Want To Do ? [ 1 = Change Welcome Message / 2 = Dont Show Popup On Start / 3 = Show Popup At Start / ]
if /I "%set12%" EQU "1" goto :changewelcommsg
if /I "%set12%" EQU "2" IF NOT EXIST configs\disablemsg type nul > configs\disablemsg
if /I "%set12%" EQU "3" IF EXIST configs\disablemsg del /F configs\disablemsg

goto :choice

:colorchange

set /P c10=Wich Color ? [ 1 = Green / 2 = Blue / 3 = Red / 4 = Purple / 5 = White ]
if /I "%c10%" EQU "1" goto :greencolor
if /I "%c10%" EQU "2" goto :bluecolor
if /I "%c10%" EQU "3" goto :redcolor
if /I "%c10%" EQU "4" goto :purplecolor
if /I "%c10%" EQU "5" goto :whitecolor

goto :colorchange

:changetheme

set /P c11=Wich Color ? [ 1 = Green Theme / 2 = Red Theme]
if /I "%c11%" EQU "1" goto :greentheme
if /I "%c11%" EQU "2" goto :redtheme

:greencolor

Color 2
rem echo {[textcolor = Green]}> configs\config.json
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\textcolorpurple del /F configs\textcolorpurple
IF EXIST configs\redtheme del /F configs\redtheme
IF EXIST configs\greentheme del /F configs\greentheme
type nul > configs\textcolorgreen
goto :choice

:bluecolor

Color 1
IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\textcolorprple del /F configs\textcolorpurple
IF EXIST configs\redtheme del /F configs\redtheme
IF EXIST configs\greentheme del /F configs\greentheme
type nul > configs\textcolorblue
goto :choice

:redcolor

Color 4
IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorpurple del /F configs\textcolorpurple
IF EXIST configs\redtheme del /F configs\redtheme
IF EXIST configs\greentheme del /F configs\greentheme
type nul > configs\textcolorred
goto :choice

:purplecolor

Color 5
IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\redtheme del /F configs\redtheme
IF EXIST configs\greentheme del /F configs\greentheme
type nul > configs\textcolorpurple
goto :choice

:whitecolor

Color 7
IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\textcolorpurple del /F configs\textcolorpurple

goto :choice

:greentheme

IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\textcolorpurple del /F configs\textcolorpurple
IF EXIST configs\redtheme del /F configs\redtheme
Color 2B
Color 2F
type nul > configs\greentheme
goto :choice

:greenthemestart
Color 2B
Color 2F
IF EXIST configs\msgboxes.vbs echo x=msgbox("Snowify Is Ready To Be Used .",0,"Snowify") > configs\msgboxes.vbs

start configs\msgboxes.vbs
goto :choice

:redtheme

IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\textcolorpurple del /F configs\textcolorpurple
IF EXIST configs\greentheme del /F configs\greentheme
Color 4B
type nul > configs\redtheme
goto :choice

:changewelcommsg

echo Please enter your custom message.

IF EXIST configs\config.json set /P WMSG=
IF EXIST configs\config.json echo welcomemsg=%WMSG% > configs\config.json
IF EXIST configs\config.json type nul > configs\custommsg


:choice3
set /P c3=What Do You Want To Do ? [ 1 = Execute a command / 2 = Settings ]
if /I "%c3%" EQU "1" goto :start
if /I "%c3%" EQU "2" goto :settings
goto :choice3

:createconfigs

IF NOT EXIST configs MKDIR configs
IF NOT EXIST others MKDIR others
IF NOT EXIST configs\config.json echo.
IF NOT EXIST configs\config.json echo Downloading The Snowify Components.
echo.
IF NOT EXIST configs\config.json type nul > configs\config.json 
IF NOT EXIST configs\msgboxes.vbs type nul > configs\msgboxes.vbs
IF NOT EXIST others\logs.txt type nul > others\logs.txt
IF EXIST configs\msgboxes.vbs echo x=msgbox("Snowify Is Ready To Be Used .",0,"Snowify") > configs\msgboxes.vbs

IF NOT EXIST configs\disablemsg start configs\msgboxes.vbs
IF EXIST configs\msgboxes.vbs echo Snowify Is Ready To Be Used.
IF NOT EXIST configs\custommsg echo welcomemsg=Welcome To Snowify. > configs\config.json

echo.
IF NOT EXIST configs\config.json echo Snowify Cannot Download Its Components (configs\config.json | Error 1).
IF NOT EXIST configs\msgboxes.vbs echo Snowify Cannot Download Its Components (configs\msgboxes.vbs |Error 2).
IF NOT EXIST configs\msgboxes.vbs echo Retrying...
IF NOT EXIST configs\config.json echo Retrying...
IF NOT EXIST configs\config.json goto :createconfigs
IF NOT EXIST configs\msgboxes.vbs goto :createconfigs

goto :boot

