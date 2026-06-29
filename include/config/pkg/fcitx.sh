#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-03-04 20:49:54
 # @LastEditTime: 2026-03-23 13:22:18
 # @LastEditors: Cloudflying
 # @Description: Fcitx Config
###

# Linux Operating System Config
if [[ "$(uname -s)" == 'Linux' ]]; then

  # Compilation flags
  export ARCHFLAGS="-arch $(uname -m)"

  # Linux Input Method
  if [[ -n "$(command -v fcitx5)" ]]; then
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
    export SDL_IM_MODULE_DEFAULT=fcitx
    export DefaultIMModule=fcitx
  fi
fi