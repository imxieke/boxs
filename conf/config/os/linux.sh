#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 23:35:43
# @LastEditTime: 2024-09-13 20:30:14
# @LastEditors: Cloudflying
# @Description: Linux Input Method
###

# Input Method
if [[ -n "$(command -v fcitx)" ]]; then
  export GTK_IM_MODULE=fcitx
  export QT_IM_MODULE=fcitx
  export XMODIFIERS="@im=fcitx"
fi
