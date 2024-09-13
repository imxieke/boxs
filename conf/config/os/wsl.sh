#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 22:41:07
# @LastEditTime: 2024-09-13 20:30:41
# @LastEditors: Cloudflying
# @Description: Windows SubSystem
###

# Block Notify
if [[ -f '/etc/wsl.conf' ]] || [[ -d "/mnt/d" ]]; then
  export DONT_PROMPT_WSL_INSTALL=true
fi
