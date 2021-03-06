@echo off
if "%1"=="" goto :usage
if "%2"=="" goto :usage
if "%3"=="" goto :usage
if "%4"=="sis" goto :buildsis
if "%4"=="SIS" goto :buildsis
if "%4"=="" goto :startcopy
goto :usage

rem %1 = path to epoc32 folder in SDK
rem %2 = path to OPL sources (including opl folder)
rem %3 = path to release folder
rem %4 = optional, if equal to "sis" then build SIS files first

:buildsis
ECHO == Building SIS files ==
ECHO.

pushd pkg\thumb
call buildsis
popd

pushd pkg\wins
call buildsis
popd

:startcopy
ECHO.
ECHO == Creating Developer Pack ==
ECHO.

pushd ..\..
del abld.bat /s
popd

if exist %3 rmdir %3 /q/s
mkdir %3
mkdir %3\DevPack

copy %2\rel\9500\txt\9500-dev-readme.txt %3\DevPack\readme.txt
copy %2\changes.txt %3\DevPack\changes.txt

ECHO = Copy files and folders =
echo examplesrc
mkdir %3\DevPack\examplesrc
echo examplesrc\pc
mkdir %3\DevPack\examplesrc\pc

echo examplesrc\pc\demoopl
mkdir %3\DevPack\examplesrc\pc\demoopl
xcopy %2\DemoOPL\*.* %3\DevPack\examplesrc\pc\demoopl /s/e/v/q

echo examplesrc\pc\oplrss
mkdir %3\DevPack\examplesrc\pc\oplrss
xcopy %2\oplrss\*.* %3\DevPack\examplesrc\pc\oplrss /s/e/v/q

echo examplesrc\pc\system
mkdir %3\DevPack\examplesrc\pc\system
echo examplesrc\pc\system\opl
mkdir %3\DevPack\examplesrc\pc\system\opl

copy %2\opx\agenda\agenda.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\alarm\alarm.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\appframe\appframe.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\array\array.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\bmp\bmp.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\buffer\buffer.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\contact\contact.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\convert\convert.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\data\data.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\date\date.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\dbase\dbase.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\locale\locale.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\mediaserveropx\mediaserveropx.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\printer\printer.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\scomms\scomms.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\scomms\e32err.tph %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\sendas\sendas.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\opx\system\system.txh %3\DevPack\examplesrc\pc\system\opl
copy %2\oplr\samplesu\const.tph %3\DevPack\examplesrc\pc\system\opl

echo examplesrc\target
mkdir %3\DevPack\examplesrc\target
echo examplesrc\target\demoopl
mkdir %3\DevPack\examplesrc\target\demoopl
copy %1\wins\c\opl\DemoApp\*.* %3\DevPack\examplesrc\target\demoopl

echo examplesrc\target\system
mkdir %3\DevPack\examplesrc\target\system
echo examplesrc\target\system\apps
mkdir %3\DevPack\examplesrc\target\system\apps
echo examplesrc\target\system\apps\demoopl
mkdir %3\DevPack\examplesrc\target\system\apps\demoopl
copy %1\wins\c\system\apps\demoopl\demoopl.mbm %3\DevPack\examplesrc\target\system\apps\demoopl

echo examplesrc\target\system\opl
mkdir %3\DevPack\examplesrc\target\system\opl

copy %1\wins\c\system\opl\agenda.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\alarm.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\appframe.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\array.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\bmp.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\buffer.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\contact.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\convert.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\data.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\date.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\dbase.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\locale.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\mediaserveropx.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\printer.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\prntst.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\scomms.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\e32err.oph %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\sendas.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\system.oxh %3\DevPack\examplesrc\target\system\opl
copy %1\wins\c\system\opl\const.oph %3\DevPack\examplesrc\target\system\opl

rem Binaries
echo binaries
mkdir %3\DevPack\binaries
echo binaries\pc
mkdir %3\DevPack\binaries\pc
echo binaries\pc\epoc32
mkdir %3\DevPack\binaries\pc\epoc32

