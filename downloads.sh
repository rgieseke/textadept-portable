#!/bin/bash
NSIS_VERSION=2.46
NSIS_DOWNLOAD=http://downloads.sourceforge.net/portableapps/NSISPortable_${NSIS_VERSION}_English.paf.exe
NSIS_INSTALLER=NSISPortable_${NSIS_VERSION}_English.paf.exe

# Downloads
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
