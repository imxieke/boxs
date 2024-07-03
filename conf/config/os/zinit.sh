#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 21:27:10
 # @LastEditTime: 2024-07-03 14:19:26
 # @LastEditors: Cloudflying
# @Description: Zinit Init
###
if [[ -f "${HOME}/.local/share/zinit/zinit.zsh" ]]; then
  # shellcheck disable=SC1091
  source "${HOME}/.local/share/zinit/zinit.zsh"
  autoload -Uz _zinit
  # (( ${+_comps} )) && _comps[zinit]=_zinit
  # setopt promptsubst
  # ZSH_THEME='strug'
  zinit load zdharma-continuum/fast-syntax-highlighting
  zinit load zsh-users/zsh-syntax-highlighting
  # 灰色显示历史运行的命令
  zinit load zsh-users/zsh-autosuggestions
  zinit load zsh-users/zsh-history-substring-search
  # 会阻止 zsh 默认的上下选择历史命令记录
  # 🤖 Real-time type-ahead completion for Zsh. Asynchronous find-as-you-type autocompletion.
  zinit load marlonrichert/zsh-autocomplete
  # Additional completion definitions for Zsh.
  # _cmd file
  zinit load zsh-users/zsh-completions
  # 快速跳转至文件夹
  zinit load agkozak/zsh-z
  # Enhanced colors for zsh
  zinit load zpm-zsh/colors
  # Colorize command output using grc and lscolors
  zinit load unixorn/warhol.plugin.zsh
  zinit load MichaelAquilina/zsh-you-should-use
  zinit load mafredri/zsh-async
  # 🔖 Quickly navigate your work path!
  zinit load wfxr/formarks
  zinit load zdharma-continuum/history-search-multi-word
  zinit load trystan2k/zsh-tab-title

  # git clone depth
  zinit ice depth=1
  zinit load romkatv/powerlevel10k
  # zinit light jeffreytse/zsh-vi-mode
  if [[ -n "$(command -v fzf)" ]]; then
    # Replace zsh's default completion selection menu with fzf!
    # 似乎和其他插件有功能重复
    zinit load chitoku-k/fzf-zsh-completions
    zinit load Aloxaf/fzf-tab
    zinit load unixorn/fzf-zsh-plugin
    zinit load yuki-yano/fzf-preview.zsh
  fi
fi
