#Requires AutoHotkey v2.0
#SingleInstance Force

move := 10 ; pixels to move per press

; Ctrl + Win + Arrows → move mouse movepx in each direction
^#Up::    MouseMove(0, -move, 0, "R")
^#Down::  MouseMove(0,  move, 0, "R")
^#Left::  MouseMove(-move, 0, 0, "R")
^#Right:: MouseMove( move, 0, 0, "R")

