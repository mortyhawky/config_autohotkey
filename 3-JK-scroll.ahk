;------------------------------------------------
; --  3-JK-Scroll.ahk
;------------------------------------------------
; Updated Win11 2026-04-24 12:47 Fri
#Requires AutoHotkey 2.0.22
#SingleInstance Force

TIPTIME := 3000
CLICKS := 1

ToolTip()
ToolTip "  ~  " . " F3 STARTED..:   " . "3-JK-Scroll.ahk" . "  ~  "
SetTimer () => ToolTip(), -TIPTIME

#HotIf WinActive("pwsh") and WinActive("ahk_exe alacritty.exe")
^j::
{
  ToolTip()
  ToolTip("<c-j>  alacritty pwsh Scroll Down")
  SetTimer () => ToolTip(), -TIPTIME
  Click "WheelDown", CLICKS
}

^k::
{
  ToolTip()
  ToolTip("<c-k>  alacritty pwsh Scroll Up")
  SetTimer () => ToolTip(), -TIPTIME
  Click "WheelUp", CLICKS
}
#HotIf


#HotIf WinActive("pwsh") and WinActive("ahk_exe wezterm-gui.exe")
^j::
{
  ToolTip()
  ToolTip("<c-j>  wezterm Scroll Down")
  SetTimer () => ToolTip(), -TIPTIME

  Loop CLICKS+1
    Send "^{Down}"
}

^k::
{
  ToolTip()
  ToolTip("<c-k>  wezterm Scroll Up")
  SetTimer () => ToolTip(), -TIPTIME

  Loop CLICKS+1
    Send "^{Up}"

}
#HotIf


#HotIf WinActive("MINGW64")
^j::
{
  ToolTip()
  ToolTip("<c-j>  MINGW64 Scroll Down")
  SetTimer () => ToolTip(), -TIPTIME

  Loop CLICKS+1
    Send "^{Down}"
}

^k::
{
  ToolTip()
  ToolTip("<c-k>  MINGW64 Scroll Up")
  SetTimer () => ToolTip(), -TIPTIME

  Loop CLICKS+1
    Send "^{Up}"

}
#HotIf
