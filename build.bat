@echo off
REM build.bat
REM Textadept Portable build script

set NSIS_VERSION=2.46

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
echo Copy NSIS script....
copy TextadeptPortable.nsi TextadeptPortable\Other\Source
echo Copy License file
copy License.txt TextadeptPortable\Other\Source
echo ============================================================
echo Copy icons...
copy textadept.ico TextadeptPortable\App\AppInfo\appicon.ico
copy ta_16x16.png TextadeptPortable\App\AppInfo\appicon_16.png
copy ta_32x32.png TextadeptPortable\App\AppInfo\appicon_32.png

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
