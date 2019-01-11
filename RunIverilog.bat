SET iverilog=C:\iverilog\bin\iverilog.exe
SET iverilogDir=C:\iverilog\bin\
echo using iverilog on %1 
echo iverilog = %iverilog%


@echo off
set _path=%1
for %%a in ("%_path%") do set "p_dir=%%~dpa"
echo %p_dir%
for %%a in (%p_dir:~0,-1%) do set "p2_dir=%%~dpa"
echo %p2_dir%

SETLOCAL
SET file=%1
FOR %%i IN ("%file%") DO (
SET filedrive=%%~di
SET filepath=%%~pi
SET filename=%%~ni
SET fileextension=%%~xi
)


IF %p_dir:~-1%==\ SET p_dir=%p_dir:~0,-1%
echo %p_dir%
xcopy %p_dir% %iverilogDir% /y /i

@ECHO ON

cd %iverilogDir%
call %iverilog% -o %filename% %filename%%fileextension%
call vvp %filename% 


call %iverilogDir%gtkwave.exe *.vcd

pause