@CALL CONFIG.cmd

SET BASELAB_NAME=%1
SET BASELAB_IP=%2

IF /I NOT "%3%4"=="" ( 
    SET USERNAME=%3
    SET PASSWORD=%4
) else (
    SET USERNAME=%MASTER_USERNAME%
    SET PASSWORD=%MASTER_PASSWORD%
)

"%VBOXMANAGE_PATH%" showvminfo %BASELAB_NAME% | findstr /c:"Facility "
IF %ERRORLEVEL% EQU 1 ( "%VBOXMANAGE_PATH%" startvm %BASELAB_NAME% --type headless ) else ( goto end )
:loop
FOR /f "delims={" %%a IN ('echo y ^| plink -ssh %USERNAME%@%BASELAB_IP% -pw %PASSWORD% "echo A"') DO IF %%a==A goto end
goto loop
:end
start putty -ssh %USERNAME%@%BASELAB_IP% -pw %PASSWORD%
