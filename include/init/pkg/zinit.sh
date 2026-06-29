#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2026-06-27 00:23:03
# @LastEditTime: 2026-06-27 00:23:04
# @LastEditors: Cloudflying
# @Description: ZSH Plugin Manager
###

if [[ ! -d ~/.local/share/zinit ]]; then
  echo "==> Zinit Configuration"
  git clone --depth 1 https://gitcode.com/rsync/zinit.git ${HOME}/.local/share/zinit
fi
