#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 23:22:59
 # @LastEditTime: 2026-03-04 20:46:18
 # @LastEditors: Cloudflying
# @Description: Load Alias
###

# 加载自定义 alias
echo "[+] Loading Aliases"
for aliasConf in "${BOXS_ALIAS_PATH}"/*.alias; do
  source "${aliasConf}"
done

if [[ -f "/etc/pacman.d/mirrorlist" ]]; then
  # Archlinux Manjaro
  source "${BOXS_ALIAS_PATH}/os/pacman.alias"
elif [[ -d "/etc/apt/sources.list.d" ]]; then
  # Ubuntu Debian and more debian-like
  source "${BOXS_ALIAS_PATH}/os/apt.alias"
elif [[ "$(uname -s)" == 'Darwin' ]]; then
  # macOS
  source "${BOXS_ALIAS_PATH}/os/brew.alias"
elif [[ -n "$(grep 'msys' /etc/os-release)" ]]; then
  source "${BOXS_ALIAS_PATH}/os/mingw.alias"
fi

if [[ -n "$(uname -r | grep -i 'wsl')" ]]; then
  source "${BOXS_ALIAS_PATH}/os/wsl.alias"
fi
