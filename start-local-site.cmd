@echo off
setlocal
cd /d "%~dp0"
where py >nul 2>nul
if not errorlevel 1 (
  set "PYTHON_CMD=py -3"
) else (
  where python >nul 2>nul
  if not errorlevel 1 (
    set "PYTHON_CMD=python"
  ) else (
    echo Python is needed to run the local web server.
    echo Install Python from https://www.python.org/downloads/windows/
    echo You can also open dist\index.html directly without a server.
    pause
    exit /b 1
  )
)
echo Starting the law office website at http://localhost:4173/
echo Keep this window open while viewing the site. Press Ctrl+C to stop it.
start "" "http://localhost:4173/"
%PYTHON_CMD% -m http.server 4173 --bind 127.0.0.1 --directory dist
pause
