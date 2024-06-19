;; 重映射按键 (键盘, 鼠标和控制器) https://wyagd001.github.io/v2/docs/misc/Remap.htm

;; 掩饰键 https://wyagd001.github.io/v2/docs/lib/A_MenuMaskKey.htm
A_MenuMaskKey := "vkE8"  ; 将掩码键改成未分配的按键, 如 vkE8 等.

;; 最小化
!h::WinMinimize "A"
!m::WinMinimize "A"

;; 最大化
;; ^!f::WinMaximize "A"

;;^!q::<#l


;; 行首/行末 Command(Alt)+Left/Right -> Home/End
<!Right::End
<!Left::Home

; Win + ESC 激活 uTools
<!Esc::<!Space
;{
;   SendEvent "<!Space"
;}

<!Down::
{
    if WinActive("ahk_exe idea64.exe")
        SendEvent "!{Down}"
    else
        SendEvent "^{End}"
    return
}
<!Up::
{
    if WinActive("ahk_exe idea64.exe")
        SendEvent "!{Up}"
    else
        SendEvent "^{Home}"
    return
}


;; 退出 Command(Alt)+Q -> Alt+F4
<!q::<!F4


;; Command(Alt)+Z/X/C/V/A/F -> Ctrl+Z/X/C/V/A/F
;; 撤销
<!z::
{
	SendEvent "^z"
}
;; 复制
<!c::
{
    SendEvent "^c"
}
;; 全选
<!a::
{
    SendEvent "^a"
}
;; 保存
<!s::
{
    SendEvent "^s"
}
;; 剪切
<!x::
{
    SendEvent "^x"
}


;; 查找
<!f::
{
    if WinActive("ahk_exe wps.exe") or WinActive("ahk_exe dbeaver.exe") or WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe") or WinActive("ahk_exe ApiPost7.exe") or WinActive("ahk_exe Postman.exe") or WinActive("ahk_exe Code.exe") or WinActive("ahk_exe Notepad.exe") or WinActive("ahk_exe chrome.exe")
      SendEvent "^f"
    else
      SendEvent "!f"
    return
}

;; 关闭窗口（Tab）（Edge，文件管理器，Visual Studio Code）
<!w::
{
    if WinActive("ahk_exe wps.exe") or WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe") or WinActive("ahk_exe Code.exe") or WinActive("ahk_exe Notepad.exe") or WinActive("ahk_exe chrome.exe")
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
    if WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe") or WinActive("ahk_exe chrome.exe")
        send "^r"
    else if WinActive("ahk_exe DingTalk.exe")
        WinMinimize ;; 使用WinActive找到的窗口
    else
        send "!r"
    return
}

;; draw.io 加粗，WPS加粗
<!b::
{
    if WinActive("ahk_exe draw.io.exe") or WinActive("ahk_exe wps.exe")
        send "^b"
    else
        send "!b"
    return
}


;;;;;;;;;;;;;; Termius
;; 复制
;; <!c::
;; {
;;     if WinActive("ahk_exe Termius.exe") ;; Termius复制
;;         send "^{Insert}"
;;     else
;;         ;;send "^c"
;;         SendEvent "^c"
;;     return
;; }
;; 清屏
<!k::
{
    if WinActive("ahk_exe Termius.exe") ;; Termius清屏
        send "^l"
    else
        send "!k"
    return
}
;;;;;;;;;;;;;; Termius

;; 粘贴【draw.io，Termius】
<!v::
{
    if WinActive("ahk_exe draw.io.exe") ;; draw.io 无格式粘贴
        send "^+v"
    else if WinActive("ahk_exe Termius.exe") or WinActive("ahk_exe Tabby.exe") ;; Termius，Tabby 粘贴
        send "+{Insert}"
    else
        SendEvent "^v"
    return
}

;; WPS只粘贴文本
<!+v::
{
    if WinActive("ahk_exe wps.exe") ;; WPS只粘贴文本
        send "!^t"
    else
        send "!+v"
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
    if WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe") or WinActive("ahk_exe chrome.exe")
        send "^t"
    else
        send "!t"
    return
}

;; 光标定位地址栏【Edge，文件资源管理器】
<!l::
{
    if WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe") or WinActive("ahk_exe chrome.exe")
        send "^l"
    else
        send "!l"
    return
}

; Alt + F4 激活 Intellij IDEA
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

; Win + B 激活 Brave
<#b::
{
    if ( WinExist("ahk_exe brave.exe") and WinActive("ahk_exe brave.exe") ) {
      WinMinimize ; Use the window found by WinWait.
    }
    else if WinExist("ahk_exe brave.exe") {
      WinActivate ; Use the window found by WinExist.
    }
    if not WinExist("ahk_exe brave.exe")
        run "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
    
    return
}
; Alt + F3 激活 Microsoft Edge
<!F3::
{
    if ( WinExist("ahk_exe msedge.exe") and WinActive("ahk_exe msedge.exe") ) {
      WinMinimize ; Use the window found by WinWait.
    }
    else if WinExist("ahk_exe msedge.exe") {
      WinActivate ; Use the window found by WinExist.
    }
    if not WinExist("ahk_exe msedge.exe")
        run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
    return
}

; Alt + F1 激活 Tabby
<!F1::
{
    ;if ( WinExist("ahk_exe Termius.exe") and WinActive("ahk_exe Termius.exe") ) {
    if ( WinExist("ahk_exe Tabby.exe") and WinActive("ahk_exe Tabby.exe") ) {
      WinMinimize ; Use the window found by WinWait.
    }
    else if WinExist("ahk_exe Tabby.exe") {
      WinActivate ; Use the window found by WinExist.
    }
    
    if not WinExist("ahk_exe Tabby.exe")
        ;run "C:\Users\kratzer\AppData\Local\Programs\Termius\Termius.exe"
        run "C:\Program Files\Tabby\Tabby.exe"
    
    return
}

; Win + T 激活 Tabby
<#t::
{
    if ( WinExist("ahk_exe Tabby.exe") and WinActive("ahk_exe Tabby.exe") ) {
      WinMinimize ; Use the window found by WinWait.
    }
    else if WinExist("ahk_exe Tabby.exe") {
      WinActivate ; Use the window found by WinExist.
    }
    if not WinExist("ahk_exe Tabby.exe")
        run "C:\Program Files\Tabby\Tabby.exe"
    
    return
}
