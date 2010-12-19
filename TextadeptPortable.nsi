; Textadept Portable - a launcher for the Textadept editor
; 2010 Robert Gieseke robert.gieseke@gmail.com
; Based on Portable App launchers
; Copyright (C) 2004-2010 John T. Haller

;This program is free software; you can redistribute it and/or
;modify it under the terms of the GNU General Public License
;as published by the Free Software Foundation; either version 2
;of the License, or (at your option) any later version.

;This program is distributed in the hope that it will be useful,
;but WITHOUT ANY WARRANTY; without even the implied warranty of
;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;GNU General Public License for more details.

;You should have received a copy of the GNU General Public License
;along with this program; if not, write to the Free Software
;Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

!define LAUNCHERNAME "TextadeptPortable"
!define PORTABLEAPPNAME "Textadept Portable"
!define APPNAME "Textadept"
!define VER "1.0.0.0"
!define DEFAULTEXE "textadept.exe"
!define DEFAULTAPPDIR "Textadept"

; Program details
Name "${PORTABLEAPPNAME}"
OutFile "..\..\${LAUNCHERNAME}.exe"
Icon "..\..\App\AppInfo\appicon.ico"
VIProductVersion "${VER}"
VIAddVersionKey ProductName "${PORTABLEAPPNAME}"
VIAddVersionKey FileDescription "${PORTABLEAPPNAME}"
VIAddVersionKey FileVersion "${VER}"
VIAddVersionKey ProductVersion "${VER}"
VIAddVersionKey InternalName "${PORTABLEAPPNAME}"
VIAddVersionKey OriginalFilename "${LAUNCHERNAME}.exe"

; Runtime switches
CRCCheck on
WindowIcon off
SilentInstall silent
AutoCloseWindow true
RequestExecutionLevel user
XPStyle on

; Compression options
SetCompress Auto
SetCompressor /SOLID lzma
SetCompressorDictSize 32
SetDatablockOptimize On

; Includes (standard NSIS)
!include WinVer.nsh
!include FileFunc.nsh
!insertmacro GetParameters

Var PARAMETERS
Var PROGRAMDIRECTORY
Var EXECSTRING
Var EXISTSFILECHOOSER
Var EXISTSXBEL
Var USERPROFILE

Section "Main"
  ReadEnvStr $USERPROFILE "USERPROFILE"
	IfFileExists "$USERPROFILE\.recently-used.xbel" 0 +2
	  StrCpy $EXISTSXBEL "true"
  IfFileExists "$APPDATA\gtk-2.0\gtkfilechooser.ini" 0 +2
	  StrCpy $EXISTSFILECHOOSER "true"

  ; Get command line parameters
  ${GetParameters} $PARAMETERS
  ; Launch Textadept
  StrCpy $PROGRAMDIRECTORY "$EXEDIR\App\${DEFAULTAPPDIR}"
  StrCpy "$EXECSTRING" "$PROGRAMDIRECTORY\${DEFAULTEXE} -u $\"$EXEDIR\Data\.textadept$\""
  IfFileExists "$PROGRAMDIRECTORY\${DEFAULTEXE}" +2 0
    messageBox MB_OK "Error: textadept.exe not found. Textadept needs to be downloaded from http://code.google.com/p/textadept/ and unpacked into 'TextadeptPortable\App\Textadept'."
  ${If} $PARAMETERS != ""
    StrCpy "$EXECSTRING" "$EXECSTRING $PARAMETERS"
  ${EndIf}
  ExecWait $EXECSTRING

  StrCmp $EXISTSXBEL "true" +2
    Delete "$USERPROFILE\.recently-used.xbel"
  StrCmp $EXISTSFILECHOOSER "true" +3
    Delete "$APPDATA\gtk-2.0\gtkfilechooser.ini"
    RmDir "$APPDATA\gtk-2.0\"
SectionEnd
