#!/bin/bash
script_dir_path=`cd $(dirname ${0}) && pwd`

dir_path=$script_dir_path"/images/"
files=`find $dir_path -maxdepth 1 -type f -name *.jpg`;
files+=" "
files+=`find $dir_path -maxdepth 1 -type f -name *.png`;
imgs=()
file_num=0
for file in $files;
do
    imgs+=($file)
    file_num=$(($file_num+1))
done

if [ $file_num = 0 ]; then
    gsettings reset org.gnome.desktop.background picture-uri
else
    rn=$(($RANDOM % $file_num))
    gsettings set org.gnome.desktop.background picture-uri "${imgs[$rn]}"
fi

