; ------------------------------------------------
;   a:\win\ahk-scripts\current\1-Main.ahk
; ------------------------------------------------
#Requires AutoHotkey 2
#SingleInstance Force

CoordMode "ToolTip"
tipX := 15
tipY := 55
tipTime := 3000
showTip := true
Sleep tipTime/5

ToolTip()
ToolTip "  ~   F1:  STARTED..:   " . A_ScriptName . "  ~  ", tipX, tipY
SetTimer () => ToolTip(), -TIPTIME

xdgConfigHome := EnvGet("XDG_CONFIG_HOME")
;MsgBox "xdgConfigHome=" . xdgConfigHome
;MsgBox "A_AppData=" . A_AppData

F1::  Script1Main()
F2::  Script2User()
;F3:: Script3JK_Scroll()
F4::  Script4Komorebi()

#F1:: Edit_Script1()

Script1Main()       ; F1
{
  reload
}

Script2User()       ; F2
{
  Run("AutoHotkey.exe /restart /script 2-User.ahk", A_ScriptDir)
}


;Script3JK_Scroll() ; F3
;{
;  Run("AutoHotkey /restart /script 3-JK-Scroll.ahk", A_ScriptDir)
;}

Script4Komorebi()   ; F4
{
  Run("AutoHotkey /restart /script 4-komorebi.ahk", A_ScriptDir)
}

Edit_Script1()
{
  Run "alacritty -e nvim.exe "
  ;HWND := WinWait(WinTitle, WinText, Timeout, ExcludeTitle, ExcludeText)
  HWND := WinWait("nvim.exe")
  WinActivate HWND
  ToolTip "HWND=" . HWND, tipX, tipY
}
