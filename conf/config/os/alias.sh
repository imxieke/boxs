#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 23:22:59
# @LastEditTime: 2024-12-25 23:47:53
# @LastEditors: Cloudflying
# @Description: Load Alias
###

# 加载自定义 aliases
# echo "[+] Loading alias"
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
elif [[ -f "/etc/apt/sources.list" ]]; then
  source "${BOXS_HOME}/conf/alias.d/os/apt.alias"
fi
