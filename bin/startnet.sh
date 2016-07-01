#!/bin/bash

blocked=$(rfkill list | grep yes | wc -l)

if [ $blocked ]; then
    sudo rfkill unblock all
fi

if [ $#  -eq 0 ];
then
    echo "Usage: " $0 "<profile>"
    echo "List of profiles:"

    IDF_old=$IFS
    IFS=$'\n';
    for token in `netctl list | sed 's/*//g'`; do
	echo " - " $token;
    done
    IFS=$IFS_old;
else
    sudo netctl switch-to $1
fi

