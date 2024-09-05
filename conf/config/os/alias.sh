#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 23:22:59
# @LastEditTime: 2024-06-02 15:12:52
# @LastEditors: Cloudflying
# @Description: Load Alias
###

# 加载自定义 aliases
echo "[+] Loading alias"
for aliasf in "${BOXS_CONF}/alias.d"/*.alias; do
  # echo "==> load $aliasf"
  source "${aliasf}"
done

# Archlinux Manjaro
if [[ -f "/etc/pacman.d/mirrorlist" ]]; then
  source "${BOXS_HOME}/conf/alias.d/os/pacman.alias"
# Ubuntu Debian and more debian-like
elif [[ -d "/etc/apt/sources.list.d" ]]; then
  source "${BOXS_HOME}/conf/alias.d/os/apt.alias"
# macOS
elif [[ "$(uname -s)" == 'Darwin' ]]; then
  source "${BOXS_HOME}/conf/alias.d/os/brew.alias"
elif [[ -f "/etc/apt/sources.list" ]]; then
  source "${BOXS_HOME}/conf/alias.d/os/apt.alias"
fi