echo binaries\pc\epoc32\include
mkdir %3\DevPack\binaries\pc\epoc32\include
copy %2\oplr\inc\oplapi.h %3\DevPack\binaries\pc\epoc32\include
copy %2\oplr\inc\opldb.* %3\DevPack\binaries\pc\epoc32\include
copy %2\oplr\inc\opldbdef.h %3\DevPack\binaries\pc\epoc32\include
copy %2\oplr\inc\opldbg.h %3\DevPack\binaries\pc\epoc32\include
copy %2\oplr\inc\opldoc.h %3\DevPack\binaries\pc\epoc32\include
copy %2\oplr\inc\oplerr.h %3\DevPack\binaries\pc\epoc32\include
copy %2\oplr\inc\oplstack.h %3\DevPack\binaries\pc\epoc32\include
copy %2\oplt\inc\opllex.* %3\DevPack\binaries\pc\epoc32\include
copy %2\oplt\inc\oplbacke.* %3\DevPack\binaries\pc\epoc32\include
copy %2\oplt\inc\opltbas.h %3\DevPack\binaries\pc\epoc32\include
copy %2\oplt\inc\opltdef.h %3\DevPack\binaries\pc\epoc32\include
copy %2\oplt\inc\opltoken.h %3\DevPack\binaries\pc\epoc32\include
copy %2\oplt\inc\opltran.h %3\DevPack\binaries\pc\epoc32\include
copy %2\oplr\inc\opx.h %3\DevPack\binaries\pc\epoc32\include
copy %2\oplr\inc\opxapi.h %3\DevPack\binaries\pc\epoc32\include
copy %2\oplr\inc\program.h %3\DevPack\binaries\pc\epoc32\include
copy %2\oplt\inc\texttran.* %3\DevPack\binaries\pc\epoc32\include
copy %1\include\oplr.rsg %3\DevPack\binaries\pc\epoc32\include
copy %1\include\opltran.rsg %3\DevPack\binaries\pc\epoc32\include
copy %1\include\texted.rsg %3\DevPack\binaries\pc\epoc32\include

echo binaries\pc\epoc32\release\marm
mkdir %3\DevPack\binaries\pc\epoc32\release\marm
copy %1\release\marm\opx.def %3\DevPack\binaries\pc\epoc32\release\marm

echo binaries\pc\epoc32\release\winc
mkdir %3\DevPack\binaries\pc\epoc32\release\winc
echo binaries\pc\epoc32\release\winc\udeb
mkdir %3\DevPack\binaries\pc\epoc32\release\winc\udeb
copy %1\release\winc\udeb\oplt.dll %3\DevPack\binaries\pc\epoc32\release\winc\udeb
copy %1\release\winc\udeb\opltran.exe %3\DevPack\binaries\pc\epoc32\release\winc\udeb

echo binaries\pc\epoc32\release\winc\udeb\z
mkdir %3\DevPack\binaries\pc\epoc32\release\winc\udeb\z
echo binaries\pc\epoc32\release\winc\udeb\z\system
mkdir %3\DevPack\binaries\pc\epoc32\release\winc\udeb\z\system
echo binaries\pc\epoc32\release\winc\udeb\z\system\data
mkdir %3\DevPack\binaries\pc\epoc32\release\winc\udeb\z\system\data
copy %1\release\winc\udeb\z\system\data\opltran.rsc %3\DevPack\binaries\pc\epoc32\release\winc\udeb\z\system\data

echo binaries\pc\epoc32\release\wins
mkdir %3\DevPack\binaries\pc\epoc32\release\wins
copy %1\release\wins\opx.def %3\DevPack\binaries\pc\epoc32\release\wins

echo binaries\pc\epoc32\release\wins\udeb
mkdir %3\DevPack\binaries\pc\epoc32\release\wins\udeb
copy %1\release\wins\udeb\oplr.dll %3\DevPack\binaries\pc\epoc32\release\wins\udeb
copy %1\release\wins\udeb\oplr.lib %3\DevPack\binaries\pc\epoc32\release\wins\udeb
copy %1\release\wins\udeb\oplt.dll %3\DevPack\binaries\pc\epoc32\release\wins\udeb
copy %1\release\wins\udeb\oplt.lib %3\DevPack\binaries\pc\epoc32\release\wins\udeb

echo binaries\pc\epoc32\release\wins\udeb\z
mkdir %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z
echo binaries\pc\epoc32\release\wins\udeb\z\system
mkdir %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system
echo binaries\pc\epoc32\release\wins\udeb\z\system\apps
mkdir %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\apps

echo binaries\pc\epoc32\release\wins\udeb\z\system\apps\opl
mkdir %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\apps\opl
copy %1\release\wins\udeb\z\system\apps\opl\opl.aif %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\apps\opl
copy %1\release\wins\udeb\z\system\apps\opl\opl.app %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\apps\opl

