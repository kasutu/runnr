@echo off
SET mypath=%~dp0
SET current_path=%mypath:~0,-1%

type %current_path%\ascii\runner_banner.txt
type %current_path%\version.txt

echo.

:main
IF "%~1"=="java-mvn" GOTO run_java
SHIFT
GOTO invalid_params
GOTO main
EXIT /B 0

:run_java
IF [%~2]==[] GOTO invalid_params
IF [%~3]==[] GOTO invalid_params

CALL mvn clean package
CALL mvn package
CALL java -cp %~2 %~3
EXIT /B 0

:invalid_params
echo [WARN] Invalid Parameter!
echo.
echo Available commands
echo.
echo    java-mvn [target .jar] [main class] - Initialize a java project with simple maven template
EXIT /B 0