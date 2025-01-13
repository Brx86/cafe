#Requires AutoHotkey v2.0

; MK68 的 Ins 键映射为 F1 键
Ins::F1

; MK68 的 CapsLock 键映射为 ` 键
; VK码：https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
; SC码：https://aeb.win.tue.nl/linux/kbd/scancodes-1.html
CapsLock::VKC0

; 将 Win+Q 映射为 Ctrl+Win+Left
; #q::^#Left
!1::^#Left

; 将 Win+W 映射为 Ctrl+Win+Right
; #w::^#Right
!2::^#Right

; 蓝牙键盘的 Home 键映射为 F1
Browser_Home::F1
