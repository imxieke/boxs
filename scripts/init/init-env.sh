#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2022-09-17 20:30:35
# @LastEditTime: 2024-09-01 23:33:00
# @LastEditors: Cloudflying
# @Description: 初始化系统环境
###

init_env() {

  # NeoCode
  if [[ -n "$(command -v nvim)" ]] && [[ ! -d ~/.config/nvim ]]; then
    echo "==> Fetch Packer Nvim Plugin Manager"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    echo "==> Fetch NeoCode configuration"
    git clone --depth 1 https://github.com/imxieke/NeoCode.git ~/.config/nvim
  fi
}

init_vscode() {
  # Archlinux
  if [[ -z "$(bash bin/vsc -v | grep 'not found')" ]]; then
    echo "Found VSCode $(bash bin/vsc -v | head -n 1)"
  else
    echo "Unknown VSCode"
    return
  fi

  # Install VSCode extension
  echo "Install Vscode extension"

  if [[ -f ${BOXS_HOME}/backup/vscode-extensions.txt ]]; then
    for ext in $(cat ${BOXS_HOME}/backup/vscode-extensions.txt); do
      if [[ -z "$(ls -l ~/.vscode/extensions | grep "$ext")" ]]; then
        bash bin/vsc --install-extension $ext
      fi
    done
  fi
}
