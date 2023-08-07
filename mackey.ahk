
;; 最小化
!h::WinMinimize "A"
!m::WinMinimize "A"

;; 最大化
^!f::WinMaximize "A"

;; 行首/行末 Command(Alt)+Left/Right -> Home/End
<!Right::End
<!Left::Home

;; 任务切换 左右方向键
;; ahk_class XamlExplorerHostIslandWindow
;; ahk_exe explorer.exe
;; Left::
;; {
;;     if WinActive("ahk_class XamlExplorerHostIslandWindow")
;;       send "{Tab}"
;;     else
;;       send "{Left}"
;;     return
;; }


;; 退出 Command(Alt)+Q -> Alt+F4
<!q::<!F4


;; Command(Alt)+Z/X/C/V/A/F -> Ctrl+Z/X/C/V/A/F
<!z::^z ;; 撤销
<!x::^x ;; 剪切
<!c::^c ;; 复制
<!v::^v ;; 粘贴
<!a::^a ;; 全选
<!s::^s ;; 保存


;; 浏览器页面头部，尾部
;;<!Up::
;;{
;;    if WinActive("ahk_exe msedge.exe")
;;        send "{Home}"
;;    else
;;      send "^{Home}"
;;    return
;;}
;;<!Down::
;;{
;;    if WinActive("ahk_exe msedge.exe")
;;        send "{End}"
;;    else
;;      send "^{End}"
;;    return
;;}

;; 查找
<!f::
{
    if WinActive("ahk_exe wps.exe") or WinActive("ahk_exe dbeaver.exe") or WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe explorer.exe") or WinActive("ahk_exe ApiPost7.exe")
      send "^f"
    else
      send "!f"
    return
}

;; 关闭窗口（Tab）（Edge，文件管理器）
<!w::
{
    if WinActive("ahk_exe wps.exe") or WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe explorer.exe")
        send "^w"
    else if WinActive("ahk_exe DingTalk.exe")
        WinMinimize ;; 使用WinActive找到的窗口
    else if WinActive("ahk_exe WeChat.exe")
        send "{Esc}" ;; 使用WinActive找到的窗口
    else
        send "!w"
    return
}

;; 刷新
<!r::
{
    if WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe explorer.exe")
        send "^r"
    else if WinActive("ahk_exe DingTalk.exe")
        WinMinimize ;; 使用WinActive找到的窗口
    else
        send "!r"
    return
}

;; draw.io 加粗
<!b::
{
    if WinActive("ahk_exe draw.io.exe")
        send "^b"
    else
        send "!b"
    return
}

;;;;;;;;;;;;;; Termius
;; 复制
<!c::
{
    if WinActive("ahk_exe Termius.exe") ;; Termius复制
        send "^{Insert}"
    else
        send "^c"
    return
}
;; 清屏
<!k::
{
    if WinActive("ahk_exe Termius.exe") ;; Termius清屏
        send "^l"
    else
        send "!k"
    return
}
;; Up
<!u::
{
    if WinActive("ahk_exe Termius.exe") ;; Up
        send "{Up}"
    else
        send "!u"
    return
}
;; Down
<!d::
{
    if WinActive("ahk_exe Termius.exe") ;; Down
        send "{Down}"
    else
        send "!d"
    return
}
;;;;;;;;;;;;;; Termius

;; 粘贴【draw.io，Termius】
<!v::
{
    if WinActive("ahk_exe draw.io.exe") ;; draw.io 无格式粘贴
        send "^+v"
    else if WinActive("ahk_exe Termius.exe") ;; Termius 粘贴
        send "+{Insert}"
    else
        send "^v"
    return
}


;;;;;;;;;;;;;;;;;;;;;;;;; draw.io
;; 格式【draw.io】
<!+p::
{
    if WinActive("ahk_exe draw.io.exe") ;; draw.io 格式
        send "^+p"
    else
        send "!+p"
    return
}
<!+k::
{
    if WinActive("ahk_exe draw.io.exe") ;; draw.io 格式
        send "^+k"
    else
        send "!+k"
    return
}
;;;;;;;;;;;;;;;;;;;;;;;;; draw.io


;; 新建标签【Edge，文件资源管理器】
<!t::
{
    if WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe explorer.exe")
        send "^t"
    else
        send "!t"
    return
}

;; 光标定位地址栏【Edge，文件资源管理器】
<!l::
{
    if WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe explorer.exe")
        send "^l"
    else
        send "!l"
    return
}

; Alt + F1 激活 Termius
<!F1::
{
    if ( WinExist("ahk_exe Termius.exe") and WinActive("ahk_exe Termius.exe") ) {
      ;;ToolTip "Timed ToolTip`nThis will be displayed for 5 seconds."
      ;;SetTimer () => ToolTip(), -5000
      WinMinimize ; Use the window found by WinWait.
      ;;WinHide "ahk_exe Termius.exe"
    }
    else if WinExist("ahk_exe Termius.exe") {
      WinActivate ; Use the window found by WinExist.
    }
    
    if not WinExist("ahk_exe Termius.exe")
        run "C:\Users\kratzer\AppData\Local\Programs\Termius\Termius.exe"
    
    return
}

; Alt + F5 激活 Intellij IDEA
<!F4::
{
    if ( WinExist("ahk_exe idea64.exe") and WinActive("ahk_exe idea64.exe") ) {
      WinMinimize ; Use the window found by WinWait.
    }
    else if WinExist("ahk_exe idea64.exe") {
      WinActivate ; Use the window found by WinExist.
    }
    
    return
}
