#!/bin/bash
current_dir_path=`pwd`
echo $current_dir_path
dir_path=$current_dir_path"/images/"
files=`find $dir_path -maxdepth 1 -type f -name *.jpg`;
files+=" "
files+=`find $dir_path -maxdepth 1 -type f -name *.png`;
imgs=()
file_num=0
for file in $files;
do
    echo $file
    imgs+=($file)
    file_num=$(($file_num+1))
done

rn=$(($RANDOM % $file_num))
echo $rn
echo ${imgs[$rn]}
gsettings set org.gnome.desktop.background picture-uri "${imgs[$rn]}"