echo binaries\pc\epoc32\release\wins\udeb\z\system\apps\texted
mkdir %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\apps\texted
copy %1\release\wins\udeb\z\system\apps\texted\texted.aif %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\apps\texted
copy %1\release\wins\udeb\z\system\apps\texted\texted.app %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\apps\texted
copy %1\release\wins\udeb\z\system\apps\texted\texted.rsc %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\apps\texted

echo binaries\pc\epoc32\release\wins\udeb\z\system\data
mkdir %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\data
copy %1\release\wins\udeb\z\system\data\oplr.rsc %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\data

echo binaries\pc\epoc32\release\wins\udeb\z\system\install
mkdir %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\AgendaOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\AlarmOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\ArrayOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\BitmapOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\BufferOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\ContactOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\ConvertOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\DataOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\DateOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\DBaseOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\LocaleOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\MediaServerOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\PrinterOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\SCommsOPX_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\OPL_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install
copy %2\rel\9500\pkg\wins\stub\OPLDev_S80.sis %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\install

echo binaries\pc\epoc32\release\wins\udeb\z\system\opx
mkdir %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\agenda.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\alarm.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\appframe.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\array.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\bmp.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\buffer.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\contact.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\convert.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\data.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\date.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\dbase.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\locale.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\mediaserveropx.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\printer.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\scomms.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\sendas.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx
copy %1\release\wins\udeb\z\system\opx\system.opx %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\opx

echo binaries\pc\epoc32\release\wins\udeb\z\system\recogs
mkdir %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\recogs
copy %1\release\wins\udeb\z\system\recogs\recopl.rdl %3\DevPack\binaries\pc\epoc32\release\wins\udeb\z\system\recogs

echo binaries\pc\epoc32\wins
mkdir %3\DevPack\binaries\pc\epoc32\wins
echo binaries\pc\epoc32\wins\c
mkdir %3\DevPack\binaries\pc\epoc32\wins\c
echo binaries\pc\epoc32\wins\c\system
mkdir %3\DevPack\binaries\pc\epoc32\wins\c\system
echo binaries\pc\epoc32\wins\c\system\apps
mkdir %3\DevPack\binaries\pc\epoc32\wins\c\system\apps

echo binaries\pc\epoc32\wins\c\system\apps\demoopl
mkdir %3\DevPack\binaries\pc\epoc32\wins\c\system\apps\demoopl
copy %1\wins\c\system\apps\demoopl\demoopl.mbm %3\DevPack\binaries\pc\epoc32\wins\c\system\apps\demoopl

echo binaries\pc\epoc32\wins\c\system\opl
mkdir %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\agenda.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\alarm.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\appframe.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\array.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\bmp.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\buffer.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\contact.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\convert.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\data.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\date.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\dbase.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\locale.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\mediaserveropx.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\printer.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\prntst.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\scomms.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\e32err.oph %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\sendas.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\system.oxh %3\DevPack\binaries\pc\epoc32\wins\c\system\opl
copy %1\wins\c\system\opl\const.oph %3\DevPack\binaries\pc\epoc32\wins\c\system\opl

echo binaries\pc\tools
mkdir %3\DevPack\binaries\pc\tools
copy %2\opltools\opltran\opltran.bat %3\DevPack\binaries\pc\tools
copy %2\opltools\rsg2osg\*.* %3\DevPack\binaries\pc\tools
copy %2\opltools\hrh2oph\*.* %3\DevPack\binaries\pc\tools

echo binaries\sisfiles
mkdir %3\DevPack\binaries\sisfiles
echo binaries\sisfiles\pc
mkdir %3\DevPack\binaries\sisfiles\pc
echo binaries\sisfiles\pc\opx
mkdir %3\DevPack\binaries\sisfiles\pc\opx
echo binaries\sisfiles\pc\opx\udeb
mkdir %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\AgendaOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\AlarmOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\ArrayOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\BitmapOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\BufferOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\ContactOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\ConvertOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\DataOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\DateOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\DBaseOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\LocaleOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\MediaServerOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\PrinterOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb
copy %2\rel\9500\pkg\wins\sis\SCommsOPX_S80.sis %3\DevPack\binaries\sisfiles\pc\opx\udeb

echo binaries\sisfiles\pc\other\udeb
mkdir %3\DevPack\binaries\sisfiles\pc\other\udeb
copy %2\rel\9500\pkg\wins\sis\DemoOPL_S80.sis %3\DevPack\binaries\sisfiles\pc\other\udeb

