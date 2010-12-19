Textadept Portable
==================

A launcher for the Textadept editor.

Textadept Portable can run from a portable USB
drive without installing anything. The current version of Textadept needs to
be downloaded from <http://code.google.com/p/textadept/downloads/list> and
be unpacked and renamed to TextadeptPortable\App\Textadept
The .textadept directory is placed in TextadeptPortable\Data.

Download
========
<https://github.com/rgieseke/textadept-portable/downloads>

Building the launcher yourself
==============================

See below for the necessary steps for building the Textadept Portable launcher.
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
TextadeptPortable
+ App
  + AppInfo
  + AppName
  + DefaultData
+ Data
+ Other
  + Help
    + Images
  + Source

Textadept Portable
==================
The source code for the Portable Launcher is in
TextadeptPortable\Data\Other\Source
Copy icons and rename them to TextadeptPortable\App\AppInfo (see build.bat).

Build launcher
==============
Run makensis on TextadeptPortable\Other\Source\TextadeptPortable.nsi
