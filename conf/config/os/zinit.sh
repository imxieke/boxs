#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 21:27:10
# @LastEditTime: 2024-09-12 14:04:54
# @LastEditors: Cloudflying
# @Description: Zinit Init
###
if [[ -f "${HOME}/.local/share/zinit/zinit.zsh" ]]; then
  # shellcheck disable=SC1091
  source "${HOME}/.local/share/zinit/zinit.zsh"
  autoload -U compinit
  compinit
  # (( ${+_comps} )) && _comps[zinit]=_zinit
  # setopt promptsubst
  # ZSH_THEME='strug'
  # zinit load zsh-users/zsh-syntax-highlighting
  # 灰色显示历史运行的命令
  zinit load zsh-users/zsh-autosuggestions
  # zinit load zsh-users/zsh-history-substring-search
  # 会阻止 zsh 默认的上下选择历史命令记录
  # 🤖 Real-time type-ahead completion for Zsh. Asynchronous find-as-you-type autocompletion.
  # 会实时显示对应数据 如 `cd directory` 会显示对应目录文件
  zinit load marlonrichert/zsh-autocomplete
  # Additional completion definitions for Zsh.
  # _cmd file 官方不存在的自动补全
  zinit load zsh-users/zsh-completions
  # 快速跳转至文件夹
  zinit load agkozak/zsh-z
  # Enhanced colors for zsh
  zinit load zpm-zsh/colors
  # Colorize command output using grc and lscolors
  # zinit load unixorn/warhol.plugin.zsh
  #📎 ZSH plugin that reminds you to use existing aliases for commands you just typed
  zinit load MichaelAquilina/zsh-you-should-use
  # zinit load mafredri/zsh-async
  # 🔖 Quickly navigate your work path!
  zinit load wfxr/formarks

  # Git
  zinit load wfxr/forgit

  # zinit load zdharma-continuum/history-search-multi-word
  # zinit load trystan2k/zsh-tab-title

  # git clone depth
  zinit ice depth=1
  zinit load romkatv/powerlevel10k
  # zinit light jeffreytse/zsh-vi-mode
  if [[ -n "$(command -v fzf)" ]]; then
    #   # Replace zsh's default completion selection menu with fzf!
    #   # 似乎和其他插件有功能重复
    zinit load chitoku-k/fzf-zsh-completions
    # fzf 提供分行参数 一行一个
    zinit load Aloxaf/fzf-tab
  fi
fi
