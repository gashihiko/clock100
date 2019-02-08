SetFormat, FloatFast, 03.0

clockPointX = 0
clockPointY = 0
clockColor = 00FF50
backColor = 00FF49  ;dummy color to make transparent background (but it is left around text, so the number is near the clockColor)
textSize  = 30
updateTime = 50   ;clock update frequency (msec)

Gui, Color, %backColor%  
Gui, Font, S%textSize%, Unispace
Gui, Font, C%clockColor%  
Gui, Add, Text, vMyText C%clockColor%, HH:MMM:SSS:
Gui, +AlwaysOnTop +LastFound +0x00C00000 +ToolWindow  
WinSet, TransColor, %backColor% 255
Gui, Show, X%clockPointX% Y%clockPointY%  

SetTimer, Update, %updateTime%
Gosub, Update
Return
  
Update:
	NowSec := A_Hour * 3600 + A_Min * 60 + A_Sec
	h := NowSec // 864
	m := (NowSec - h * 864) // 8.64
	s := (NowSec - h * 864 - m * 8.64 + A_MSec * 0.001) // 0.0864
	GuiControl,, MyText, %h%:%m%:%s%
	Return

~^t::
	;show or hide title bar (in order to exit the app or move the window)
	If (flag == ""){
	Gui, -0x00C00000
	flag = 1
	}
	Else If(flag == 1){
	Gui, +0x00C00000
	flag = 
	}
	Return

GuiClose:
	ExitApp