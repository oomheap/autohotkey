;; 重映射按键 (键盘, 鼠标和控制器) https://wyagd001.github.io/v2/docs/misc/Remap.htm

;; Alt键 物理上松开，逻辑上没有松开
;; https://www.autohotkey.com/boards/viewtopic.php?t=111295
;; https://meta.appinn.net/t/topic/38683

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

; Win + F 激活 uTools
#f::!Space


;; Alt + Esc 在切换窗口中生效，其他情况不生效
#HotIf WinActive("ahk_class XamlExplorerHostIslandWindow")
!Esc::!Esc
#HotIf
#HotIf not WinActive("ahk_class XamlExplorerHostIslandWindow")
!Esc::return
#HotIf


;; uTools中 上 下 复制
#HotIf WinActive("ahk_exe uTools.exe")
!p::^p  ; Alt + P ==> Ctrl + P
!j::Down  ; Alt + P ==> Ctrl + P
!k::Up  ; Alt + P ==> Ctrl + P
#HotIf  ; 这里让后续的重映射和热键对所有窗口生效.


#HotIf not WinActive("ahk_exe idea64.exe")
<!Down::^End
<!Up::^Home
#HotIf

;; <!Down::
;; {
;;     if WinActive("ahk_exe idea64.exe")
;;         SendEvent "!{Down}"
;;     else
;;         SendEvent "^{End}"
;;     return
;; }
;; <!Up::
;; {
;;     if WinActive("ahk_exe idea64.exe")
;;         SendEvent "!{Up}"
;;     else
;;         SendEvent "^{Home}"
;;     return
;; }


#HotIf WinActive("ahk_exe msedge.exe")
!+T::^+T
#HotIf


;; 退出 Command(Alt)+Q -> Alt+F4
<!q::<!F4


;; Command(Alt)+Z/X/C/V/A/F -> Ctrl+Z/X/C/V/A/F
;; 撤销
<!z::
{
	SendEvent "^z"
}
;; 复制
;; <!c::
;; {
;;     SendEvent "^c"
;; }
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
    if WinActive("ahk_exe wps.exe") or WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe") or WinActive("ahk_exe Code.exe") or WinActive("ahk_exe Notepad.exe") or WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe WeChatAppEx.exe")
        SendEvent "^w"
    else if WinActive("ahk_exe DingTalk.exe")
        WinMinimize ;; 使用WinActive找到的窗口
    else if WinActive("ahk_exe WeChat.exe")
        SendEvent "{Esc}" ;; 使用WinActive找到的窗口
    else
        SendEvent "!w"
    return
}

;; 刷新
<!r::
{
    if WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe") or WinActive("ahk_exe chrome.exe")
        SendEvent "^r"
    else if WinActive("ahk_exe DingTalk.exe")
        WinMinimize ;; 使用WinActive找到的窗口
    else
        SendEvent "!r"
    return
}

;; draw.io 加粗，WPS加粗
<!b::
{
    if WinActive("ahk_exe draw.io.exe") or WinActive("ahk_exe wps.exe")
        SendEvent "^b"
    else
        SendEvent "!b"
    return
}


;;;;;;;;;;;;;; Termius
;; 复制
<!c::
{
    if WinActive("ahk_exe Termius.exe") or WinActive("ahk_exe mintty.exe") ;; Termius复制
        SendEvent "^{Insert}"
    else
        SendEvent "^c"
    return
}

<!k::
{
    if WinActive("ahk_exe Termius.exe") ;; Termius清屏
        SendEvent "^l"
    else
        SendEvent "!k"
    return
}
;;;;;;;;;;;; Termius

;; 粘贴【draw.io，Termius】
<!v::
{
    if WinActive("ahk_exe draw.io.exe") ;; draw.io 无格式粘贴
        SendEvent "^+v"
    else if WinActive("ahk_exe Termius.exe") or WinActive("ahk_exe Tabby.exe") or WinActive("ahk_exe mintty.exe") ;; Termius，Tabby 粘贴
        SendEvent "+{Insert}"
    else
        SendEvent "^v"
    return
}

;; WPS只粘贴文本
<!+v::
{
    if WinActive("ahk_exe wps.exe") ;; WPS只粘贴文本
        SendEvent "!^t"
    else
        SendEvent "!+v"
    return
}


;;;;;;;;;;;;;;;;;;;;;;;;; draw.io
;; 格式【draw.io】
<!+p::
{
    if WinActive("ahk_exe draw.io.exe") ;; draw.io 格式
        SendEvent "^+p"
    else
        SendEvent "!+p"
    return
}
<!+k::
{
    if WinActive("ahk_exe draw.io.exe") ;; draw.io 格式
        SendEvent "^+k"
    else
        SendEvent "!+k"
    return
}
;;;;;;;;;;;;;;;;;;;;;;;;; draw.io


;; 新建标签【Edge，文件资源管理器】
<!t::
{
    if WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe") or WinActive("ahk_exe chrome.exe")
        SendEvent "^t"
    else
        SendEvent "!t"
    return
}

;; 光标定位地址栏【Edge，文件资源管理器】
<!l::
{
    if WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe") or WinActive("ahk_exe chrome.exe")
        SendEvent "^l"
    ;; Bash 窗体下修改为清屏
    else if WinActive("ahk_exe Termius.exe") or WinActive("ahk_exe mintty.exe") or WinActive("ahk_exe Tabby.exe")
        SendEvent "^l"
    else
        SendEvent "!l"
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

; Win + c 激活 滴答清单
<#c::
{
    if ( WinExist("ahk_exe TickTick.exe") and WinActive("ahk_exe TickTick.exe") ) {
      WinMinimize ; Use the window found by WinWait.
    }
    else if WinExist("ahk_exe TickTick.exe") {
      WinActivate ; Use the window found by WinExist.
    }
    if not WinExist("ahk_exe TickTick.exe")
        run "C:\Program Files (x86)\滴答清单\TickTick.exe"
    
    return
}
