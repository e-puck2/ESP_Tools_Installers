@echo off

set esp_idf_url=https://github.com/e-puck2/esp-idf.git

set mingw32_url=https://dl.espressif.com/dl/esp32_win32_msys2_environment_and_toolchain-20170918.zip
for %%a in ("%mingw32_url%") do set "mingw32_folder_name=%%~nxa"

set current_dir=%cd%

echo.
echo.
echo WARNING All the paths you give must be correct
echo otherwise unpredictable behaviors could happen
echo Spaces in the paths are not allowed
echo.
echo You can drag and drop every file of folder in the terminal to 
echo give their path
echo .
echo Enter the path to the folder where you want 
echo to install esp folder and press [ENTER]

set /p installation_dir=

mkdir %installation_dir%\esp
if %errorlevel% neq 0 (
pause
exit
)

echo.
echo Downloading esp_idf

mkdir %installation_dir%\esp\esp-idf
if %errorlevel% neq 0 (
pause
exit
)

git clone --recursive %esp_idf_url% %installation_dir%\esp\esp-idf
if %errorlevel% neq 0 (
pause
exit
)

echo esp_idf downloaded

echo.
echo Downloading esp toolchain
bitsadmin.exe /transfer "esp toolchain" %mingw32_url% %installation_dir%\esp\%mingw32_folder_name%
if %errorlevel% neq 0 (
pause
exit
)
echo esp toolchain downloaded

echo.
echo Uncompressing esp toolchain
%current_dir%\tools\7za.exe x %installation_dir%\esp\%mingw32_folder_name% -o%installation_dir%\esp
if %errorlevel% neq 0 (
pause
exit
)
del %installation_dir%\esp\%mingw32_folder_name%
if %errorlevel% neq 0 (
pause
exit
)
echo esp toolchain uncompressed

xcopy %current_dir%\tools\"Configure ESP32 tools.bat" %installation_dir%\esp\ /s /q
if %errorlevel% neq 0 (
pause
exit
)

echo.
echo Finished
PAUSE