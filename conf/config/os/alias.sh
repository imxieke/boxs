#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 23:22:59
 # @LastEditTime: 2025-04-11 10:11:17
 # @LastEditors: Cloudflying
# @Description: Load Alias
###

# 加载自定义 alias
echo "[+] Loading Aliases"
for aliasf in "${BOXS_CONF}/alias.d"/*.alias; do
  # echo "==> load $aliasf"
  source "${aliasf}"
done

if [[ -f "/etc/pacman.d/mirrorlist" ]]; then
  # Archlinux Manjaro
  source "${BOXS_HOME}/conf/alias.d/os/pacman.alias"
elif [[ -d "/etc/apt/sources.list.d" ]]; then
  # Ubuntu Debian and more debian-like
  source "${BOXS_HOME}/conf/alias.d/os/apt.alias"
elif [[ "$(uname -s)" == 'Darwin' ]]; then
  # macOS
  source "${BOXS_HOME}/conf/alias.d/os/brew.alias"
elif [[ -n "$(grep 'msys' /etc/os-release)" ]]; then
  source "${BOXS_HOME}/conf/alias.d/os/mingw.alias"
fi

if [[ -n "$(uname -r | grep -i 'wsl')" ]]; then
  source "${BOXS_HOME}/conf/alias.d/os/wsl.alias"
fi
