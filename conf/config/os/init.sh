#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 21:44:12
# @LastEditTime: 2024-12-03 10:30:17
# @LastEditors: Cloudflying
# @Description: Init Boxs Env
###

# High Priority
source "${BOXS_CONF}/config/os/path.sh"
source "${BOXS_CONF}/config/os/alias.sh"
source "${BOXS_CONF}/config/os/proxy.sh"
source "${BOXS_CONF}/config/os/wsl.sh"

# Set up Depends

if [[ "${CURRENT_COUNTRY}" == 'CN' ]]; then
  [ ! -d "${HOME}/.local/share/zinit" ] && git clone --depth=1 https://e.coding.net/pkgs/mirrors/zinit.git ~/.local/share/zinit
  [[ ! -d "${HOME}/.oh-my-zsh" ]] && git clone --depth=1 https://e.coding.net/pkgs/mirrors/ohmyzsh.git ~/.oh-my-zsh
else
  [[ ! -d "${HOME}/.oh-my-zsh" ]] && git clone --depth=1 https://gitcode.com/rsync/ohmyzsh.git ~/.oh-my-zsh
  [ ! -d "${HOME}/.local/share/zinit" ] && git clone --depth=1 https://gitcode.com/rsync/zinit.git ~/.local/share/zinit
fi

# Wait for the system to be ready
source "${BOXS_CONF}/config/os/zinit.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f "${BOXS_HOME}/conf/.p10k.zsh" ]] && echo "[+] Loading p10k" && source "${BOXS_HOME}/conf/.p10k.zsh"

echo "[+] Loading Config"
for config in "${BOXS_CONF}/config/pkg/"*.sh; do
  source "${config}"
done

# Set Default Editor
if [[ -n $(command -v nvim) ]]; then
  export EDITOR='nvim'
  export VISUAL='nvim'
elif [[ -n $(command -v vim) ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
fi

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

# Java (macOS)
if [[ -d "/usr/local/opt/java11" ]]; then
  export JAVA_HOME="/usr/local/opt/java11"
elif [[ -d "/usr/local/opt/java18" ]]; then
  export JAVA_HOME="/usr/local/opt/java18"
elif [[ -d "/usr/local/opt/java" ]]; then
  export JAVA_HOME="/usr/local/opt/java"
fi

# 加载自定义 shell
echo "[+] Loading Shell"
for shell_lib in "${BOXS_HOME}/lib/shell"/*.sh; do
  source "${shell_lib}"
done

[[ -f ${BOXS_HOME}/scripts/function.sh ]] && source ${BOXS_HOME}/scripts/function.sh
# [ -f ${BOXS_HOME}/scripts/zplug.sh ] && source ${BOXS_HOME}/scripts/zplug.sh
# [ -f ${BOXS_HOME}/scripts/macos-build-env-conf.sh ] && source ${BOXS_HOME}/scripts/macos-build-env-conf.sh

# [ -d ${BOXS_CONF}/.local/share/completion/zsh ] && fpath=(${BOXS_CONF}/.local/share/completion/zsh $fpath)

# Plugins
# [ -f ${BOXS_HOME}/scripts/command-not-found.sh ] && source ${BOXS_HOME}/scripts/command-not-found.sh

# 初始化 Oh-my-zsh
if [[ ! -f "${HOME}/.zshrc" ]] || [[ -z "$(ls -lha ~/.zshrc | grep '.boxs/conf/')" ]]; then
  ln -sf ${BOXS_HOME}/conf/.zshrc ${HOME}/.zshrc
fi

if [[ ! -f "${HOME}/.gitconfig" ]] || [[ -z "$(ls -lha ~/.zshrc | grep '.boxs/conf/')" ]]; then
  ln -sf ${BOXS_HOME}/conf/.gitconfig ${HOME}/.gitconfig
fi

if [[ ! -f "${HOME}/.npmrc" ]] || [[ -z "$(ls -lha ~/.npmrc | grep '.boxs/conf/')" ]]; then
  ln -sf ${BOXS_HOME}/conf/.npmrc ${HOME}/.npmrc
fi

if [ ! -f "${HOME}/.gemrc" ] || [ -z "$(ls -lha ${HOME}/.gemrc | grep 'boxs')" ]; then
  ln -sf ${HOME}/.boxs/conf/.gemrc ${HOME}/.gemrc
fi

if [[ -n "$(command -v pip)" ]]; then
  rm -fr ${HOME}/.config/pip
  ln -sf ${HOME}/.boxs/conf/.config/pip ${HOME}/.config
fi

# 配置 Neovim 輕量模式
if [[ ! -f "${HOME}/.config/nvim/full.lua" ]]; then
  # echo "==> Config neovim"
  mkdir -p "${HOME}/.config"
  ln -sf "${HOME}/.boxs/conf/.config/nvim" "${HOME}/.config"
fi

if [[ ! -f "${HOME}/.local/share/nvim/databases/telescope_history.sqlite3" ]]; then
  # echo "==>Init Neovim Telescope SQLite Database"
  mkdir -p ${HOME}/.local/share/nvim/databases
  touch ${HOME}/.local/share/nvim/databases/telescope_history.sqlite3
fi

if [[ -n "${PHP_VERSION}" ]]; then
  if [[ -f "${HOME}/.bin/php${PHP_VERSION}" ]]; then
    echo "[+] Set PHP Version To ${PHP_VERSION}"
    ln -sf ${HOME}/.bin/php${PHP_VERSION} ${HOME}/.bin/php
  fi
fi

if [[ ! -f "${HOME}/.bin/composer" ]]; then
  mkdir -p ${HOME}/.bin
  echo "==> Install Composer"
  # https://mirrors.aliyun.com/composer/composer.phar
  wget -cq https://mirrors.tencent.com/composer/composer.phar -O ${HOME}/.bin/composer
  chmod +x ${HOME}/.bin/composer
fi

# 修复 settings 里面用到的可执行文件 用于跨系统调用(Linux macOS)
if [[ ! -f "${HOME}/.boxs/share/bin/shfmt.sh" ]]; then
  echo "==> Init Cross Platform Binary Command"
  sudo ln -sf ${HOME}/share/bin /usr/local/share/dotboxs/bin
fi

if [[ ! -d "${HOME}/.local/share/nvm" ]]; then
  echo "==> Install Nvm"
  git clone --depth 1 https://gitcode.com/rsync/nvm.git ~/.local/share/nvm
fi

# zsh Plugin Manager
if [[ ! -d ~/.local/share/zinit ]]; then
  echo "==> Zinit Configuration"
  git clone --depth 1 https://gitcode.com/rsync/zinit.git ~/.local/share/zinit
fi

# 私有配置文件信息
if [[ ! -d "${HOME}/.config/secret" ]]; then
  echo "==> Init Secret Config"
  git clone --depth 1 https://gitcode.com/imxieke/secret.git ${HOME}/.config/secret
fi
