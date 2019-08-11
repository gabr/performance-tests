@echo off

REM PATH TO THE VISUAL STUDIO TOOLS
set compilerTools64b=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64

REM path to compiler
set compiler="%compilerTools64b%\cl.exe"

REM set up environment
call "%compilerTools64b%\vcvars64.bat"

REM create necessary folders
if not exist ".\bin" mkdir ".\bin"

REM set params
set params=/Fo: .\bin\ /Fd: .\bin\ /EHsc /W4 /Oy /O2


REM params explanation (hashed out are not ussed):
REM /Fo   - output path for .obj files
REM /Fe   - output path for binary result
REM /Fd   - output path for .pdb files
REM /EHsc - turns on automatic exception handling (compiler is angry if not set)
REM # /Wall - shows ALL ALL warnings
REM /Wn   - show level n warnings
REM /WX   - turns warnings into errors
REM # /Zi   - additional informations for compiler
REM /Oy   - maximum optimizations
REM /O2   - maximize speed


REM compile
%compiler% %params% /Fe: .\bin\main.exe main.c

