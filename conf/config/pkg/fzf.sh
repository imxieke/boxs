#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 23:36:30
# @LastEditTime: 2024-12-25 23:25:50
# @LastEditors: Cloudflying
# @Description: FZF Config
###

if [[ -n "$(command -v fzf)" ]]; then

  if [[ -n "$(command -v rg)" ]]; then
    # rg is faster than find, so use it instead.
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules}/**"'
  elif [[ -n "$(command -v fd)" ]]; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
  elif [[ -n "$(command -v ag)" ]]; then
    export FZF_DEFAULT_COMMAND='ag -l --hidden -g "" --ignore .git'
  else
    export FZF_DEFAULT_COMMAND='find . -type f -not \( -path "*/.git/*" -o -path "./node_modules/*" \)'
  fi

  export FZF_ALT_C_COMMAND='find . -type d ( -path .git -o -path node_modules ) -prune'
  export DISABLE_FZF_AUTO_COMPLETION=false
fi

if [[ -n "$(command -v bat)" ]]; then
  export FZF_PREVIEW_OPTS="bat --style=numbers --color=always {}"
fi
