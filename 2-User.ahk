; ------------------------------------------------
;   a:\win\ahk-scripts\current\2-User.ahk
; ------------------------------------------------
; Updated Win11 2026-04-24 12:45 Fri
#Requires AutoHotkey 2.0.23
#SingleInstance Force

BROWSER  := "Firefox"     ; #W
TERMINAL := "Alacritty"   ; #Enter
QUIT     := "!{F4}"       ; #Q

CoordMode "ToolTip"
tipX := 15
tipY := 55
tipTime := 3000
showTip := true
sleep tipTime/3

ToolTip()
ToolTip "  ~  " . " F2 STARTED..:   " . "2-User.ahk" . "  ~  ", tipX, tipY
SetTimer () => ToolTip(), -TIPTIME


; Launch apps:
 #Enter::  
{
  cmd := 'alacritty --title "Alacritty Pwsh 7"'
  Run cmd
  ;Sleep 300
  ;Komorebic("promote", showTip := false)
  RunWait "komorebic.exe promote"
  ToolTip()
  ToolTip cmd, tipX, tipY
  SetTimer(  ()=>ToolTip(),-tipTime  )

  ; PID := ProcessExist(PIDOrName)
  if (PID := ProcessExist("komorebi.exe") )
  {
    ;MsgBox "komorebi ACTIVE with process ID " PID "."
  }
  else
  {
    ;MsgBox "komorebi NOT running"
    HWND := WinWait("ahk_class Alacritty Pwsh 7",,5)
    ;MsgBox "HWND=" . HWND
    Sleep 500
    WinActivate HWND
  }

 }

 #f::      Run   "vifm"

 #w::
{
  ;cmd := 'firefox'
  RunWait BROWSER
  Sleep 500
  RunWait "komorebic.exe promote"
  ToolTip()
  ToolTip "Win + w " . BROWSER, tipX, tipY
  SetTimer(  ()=>ToolTip(),-tipTime  )
 }
 
 #q:: 
 {
  cmd := "!{F4}"
  Send   cmd
  RunWait "komorebic.exe retile"

  ToolTip()
  ToolTip "Win + q " . cmd, tipX, tipY
  SetTimer(  ()=>ToolTip(),-tipTime  )
 }

+#q::      Send  "!{F4}"
