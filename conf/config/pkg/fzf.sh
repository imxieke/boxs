#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 23:36:30
# @LastEditTime: 2024-09-11 15:48:50
# @LastEditors: Cloudflying
# @Description: FZF Config
###

export FZF_DEFAULT_COMMAND='fzf'
export DISABLE_FZF_AUTO_COMPLETION=false

if [[ -d "/usr/share/fzf" ]]; then
  export FZF_PATH=${HOME}/.config/fzf
  mkdir -p "${FZF_PATH}/shell"
  cp -fr /usr/share/fzf/key-bindings.zsh "${FZF_PATH}/shell/"
  FZF_PKG_PATH="/usr/share/fzf"
  # Auto-completion
  source "/usr/share/fzf/completion.zsh" 2>/dev/null
  # Key bindings
  source "${FZF_PKG_PATH}/key-bindings.zsh" 2>/dev/null
fi
