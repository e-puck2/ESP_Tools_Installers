#!/bin/bash

esp_idf_url=https://github.com/e-puck2/esp-idf.git

xtenza_url=https://dl.espressif.com/dl/xtensa-esp32-elf-osx-1.22.0-73-ge28a011-5.2.0.tar.gz
xtenza_archive_name=`basename "$xtenza_url"`

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo
echo
echo WARNING All the paths you give must be correct
echo otherwise unpredictable behaviors could happen
echo Spaces in the paths are not allowed
echo
echo You can drag and drop every file of folder in the terminal to 
echo give their path
echo 
echo Enter the path to the folder where you want 
echo to install esp folder and press [ENTER]

read installation_dir

cd $installation_dir
if [ $? -ne 0 ]; then
    exit
fi

mkdir esp
if [ $? -ne 0 ]; then
    exit
fi
cd esp
if [ $? -ne 0 ]; then
    exit
fi

echo
echo Downloading esp_idf

git clone --recursive $esp_idf_url
if [ $? -ne 0 ]; then
    exit
fi
echo esp_idf downloaded

echo
echo Downloading esp toolchain
curl -O $xtenza_url
if [ $? -ne 0 ]; then
    exit
fi
echo esp toolchain downloaded

echo
echo Uncompressing esp toolchain
tar -zxf $xtenza_archive_name
if [ $? -ne 0 ]; then
    exit
fi
rm $xtenza_archive_name
if [ $? -ne 0 ]; then
    exit
fi
echo esp toolchain uncompressed

cp $current_dir/tools/Run\ ESP32\ tools.sh $installation_dir/esp/
if [ $? -ne 0 ]; then
    exit
fi

echo
echo Finished
