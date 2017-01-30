@echo off
echo Intializing...
echo Converting...
pandoc --verbose mdin/in.md > index.html
if errorlevel 1 (
echo ===================================================
echo.
echo ERROR: What happened to pandoc.exe? It's not there!
echo.
echo ===================================================
echo Ending process...
pause>nul
goto end
) 
echo Appending Stylesheets...
:A
if "%1" == "" (
echo Style?
echo.
echo Installed Styles:
call cdwe
echo.
echo Enter a name; if it is invalid, this program cannot check.
echo.
set /p input=^> 
) else (
set input=%1
)
echo ^<link rel='stylesheet' href='core/style/%input%.css' type='text/css'^> >> index.html
echo.
:done
echo Appending Assets...
echo ^<br^>^<a href="http://github.com/qtipsites/qtip"^>^<img src="core/style/images/qtip.png" alt="Made with Qtip by gusg21"^>^</a^> >> index.html
echo Altering Qtip-flavored Markdown tags...
echo Starting cscript compilers...
::BUTTON SYNTAX BECAUSE I ALWAYS FORGET:

::--Button-function()==Display--/Button
cscript core/replace.vbs "index.html" "--Button-" "<button onClick='" --NoLogo
if errorlevel 1 (
echo =====================
echo.
echo ERROR: cScript error!
echo.
echo =====================
echo Ending process...
pause>nul
goto end
)
echo (1/5)
cscript core/replace.vbs "index.html" "==" "'>" --NoLogo
if errorlevel 1 (
echo =====================
echo.
echo ERROR: cScript error!
echo.
echo =====================
echo Ending process...
pause>nul
goto end
) 
echo (2/5)
cscript core/replace.vbs "index.html" "--/Button" "</button>" --NoLogo
if errorlevel 1 (
echo =====================
echo.
echo ERROR: cScript error!
echo.
echo =====================
echo Ending process...
pause>nul
goto end
) 
echo (3/5)
cscript core/replace.vbs "index.html" "title:" "<title>" --NoLogo
if errorlevel 1 (
echo =====================
echo.
echo ERROR: cScript error!
echo.
echo =====================
echo Ending process...
pause>nul
goto end
) 
echo (4/5)
cscript core/replace.vbs "index.html" ":title" "</title>" --NoLogo
if errorlevel 1 (
echo =====================
echo.
echo ERROR: cScript error!
echo.
echo =====================
echo Ending process...
pause>nul
goto end
) 
echo (5/5)
echo Done!
pause>nul
:end
