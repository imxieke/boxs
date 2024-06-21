#!/usr/bin/env bash

if [ $(id -u) == 0 ];then 
    echo "User Only, no root"
fi

USER_HOME=${HOME}

if [ ! -f "/usr/local/share/dotboxs/bin/shfmt.sh" ]; then 
    sudo ln -sf "${USER_HOME}/.boxs/share" "/usr/local/share/dotboxs"
fi
