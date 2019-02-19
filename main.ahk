#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Array := []

^!r::
Reload
Return

^1::
clipboard =
Send ^c
ClipWait
clp1 = %clipboard%
return

^2::
clipboard =
Send ^c
ClipWait
clp2 = %clipboard%
return

^3::
clipboard =
Send ^c
ClipWait
clp3 = %clipboard%
return

!3::
clipboard = %clp3%
Send ^v
return

!2::
clipboard = %clp2%
Send ^v
return

!1::
clipboard = %clp1%
Send ^v
return

^4::
clipboard =
Send ^c
ClipWait
Array.Push(clipboard)
return

!4::
clpmerge := ""
for index, element in Array
{
clpmerge = %clpmerge% %element%
}
Array := []
clipboard = %clpmerge%
send ^v
return





#IfWinActive, ahk_class QQBrowser_WidgetWin_1
#f::
  Click right
  sleep 200
  Send s
  clipboard =
  send ^c
  ClipWait
  Array.Push(clipboard)
  sleep 1000
  Send {Down}
return

#v::
  Send %clipboard%
return

#IfWinActive, ahk_class AcrobatSDIWindow
evenPage = 1
#p::
  send ^p
  WinWaitActive, ahk_class #32770
  if ErrorLevel
  {
    MsgBox, WinWait timed out.
    return
  }
  else
  {
    send {Tab}
    sleep 50
    send {Tab}
    sleep 50
    send {Tab}
    sleep 50
    send {Tab}
    sleep 50
    send {Tab}
    sleep 50
  }
  return
#q::
  Click right
  sleep 200
  Send x
  WinWaitActive, 提取页面
  if ErrorLevel
  {
    MsgBox, WinWait timed out.
    return
  }
  else
  {
    Send !D
    sleep 200
    Send {Enter}
    WinWaitActive, Adobe Acrobat
    if ErrorLevel
    {
      MsgBox, WinWait timed out.
      return
    }
    else
    {
      send {Enter}
      WinWaitActive, ahk_class AcrobatSDIWindow
      if ErrorLevel
      {
        MsgBox, WinWait timed out.
        return
      }
      else
      {
        Send ^s
        WinWaitActive, 另存为
        if ErrorLevel
        {
          MsgBox, WinWait timed out.
          return
        }
        else{
          send !n
          sleep 200
          send article
        }
      }

    }
  }
return

#IfWinActive, ahk_exe EXCEL.EXE
#e::
  clipboard =
  Send ^c
  ClipWait
  send ^n
  sleep 1000
  send ^v
  sleep 1000
  send ^s
  return 

#IfWinActive, ahk_exe aegisub32.exe
#v::
  MouseGetPos, mousePrevX, MousePrevY
  ImageSearch, FoundX, FoundY, 424, 80, 1928, 386, c:\playbutton.bmp
  FoundX := FoundX +2
  FoundY := FoundY +2
  click %FoundX% %FoundY%
  MouseMove, mousePrevX, MousePrevY
  return

#IfWinActive, ahk_class AVL_AVWindow
^a::
  ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, C:\Users\kyk\Desktop\codePG\pgSelect.bmp
  FoundX := FoundX +2
  FoundY := FoundY +2
  click %FoundX% %FoundY%
  WinWait ahk_class #32770
  if ErrorLevel
  {
    MsgBox, WinWait time out.
    return 
  }
  else
    send !p
    send {tab}
    send 1
    send {enter}
  WinWait ahk_class AVL_AVWindow
    send {down}
    return

#IfWinActive, ahk_class Net UI Tool Window
^f::
  MouseGetPos, mousePrevX, MousePrevY
  ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, c:\searchFilter.bmp
  FoundX := FoundX -50
  FoundY := FoundY +2
  click %FoundX% %FoundY%
  MouseMove, mousePrevX, MousePrevY
  return

;copy bibtex and use python to convert it into excel line
#IfWinActive, ahk_class MozillaWindowClass
#c::
  send ^a
  clipboard =
  Send ^c
  ClipWait
  WinActivate, ahk_class QQBrowser_WidgetWin_1
    sleep 100
    send ^{enter}
    sleep 100
    WinActivate, ahk_class XLMAIN
    return
#IfWinActive

