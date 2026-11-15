#Requires AutoHotkey v2.0
#SingleInstance Force

DetectHiddenWindows(true)


; ===== 键盘映射 =====

; MK68 的 CapsLock 映射为 `
CapsLock::VKC0

; Alt+1 / Alt+2 切换虚拟桌面
!1::^#Left
!2::^#Right


; ===== 虚拟桌面管理 =====
; 依赖 https://github.com/Ciantic/VirtualDesktopAccessor
class VirtualDesktopManager {
    static hVDA := 0
    static pGetDesktop := 0
    static pMoveWindow := 0

    static __New() {
        vdaPath := A_ScriptDir "\VirtualDesktopAccessor.dll"

        if !FileExist(vdaPath)
            throw Error("未找到 VirtualDesktopAccessor.dll")

        this.hVDA := DllCall(
            "LoadLibrary", "Str", vdaPath, "Ptr"
        )

        if !this.hVDA
            throw Error("无法加载 VirtualDesktopAccessor.dll")

        this.pGetDesktop := DllCall(
            "GetProcAddress", "Ptr", this.hVDA,
            "AStr", "GetCurrentDesktopNumber", "Ptr"
        )

        this.pMoveWindow := DllCall(
            "GetProcAddress", "Ptr", this.hVDA,
            "AStr", "MoveWindowToDesktopNumber", "Ptr"
        )

        if !this.pGetDesktop || !this.pMoveWindow
            throw Error("DLL 缺少必要的函数")
    }

    static MoveToCurrent(hwnd) {
        desktop := DllCall(this.pGetDesktop, "Int")

        if desktop < 0
            return false

        return DllCall(
            this.pMoveWindow,
            "Ptr", hwnd,
            "Int", desktop,
            "Int"
        ) != -1
    }
}


; ===== 下拉窗口管理 =====

class DropdownWindowManager {
    static previousWindows := Map()

    static Toggle(selector, launchCmd := "") {
        hwnd := WinExist(selector)

        ; 不存在则启动
        if !hwnd {
            if launchCmd != ""
                Run(launchCmd)
            return
        }

        ; 隐藏并恢复之前的焦点
        if WinActive("ahk_id " hwnd) {
            WinHide("ahk_id " hwnd)

            if this.previousWindows.Has(hwnd) {
                prev := this.previousWindows.Delete(hwnd)

                if prev && WinExist("ahk_id " prev)
                    WinActivate("ahk_id " prev)
            }
            return
        }

        ; 记录当前活动窗口
        prev := WinGetID("A")

        ; 显示并恢复窗口
        WinShow("ahk_id " hwnd)
        WinRestore("ahk_id " hwnd)

        ; 移动到当前虚拟桌面
        if !VirtualDesktopManager.MoveToCurrent(hwnd) {
            WinHide("ahk_id " hwnd)
            MsgBox("无法将窗口移动到当前虚拟桌面。")
            return
        }

        ; 保存焦点记录
        this.previousWindows[hwnd] := prev

        ; 激活窗口
        WinActivate("ahk_id " hwnd)
    }
}


; ===== 快捷启动 =====

sshYardPath := EnvGet("LocalAppData") . "\Programs\SSHYard\SSHYard.exe"

Ins::DropdownWindowManager.Toggle(
    "ahk_exe SSHYard.exe",
    sshYardPath
)
