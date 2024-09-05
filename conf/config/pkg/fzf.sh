#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 23:36:30
# @LastEditTime: 2024-07-03 14:13:41
# @LastEditors: Cloudflying
# @Description: FZF Config
###

export FZF_DEFAULT_COMMAND='fzf'
export DISABLE_FZF_AUTO_COMPLETION=false

if [[ -d "/usr/share/fzf" ]]; then
  export FZF_PATH="${HOME}/.boxs/conf/conf.d/fzf"
fi

if [[ ! -f "${HOME}/.fzf.zsh" ]]; then
  ln -sf "${HOME}/.boxs/conf/conf.d/fzf/fzf.zsh" "${HOME}/.fzf.zsh"
fi
