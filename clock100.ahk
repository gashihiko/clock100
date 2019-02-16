SetFormat, FloatFast, 02.0
CoordMode, Mouse, Screen

clockPointX = 0
clockPointY = 0
clockColor = 00FF50
backColor = 00FF49  ;dummy color to make transparent background (but it is left around text, so the number is near the clockColor)
textSize  = 30
updateTime = 50   ;clock update periodicity (msec)

Gui, Color, %backColor%  
Gui, Font, S%textSize%, Unispace
Gui, Add, Text, vMyText C%clockColor%, HH:MM:SS
Gui, +AlwaysOnTop +LastFound +0x00C00000 +ToolWindow
WinSet, TransColor, %backColor% 255
Gui, Show, X%clockPointX% Y%clockPointY%  

SetTimer, Update, %updateTime%
Gosub, Update
Return
  
Update:
	NowSec := A_Hour * 3600 + A_Min * 60 + A_Sec + A_MSec * 0.001
	h := NowSec // 864.0
	m := (NowSec - h * 864) // 8.64
	s := (NowSec - h * 864 - m * 8.64) // 0.0864
	GuiControl,, MyText, %h%:%m%:%s%
	Return

^1::
	flag := !flag
	If (flag) {
	Gui, -0x00C00000
	}
	Else {
	Gui, +0x00C00000
	}
	Return

GuiClose:
	ExitApp
