#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 21:44:12
 # @LastEditTime: 2025-03-07 11:30:33
 # @LastEditors: Cloudflying
# @Description: Boxs Env Config
###

# Set locale and language
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# export BOXS_HOME=${HOME}/.boxs
export BOXS_HOME="$(dirname $(dirname $(dirname $(dirname $0))))"
export BOXS_CONF="${BOXS_HOME}/conf"
export BOXS_LOGS="${BOXS_HOME}/logs"

# Config System Environment

# 加载本地自定义变量
if [[ -f "${HOME}/.env" ]]; then
  source "${HOME}/.env"
else
  cp -fr ${BOXS_HOME}/.env-example ${HOME}/.env
  source ${HOME}/.env
fi

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

# 设定所属国家 否则默认为中国
# shellcheck disable=SC2143
if [[ -z "$(grep "CURRENT_COUNTRY" "${HOME}/.env")" ]]; then
  export CURRENT_COUNTRY='CN'
fi

# Github Cli
if [[ -n ${GITHUB_TOKEN} ]]; then
  export GH_TOKEN=${GITHUB_TOKEN}
fi

# Gnupg
if [[ -n "$(command -v gpg)" ]]; then
  export GPG_TTY=$(tty)
fi

export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

# alias e="${EDITOR}"
alias vi=${EDITOR}
# alias vim=${EDITOR}
alias nano=${EDITOR}
alias emacs=${EDITOR}

export NALI_HOME=${HOME}/.config/nali

# 初始化 Oh my zsh
if [[ ! -d "${HOME}/.oh-my-zsh" ]]; then
  echo "==> Fetch oh my zsh"
  git clone --depth 1 https://gitcode.com/rsync/ohmyzsh.git ~/.oh-my-zsh
  echo "==> Create .zshrc config file"
  ln -sf "${HOME}"/.boxs/conf/.zshrc ~/.zshrc
fi

# zsh Plugin Manager
if [[ ! -d ~/.local/share/zinit ]]; then
  echo "==> Zinit Configuration"
  git clone --depth 1 https://gitcode.com/rsync/zinit.git ${HOME}/.local/share/zinit
fi

if [[ ! -d "${HOME}/.config/nvim" ]]; then
  echo "==> NeoCode Configuration"
  git clone --depth 1 https://gitcode.com/imxieke/NeoCode.git ${HOME}/.config/nvim
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ -f "${BOXS_HOME}/conf/.p10k.zsh" ]] && echo "[+] Loading p10k" && source "${BOXS_HOME}/conf/.p10k.zsh"

echo "[+] Loading Config"
for config in "${BOXS_CONF}/config/pkg/"*.sh; do
  source "${config}"
done

# if [[ -n ${PHP_VERSION} ]]; then
#   if [[ -f "${HOME}/.bin/php${PHP_VERSION}" ]]; then
#     echo "[+] Set PHP Version To ${PHP_VERSION}"
#     ln -sf ${HOME}/.bin/php${PHP_VERSION} ${HOME}/.bin/php
#   fi
# fi

# WSL Block Notify
if [[ -f '/etc/wsl.conf' ]] || [[ -d "/mnt/d" ]]; then
  export DONT_PROMPT_WSL_INSTALL=true
fi

# Linux Operating System Config
if [[ "$(uname -s)" == 'Linux' ]]; then

  # Compilation flags
  export ARCHFLAGS="-arch $(uname -m)"

  # Linux Input Method
  if [[ -n "$(command -v fcitx5)" ]]; then
    export GTK_IM_MODULE=fcitx
    export GTK_IM_MODULE_DEFAULT=fcitx
    export QT_IM_MODULE=fcitx
    export QT_IM_MODULE_DEFAULT=fcitx
    # export XMODIFIERS="@im=fcitx"
    export XMODIFIERS=@im=fcitx
    export XMODIFIERS_DEFAULT=@im=fcitx
    export SDL_IM_MODULE_DEFAULT=fcitx
    export DefaultIMModule=fcitx
  fi
fi
