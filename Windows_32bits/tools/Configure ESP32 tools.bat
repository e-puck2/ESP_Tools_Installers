@echo off

set esp_idf_dir=%cd%\esp-idf

set dir=%esp_idf_dir:\=/%

set string=export IDF_PATH="%dir%"

IF EXIST msys32 (

echo %string%>%cd%\msys32\etc\profile.d\export_idf_path.sh

echo %string% written into %cd%\msys32\etc\profile.d\export_idf_path.sh

) ELSE (
echo msys32 doesn't exist
)

PAUSE