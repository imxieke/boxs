#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-03-04 20:51:17
 # @LastEditTime: 2026-03-04 20:51:19
 # @LastEditors: Cloudflying
 # @Description: WSL Config
###

# WSL Block Notify
if [[ -f '/etc/wsl.conf' ]] || [[ -d "/mnt/d" ]]; then
  export DONT_PROMPT_WSL_INSTALL=true
fi