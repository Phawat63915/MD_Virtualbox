@CALL CONFIG.cmd

"%VBOXMANAGE_PATH%" snapshot "%MASTER_NAME%" delete Snapshot
"%VBOXMANAGE_PATH%" snapshot "%MASTER_NAME%" take Snapshot
SET /A COUNTER = 0

:clone_loop
set /A COUNTER=%COUNTER%+1
echo %COUNTER%
RD /S /Q "%VMS_PATH%\%BASELAB_NAME%%COUNTER%"
"%VBOXMANAGE_PATH%" clonevm "%MASTER_NAME%" --snapshot Snapshot --basefolder "%VMS_PATH%" --options link --name "%BASELAB_NAME%%COUNTER%" --register
if %COUNTER%==%COUNTER_VM% goto next
goto clone_loop
:next

SET /A SUM = 1
:list

"%VBOXMANAGE_PATH%" startvm "%BASELAB_NAME%%SUM%" --type headless
:loop
FOR /f "delims={" %%a IN ('echo y ^| plink -ssh %MASTER_USERNAME%@%MASTER_IP% -pw %MASTER_PASSWORD% "echo A"') DO IF %%a==A goto work
goto loop

:work
timeout /t 1 /nobreak > nul
ECHO CALL VMSTART ^"%BASELAB_NAME%%SUM%^" ^"192.168.56.5%SUM%^" >> "%BASELAB_NAME%%SUM%.cmd"
echo y | plink -ssh %MASTER_USERNAME%@%MASTER_IP% -pw %MASTER_PASSWORD% ""
echo y | plink -ssh %MASTER_USERNAME%@%MASTER_IP% -pw %MASTER_PASSWORD% "(echo '# This is the network config written by 'subiquity'' && echo 'network:' && echo '  ethernets:' && echo '    enp0s3:' && echo '      dhcp4: true' && echo '      optional: false' && echo '    enp0s8:' && echo '      dhcp4: false' && echo '      addresses: [192.168.56.5%SUM%/24]' && echo '      optional: false' && echo '  version: 2' && echo )> '/etc/netplan/00-installer-config.yaml'"
timeout /t 2 /nobreak > nul
:stop
ping -w 1 -n 2 %MASTER_IP%> nul
IF %ERRORLEVEL% EQU 1 goto is_stop
"%VBOXMANAGE_PATH%" controlvm "%BASELAB_NAME%%SUM%" acpipowerbutton
goto stop
:is_stop

IF %SUM% EQU %COUNTER_VM% GOTO end
SET /A SUM = %SUM% + 1
GOTO list
:end
