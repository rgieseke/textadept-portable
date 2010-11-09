#!/bin/bash
TA_VERSION=3.4
TA_DOWNLOAD=http://textadept.googlecode.com/files/textadept_${TA_VERSION}.win32.zip
TA_ZIPFILE=textadept_${TA_VERSION}.win32.zip
NSIS_VERSION=2.46
NSIS_DOWNLOAD=http://downloads.sourceforge.net/portableapps/NSISPortable_${NSIS_VERSION}_English.paf.exe
NSIS_INSTALLER=NSISPortable_${NSIS_VERSION}_English.paf.exe
GTK_VERSION=2.22.0-2010-10-01
GTK_DOWNLOAD=http://downloads.sourceforge.net/gtk-win/gtk2-runtime-${GTK_VERSION}-ash.exe
GTK_INSTALLER=gtk2-runtime-${GTK_VERSION}-ash.exe

# Downloads
echo ============================================================
echo Downloading Textadept $TA_VERSION....
echo ============================================================
if [ -e $TA_ZIPFILE ];
then
    echo $TA_ZIPFILE already downloaded.
else
    wget $TA_DOWNLOAD
fi
echo ============================================================
echo Unzip Textadept...
echo ============================================================
unzip $TA_ZIPFILE

echo ============================================================
echo Downloading NSIS Portable $NSIS_VERSION....
echo ============================================================
if [ -e $NSIS_INSTALLER ];
then
    echo $NSIS_INSTALLER already downloaded
else
    echo Download
    wget $NSIS_DOWNLOAD
fi

echo ============================================================
echo Downloading GTK-Installer....
echo ============================================================
if [ -e $GTK_INSTALLER ];
then
    echo $GTK_INSTALLER already downloaded.
else
    echo Download
    wget $GTK_DOWNLOAD
fi
