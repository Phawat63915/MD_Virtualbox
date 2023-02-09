@CALL CONFIG.cmd

set /A COUNTER=0
:loop
set /A COUNTER=%COUNTER%+1
DEL /S /Q "%BASELAB_NAME%%COUNTER%.cmd"
"%VBOXMANAGE_PATH%" unregistervm --delete "%BASELAB_NAME%%COUNTER%"
if "%COUNTER%"=="%COUNTER_VM%" goto end
goto loop
:end

"%VBOXMANAGE_PATH%" snapshot "%MASTER_NAME%" delete Snapshot
