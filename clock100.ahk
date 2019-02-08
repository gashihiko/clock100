SetFormat, FloatFast, 03.0

clockPointX = 0   ; X座標  
clockPointY = 0   ; Y座標  
clockColor = 00FF50  ; フォントカラー  
backColor = 00FF49  ; 透明にするための仮の背景色(文字の周りは残るので近い色にしている)
textSize  = 30   ; テキストサイズ  
updateTime = 50   ; タイマをポーリングする時間(msec)  

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
	;ウィンドウを動かせるようにしたりしなかったり(タイトルバーを表示/非表示)
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