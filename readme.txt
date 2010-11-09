Textadept Portable is a launcher for Textadept.

It includes the necessary GTK+ libraries and can be run from a portable USB
drive without installing anything.
The .textadept directory is placed in TextadeptPortable\Data.

See below for the necessary steps for building Textadept Portable.
See http://www.portableapps.com and
http://portableapps.com/development/portableapps.com_format for an
explanation of the format.

To simplify building the following two scripts create a build environment
for Textadept Portable and compile the launcher:

Run on Linux/Unix (or download the files from the web and unzip Textadept):
downloads.sh

Then run on Windows:
build.bat

Finally a zip can be created (Linux shell script):
pack.sh

NSIS
====
Download NSIS Portable:
http://portableapps.com/apps/development/nsis_portable

Current version:
http://downloads.sourceforge.net/portableapps/NSISPortable_2.46_English.paf.exe

Directory Structure
===================
Create directory structure:
AppNamePortable
+ App
  + AppInfo
  + AppName
  + DefaultData
+ Data
+ Other
  + Help
    + Images
  + Source

GTK
===
Download GTK-Installer.
http://gtk-win.sourceforge.net/home/index.php/en/Downloads

Current version:
http://downloads.sourceforge.net/gtk-win/gtk2-runtime-2.22.0-2010-10-01-ash.exe

Install to App\GTK
See also: http://gtk-win.sourceforge.net/home/index.php/Embedding

gtk2-runtime-gtk2-runtime-2.22.0-2010-10-01-ash /S /sideeffects=no /D=%CD%\TextadeptPortable\App\GTK

Textadept
=========
Download Textadept:
http://code.google.com/p/textadept/

Current version:
http://textadept.googlecode.com/files/textadept_3.4.win32.zip

Unzip to App\Textadept

Textadept Portable
==================
The source code for the Portable Launcher is to be placed in
TextadeptPortable\Data\Other\Source
Copy icons and rename them to TextadeptPortable\App\AppInfo (see build.bat).

Build launcher
==============
Run makensis on TextadeptPortable\Other\Source\TextadeptPortable.nsi
