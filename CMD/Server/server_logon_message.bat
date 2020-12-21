chcp 1250
set Hinweis=""
set Text=""
set löschen=ja

If /i %löschen% equ Ja goto entfernen
:setzen
Reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system /f /v "legalnoticecaption" /t REG_SZ /d %Hinweis% >nul 2>&1
Reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system /f /v "legalnoticetext" /t REG_SZ /d %Text% >nul 2>&1
goto Ende

:entfernen
Reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system /f /v "legalnoticecaption" /t REG_SZ /d "" >nul 2>&1
Reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system /f /v "legalnoticetext" /t REG_SZ /d "" >nul 2>&1

:Ende
pause