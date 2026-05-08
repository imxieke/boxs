#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2026-03-04 00:32:52
 # @LastEditTime: 2026-05-08 21:02:27
 # @LastEditors: Cloudflying
# @Description: ZSH Sync
###

echo "Sync Zsh History"

if [[ -z "${BOXS_SECRET_HOME}" ]]; then
  echo "Boxs Env Not Found"
  exit 1
fi

cat ~/.zsh_history >/tmp/zsh_history
cat "${BOXS_SECRET_HOME}"/home/.zsh_history >>/tmp/zsh_history
# sort -u /tmp/zsh_history > ~/.zsh_history
sort -u /tmp/zsh_history > "${BOXS_SECRET_HOME}"/home/.zsh_history
