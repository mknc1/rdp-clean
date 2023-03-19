@echo off
for /l %%i in (0,1,10) do (
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Default" /v "MRU%%i" /f
)

cd "%USERPROFILE%\Documents"
del "Default.rdp"
del /AH "Default.rdp"

reg delete "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\LocalDevices" /va /f

"HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\LocalDevices" /va /f
for /f "delims=\ tokens=1,*" %%K in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers" /f "" /k') do (
if not "%%L"=="" reg delete "%%K\%%L" /f
)
