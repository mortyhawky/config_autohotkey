; ------------------------------------------------
;   a:\win\ahk-scripts\current\4-Komorebi.ahk
; ------------------------------------------------
;Updated
#Requires AutoHotkey 2.0.23
#SingleInstance Force

CoordMode "ToolTip"
tipX := 15
tipY := 55
tipTime := 3000
showTip := true
sleep tipTime/3

ToolTip()
ToolTip "  ~   F4:  STARTED..:   " . A_ScriptName . "  ~  ", tipX, tipY
SetTimer () => ToolTip(), -TIPTIME


Retile()
{
  Komorebic("retile",               showTip := false)
  Komorebic("cycle-focus next",     showTip := false)
  Komorebic("cycle-focus previous", showTip := false)
  ToolTip()
  ToolTip "retile", tipX, tipY
  SetTimer(  ()=>ToolTip(),-tipTime  )
}

Komorebic(cmd, showTip := true)
{
  if(showTip) 
  {
    ToolTip()
    ToolTip cmd, tipX, TipY
    SetTimer(  ()=>ToolTip(),-tipTime  )
  }
  ;RunWait(format("komorebic.exe {}", cmd), , "Hide")
  RunWait(format("komorebic.exe {}", cmd), , "Hide" ) 
}

komoPID := ProcessExist("komorebi.exe")
if (komoPID)
{
  ToolTip()
  ToolTip "  ~  F4 Stopping:  Komorebi with PID/ID = " . komoPID . "  ~  ", tipX, tipY 
  SetTimer(  ()=>ToolTip(),-tipTime  )
  Run "komorebic.exe stop --bar",,"Hide"
  Sleep tipTime
  ExitApp
}
else
{
  ;CmdString := Format("komorebic.exe start {} {} {}", "--config", "C:\Users\morty\.config\komorebi\komorebi.json", "--bar")
  ;MsgBox "CmdString=" . CmdString
  ;ToolTip "CmdString=" . CmdString
  ;Sleep TipTime
  ;Run "A:\\win\\ahk-scripts\\current\\wrap-komorebi-start.ps1"
  ;Run "pwsh -c wrap-komorebi-start.ps1"
  ;Run "C:\scoop\apps\komorebi\current\komorebic.exe start --config C:\Users\morty\.config\komorebi\komorebi.json --bar"
  ;Run '"C:\scoop\apps\komorebi\current\komorebic.exe" start --config "C:\Users\morty\.config\komorebi\komorebi.json" --bar'
  ;Run 'pwsh -NoProfile -Command "komorebic start --config ''C:\Users\morty\.config\komorebi\komorebi.json'' --bar"'
  Run "pwsh -Command komorebic start --bar",,"Hide"

  ToolTip()
  ToolTip "  ~   F4 Starting:  komorebi...  Waiting for komorebi-bar.exe...  ~  ", tipX, tipY
  ;SetTimer(  ()=>ToolTip(),-(tipTime*2)  )
  WinWait("ahk_exe komorebi-bar.exe",,10)
  komoPID := ProcessExist("komorebi.exe")
  barPID := ProcessExist("komorebi-bar.exe")

  if (!komoPID) 
  {
    MsgBox "ERROR! komoPID=" . komoPID
    ExitApp
  }

  ;ToolTip()
  ToolTip "  ~  komorebi.exe komoPID/ID = " . komoPID .  " komorebi-bar.exe PID/ID = " . barPID . "  ~  ", tipX, tipY+20
  ;SetTimer(  ()=>ToolTip(),-tipTime  )
  Sleep tipTime
  Retile()
}

#+Enter:: Komorebic("promote")

; Navigate
#j::      Komorebic("cycle-focus next")
#k::      Komorebic("cycle-focus previous")

; Resize
#l::      Komorebic("resize-axis horizontal increase")
#h::      Komorebic("resize-axis horizontal decrease")
#Right::  Komorebic("resize-axis horizontal increase")
#Left::   Komorebic("resize-axis horizontal decrease")

; go to workspace
#1::      Komorebic("focus-workspace 0")
#2::      Komorebic("focus-workspace 1")
#3::      Komorebic("focus-workspace 2")

; move to workspace
#+1::     Komorebic("move-to-workspace 0") 
#+2::     Komorebic("move-to-workspace 1") 
#+3::     Komorebic("move-to-workspace 2") 
#+4::     Komorebic("move-to-workspace 3") 

; Resize
#+l::     Komorebic("resize-axis horizontal increase")
#+h::     Komorebic("resize-axis horizontal decrease")
#+j::     Komorebic("resize-axis vertical increase")
#+k::     Komorebic("resize-axis vertical decrease")

#m::      Komorebic("toggle-monocle")
+#m::      Komorebic("toggle-maximize")
#t::      Komorebic("toggle-monocle")
#r::      Retile
