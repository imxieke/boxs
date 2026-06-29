#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-03-04 20:51:54
 # @LastEditTime: 2026-03-04 20:51:55
 # @LastEditors: Cloudflying
 # @Description: Vim Editor Config
###

# Set Default Editor
if [[ -n $(command -v nvim) ]]; then
  export SYSTEMD_EDITOR='nvim'
  export EDITOR='nvim'
  export VISUAL='nvim'
elif [[ -n $(command -v vim) ]]; then
  export SYSTEMD_EDITOR='vim'
  export EDITOR='vim'
  export VISUAL='vim'
fi

export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

# alias e="${EDITOR}"
alias vi=${EDITOR}
# alias vim=${EDITOR}
alias nano=${EDITOR}
alias emacs=${EDITOR}