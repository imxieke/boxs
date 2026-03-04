#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2026-03-04 00:32:52
# @LastEditTime: 2026-03-04 00:32:53
# @LastEditors: Cloudflying
# @Description: ZSH Sync
###

echo "Sync Zsh History"
cat ~/.zsh_history >/tmp/zsh_history
cat ${ROOT_PATH}/home/.zsh_history >>/tmp/zsh_history
sort -u /tmp/zsh_history >~/.zsh_history
sort -u /tmp/zsh_history >${ROOT_PATH}/home/.zsh_history
