@echo off
if defined ProgramFiles(x86) (
	set "tts=%ProgramFiles(x86)%\Windows NT\TableTextService"
) else (
	set "tts=%ProgramFiles%\Windows NT\TableTextService"
)
set "mb=TableTextServiceSimplifiedZhengMa_YY.txt"
:loop
echo * ע�����뷨
echo "%tts%"
rundll32 "%tts%\TableTextService.dll" UnregisterProfile "%tts%\%mb%"
if "%tts%"=="%ProgramFiles%\Windows NT\TableTextService" goto end
set "tts=%ProgramFiles%\Windows NT\TableTextService"
goto loop
:end
pause
