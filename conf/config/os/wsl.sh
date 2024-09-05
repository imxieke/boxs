#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 22:41:07
# @LastEditTime: 2024-05-31 22:42:48
# @LastEditors: Cloudflying
# @Description: Windows SubSystem
###

# Block Notify
if [[ -f '/etc/wsl.conf' ]] || [[ -d /mnt/d ]]; then
  export DONT_PROMPT_WSL_INSTALL=true
fi
