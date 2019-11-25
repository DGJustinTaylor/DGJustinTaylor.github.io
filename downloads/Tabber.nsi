  !include "MUI2.nsh"

  !define /date TIMESTAMP "%Y%m%d-%H%M%S"

  Name "AGY Tabber Application"
  OutFile "Tabber-net472-${TIMESTAMP}.exe"

  InstallDir "$PROGRAMFILES\AGY\Tabber"

  InstallDirRegKey HKLM "Software\AGY\Tabber" "InstallDir"

  RequestExecutionLevel admin

  !define MUI_ABORTWARNING

  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES

  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

  !insertmacro MUI_LANGUAGE "English"

Section "Tabber" SecEndFinding

  SetShellVarContext all

  SetOutPath "$INSTDIR"

  File "Tabber\bin\Release\*.exe"
  File "Tabber\bin\Release\*.config"
  File "Tabber\bin\Release\*.version"

  WriteUninstaller "$INSTDIR\Uninstall.exe"

  CreateShortcut "$SMPROGRAMS\AGY Tabber Application.lnk" "$INSTDIR\Tabber.exe" "" "$INSTDIR\Tabber.exe" 0
  CreateShortcut "$SMSTARTUP\AGY Tabber Application.lnk" "$INSTDIR\Tabber.exe" "" "$INSTDIR\Tabber.exe" 0
  CreateShortcut "$DESKTOP\AGY Tabber Application.lnk" "$INSTDIR\Tabber.exe" "" "$INSTDIR\Tabber.exe" 0

  WriteRegStr HKLM "Software\AGY\Tabber" "InstallDir" $INSTDIR

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\AGYTabber" "DisplayName" "AGY Tabber Application"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\AGYTabber" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\AGYTabber" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\AGYTabber" "NoRepair" 1

SectionEnd

Section "Uninstall"

  SetShellVarContext all

  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\AGYTabber"

  DeleteRegKey HKLM "Software\AGY\AGYTabber"

  Delete "$DESKTOP\AGY Tabber Application.lnk"
  Delete "$SMSTARTUP\AGY Tabber Application.lnk"
  Delete "$SMPROGRAMS\AGY Tabber Application.lnk"

  Delete "$INSTDIR\*.version"
  Delete "$INSTDIR\*.config"
  Delete "$INSTDIR\*.dll"
  Delete "$INSTDIR\*.exe"

  RMDir "$INSTDIR"

SectionEnd