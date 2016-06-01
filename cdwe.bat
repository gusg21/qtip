@echo off
cd %1
for /F "delims=" %%j in ('dir /A-D /B /O:GEN core\style ') do echo %%~nj