echo binaries\sisfiles\target
mkdir %3\DevPack\binaries\sisfiles\target
echo binaries\sisfiles\target\opx
mkdir %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\AgendaOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\AlarmOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\ArrayOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\BitmapOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\BufferOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\ContactOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\ConvertOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\DataOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\DateOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\DBaseOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\LocaleOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\MediaServerOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\PrinterOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx
copy %2\rel\9500\pkg\thumb\sis\SCommsOPX_S80.sis %3\DevPack\binaries\sisfiles\target\opx

echo binaries\sisfiles\target\other
mkdir %3\DevPack\binaries\sisfiles\target\other
copy %2\rel\9500\pkg\thumb\sis\DemoOPL_S80.sis %3\DevPack\binaries\sisfiles\target\other
copy %2\rel\9500\pkg\thumb\sis\OPL_S80.sis %3\DevPack\binaries\sisfiles\target\other
copy %2\rel\9500\pkg\thumb\sis\OPLDev_S80.sis %3\DevPack\binaries\sisfiles\target\other

ECHO.
ECHO == Creating Mini Developer Pack ==
ECHO.

mkdir %3\DevMini

copy %2\rel\9500\txt\9500-dvm-readme.txt %3\DevMini\readme.txt
copy %2\changes.txt %3\DevMini\changes.txt

ECHO = Copy files and folders =
echo examplesrc
mkdir %3\DevMini\examplesrc
echo examplesrc\demoopl
mkdir %3\DevMini\examplesrc\demoopl
copy %1\wins\c\opl\DemoApp\*.* %3\DevMini\examplesrc\demoopl

echo examplesrc\system
mkdir %3\DevMini\examplesrc\system
echo examplesrc\system\apps
mkdir %3\DevMini\examplesrc\system\apps
echo examplesrc\system\apps\demoopl
mkdir %3\DevMini\examplesrc\system\apps\demoopl
copy %1\wins\c\system\apps\demoopl\demoopl.mbm %3\DevMini\examplesrc\system\apps\demoopl

echo examplesrc\system\opl
mkdir %3\DevMini\examplesrc\system\opl

copy %1\wins\c\system\opl\agenda.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\alarm.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\appframe.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\array.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\bmp.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\buffer.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\contact.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\convert.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\data.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\date.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\dbase.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\locale.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\mediaserveropx.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\printer.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\prntst.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\scomms.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\e32err.oph %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\sendas.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\system.oxh %3\DevMini\examplesrc\system\opl
copy %1\wins\c\system\opl\const.oph %3\DevMini\examplesrc\system\opl

rem Binaries

echo sisfiles
mkdir %3\DevMini\sisfiles
echo sisfiles\opx
mkdir %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\AgendaOPX_S80.sis %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\AlarmOPX_S80.sis %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\ArrayOPX_S80.sis %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\BitmapOPX_S80.sis %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\BufferOPX_S80.sis %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\ContactOPX_S80.sis %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\ConvertOPX_S80.sis %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\DataOPX_S80.sis %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\DateOPX_S80.sis %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\DBaseOPX_S80.sis %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\LocaleOPX_S80.sis %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\MediaServerOPX_S80.sis %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\PrinterOPX_S80.sis %3\DevMini\sisfiles\opx
copy %2\rel\9500\pkg\thumb\sis\SCommsOPX_S80.sis %3\DevMini\sisfiles\opx

echo sisfiles\other
mkdir %3\DevMini\sisfiles\other
copy %2\rel\9500\pkg\thumb\sis\DemoOPL_S80.sis %3\DevMini\sisfiles\other
copy %2\rel\9500\pkg\thumb\sis\OPL_S80.sis %3\DevMini\sisfiles\other
copy %2\rel\9500\pkg\thumb\sis\OPLDev_S80.sis %3\DevMini\sisfiles\other

ECHO.
ECHO == Creating User Pack ==
ECHO.

mkdir %3\UserPack

copy %2\rel\9500\txt\9500-pub-readme.txt %3\UserPack\readme.txt
copy %2\changes.txt %3\UserPack\changes.txt

copy %2\rel\9500\pkg\thumb\sis\DemoOPL_S80.sis %3\UserPack
copy %2\rel\9500\pkg\thumb\sis\OPL_S80.sis %3\UserPack

ECHO.
ECHO == Done ==

goto :end

:usage
echo Usage: mk9500release sdkpath oplpath destpath [sis]
:end
