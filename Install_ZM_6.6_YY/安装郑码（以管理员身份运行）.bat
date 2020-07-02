@echo off
if defined ProgramFiles(x86) (
	set "tts=%ProgramFiles(x86)%\Windows NT\TableTextService"
) else (
	set "tts=%ProgramFiles%\Windows NT\TableTextService"
)
set "mb=TableTextServiceSimplifiedZhengMa_YY.txt"
set "profile={733B4D81-3BC3-4132-B91A-E9CDD5E2BF00}"
:loop
if exist "%tts%\%mb%" (
	echo * 取得"%tts%\%mb%"文件权限
	takeown /f "%tts%\%mb%" /a
	icacls "%tts%\%mb%" /grant Administrators:F
)
echo * 更新"%tts%\%mb%"
copy /y "%~dp0%mb%" "%tts%\%mb%"
if errorlevel 1 goto error
echo * 注册输入法
rundll32 "%tts%\TableTextService.dll" RegisterProfile "%tts%\%mb%"
if "%tts%"=="%ProgramFiles%\Windows NT\TableTextService" (
	echo * 修改注册表
	reg delete "HKLM\SOFTWARE\Microsoft\CTF\TIP\{E429B25A-E5D3-4D1F-9BE3-0C608477E3A1}\LanguageProfile\0x00000804\%profile%" /v "ProfileFlags" /f
	goto end
)
set "tts=%ProgramFiles%\Windows NT\TableTextService"
goto loop
:error
echo * 安装失败！
:end
pause
