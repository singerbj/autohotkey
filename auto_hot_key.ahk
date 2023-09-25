^!r::Reload  ; Ctrl+Alt+R

;next song
^Right::
Send {Media_Next}
return

;previous song
^Left::
Send {Media_Prev}
return

;play/pause
^Up::
Send {Media_Play_Pause}
return

;stop
^Down::
Send {Media_Stop}
return

;reload explorer.exe
LAlt & e::
GetKeyState,isLShiftDown,LShift,P
IfEqual,isLShiftDown,D
    Run ..\restart_explorer.bat
return

;fix DNS for WSL
LAlt & d::
GetKeyState,isLShiftDown,LShift,P
IfEqual,isLShiftDown,D
    Run ..\fix_dns.ps1
return


^!z::
    SendInput,
	(
**Acceptance Criteria:**
-%a_space%
	)
return


EnvGet, JFROG_TOKEN, JFROG_TOKEN

^!a::
	StringReplace,JFROG_TOKEN,JFROG_TOKEN,`n,,A
	StringReplace,JFROG_TOKEN,JFROG_TOKEN,`r,,A
	JFROG_TOKEN := RegExReplace(JFROG_TOKEN,"\s+$")
    SendInput, wget --header='X-JFrog-Art-Api: %JFROG_TOKEN%'%a_space%
return


^!c::
	StringReplace,JFROG_TOKEN,JFROG_TOKEN,`n,,A
	StringReplace,JFROG_TOKEN,JFROG_TOKEN,`r,,A
	JFROG_TOKEN := RegExReplace(JFROG_TOKEN,"\s+$")
    SendInput, curl --header 'X-JFrog-Art-Api: %JFROG_TOKEN%'%a_space%
return
