#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export PATH=$dir/xtensa-esp32-elf/bin:$PATH
export IDF_PATH=$dir/esp-idf

cd $dir

$SHELL
