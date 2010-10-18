@echo off
REM build.bat
REM Textadept Portable build script

set GTK_VERSION=2.22.0-2010-10-01
set NSIS_VERSION=2.46
set TA_VERSION=3.3

REM create directory structure
REM TextadeptPortable
REM + App
REM  + AppInfo
REM  + AppName
REM  + DefaultData
REM + Data
REM + Other
REM   + Help
REM     + Images
REM   + Source
echo ============================================================
echo Create directory structure...
mkdir TextadeptPortable\App\Textadept
mkdir TextadeptPortable\App\AppInfo
mkdir TextadeptPortable\App\AppDefaultData
mkdir TextadeptPortable\Data
mkdir TextadeptPortable\Other\Help\Images
mkdir TextadeptPortable\Other\Source


echo ============================================================
IF NOT EXIST TextadeptPortable\App\Textadept\core (
  echo Move Textadept
  xcopy /E textadept_%TA_VERSION%.win32 TextadeptPortable\App\Textadept
)

echo ============================================================
echo Copy NSIS script....
copy TextadeptPortable.nsi TextadeptPortable\Other\Source
echo Copy License file
copy License.txt TextadeptPortable\Other\Source
echo ============================================================
echo Copy icons...
copy TextadeptPortable\App\Textadept\core\images\textadept.ico TextadeptPortable\App\AppInfo\appicon.ico
copy TextadeptPortable\App\Textadept\core\images\ta_16x16.png TextadeptPortable\App\AppInfo\appicon_16.png
copy TextadeptPortable\App\Textadept\core\images\ta_32x32.png TextadeptPortable\App\AppInfo\appicon_32.png

IF NOT EXIST TextadeptPortable\App\GTK (
    echo ============================================================
    echo Installing GTK...
    gtk2-runtime-%GTK_VERSION%-ash /S /sideeffects=no /D=%CD%\TextadeptPortable\App\GTK
)

if NOT EXIST NSISPortable (
    echo ============================================================
    echo Install NSIS Portable...
    echo Choose the current working directory
    echo %CD%\NSISPortable
    echo as the installation location.
    NSISPortable_%NSIS_VERSION%_English.paf.exe
)

echo ============================================================
echo Building TextadeptPortable
NSISPortable\App\NSIS\makensis.exe TextadeptPortable\Other\Source\TextadeptPortable.nsi

