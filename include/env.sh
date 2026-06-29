#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2024-05-31 21:44:12
 # @LastEditTime: 2026-06-27 01:41:48
 # @LastEditors: Cloudflying
 # @Description: Boxs Env
###

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/games:/usr/local/games:${HOME}/.bin:${HOME}/.local/bin:${HOME}/.bun/bin:${HOME}/.yarn/bin:${HOME}/.boxs/bin:${HOME}/.cargo/bin:${HOME}/.lmstudio/bin:${HOME}/.codebuddy/bin:${HOME}/.antigravity/antigravity/bin:${HOME}/.composer/vendor/bin:${HOME}/.config/composer/vendor/bin:${HOME}/.local/share/zinit/polaris/bin:${HOME}/.local/share/pnpm"

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

export BOXS_HOME=$(dirname "$(cd "$(dirname "$0")"; pwd)")
# export BOXS_HOME="${HOME}/.boxs"
export BOXS_INIT_PATH="${BOXS_HOME}/include/init"
export BOXS_APP_PATH="${BOXS_HOME}/include"
export BOXS_CONF_PATH="${BOXS_APP_PATH}/config"
export BOXS_ALIAS_PATH="${BOXS_APP_PATH}/alias.d"
export BOXS_SECRET_HOME="${HOME}/.config/secret"
export BOXS_LOGS="${BOXS_HOME}/logs"

export NALI_HOME="${HOME}/.config/nali"
export PNPM_HOME="${HOME}/.local/share/pnpm"

[ -f '/etc/os-release' ] && . /etc/os-release
# cp -fr "${BOXS_HOME}"/.env-example "${HOME}"/.env
[ ! -f "${HOME}/.env" ] && touch "${HOME}/.env"
[ -f "${HOME}/.env" ] && . "${HOME}/.env"
[ -f "${HOME}/.local/share/nvm/nvm.sh" ] && source "${HOME}/.local/share/nvm/nvm.sh"

. "${BOXS_HOME}/include/function.sh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${BOXS_HOME}/etc/p10k/p10k-instant-prompt.zsh" ]]; then
  source "${BOXS_HOME}"/etc/p10k/p10k-instant-prompt.zsh
fi

# 设定所属国家 否则默认为中国
# shellcheck disable=SC2143
if [[ -z "$(grep "CURRENT_COUNTRY" "${HOME}/.env")" ]]; then
  export CURRENT_COUNTRY='CN'
fi

# echo "[+] Loading Config"
for config in "${BOXS_CONF_PATH}/pkg/"*.sh; do
  source "${config}"
done

# if [[ -n ${PHP_VERSION} ]]; then
#   if [[ -f "${HOME}/.bin/php${PHP_VERSION}" ]]; then
#     echo "[+] Set PHP Version To ${PHP_VERSION}"
#     ln -sf ${HOME}/.bin/php${PHP_VERSION} ${HOME}/.bin/php
#   fi
# fi

# 加载自定义 alias
# echo "[+] Loading Aliases"
for aliasConf in "${BOXS_ALIAS_PATH}"/*.alias; do
  source "${aliasConf}"
done

if [[ -f "/etc/pacman.d/mirrorlist" ]]; then
  # Archlinux Manjaro
  source "${BOXS_ALIAS_PATH}/os/pacman.alias"
elif [[ -d "/etc/apt/sources.list.d" ]]; then
  # Ubuntu Debian and more debian-like
  source "${BOXS_ALIAS_PATH}/os/apt.alias"
elif [[ "$(uname -s)" == 'Darwin' ]]; then
  # macOS
  source "${BOXS_ALIAS_PATH}/os/brew.alias"
# elif [[ -n "$(grep 'msys' /etc/os-release)" ]]; then
#   source "${BOXS_ALIAS_PATH}/os/mingw.alias"
fi

if [[ -n "$(uname -r | grep -i 'wsl')" ]]; then
  source "${BOXS_ALIAS_PATH}/os/wsl.alias"
fi

# Proxy
# 配置代理
if [[ -n ${MIXED_PROXY} ]]; then
  export http_proxy=http://${MIXED_PROXY}
  export https_proxy=http://${MIXED_PROXY}
  export rsync_proxy=http://${MIXED_PROXY}
  export ftp_proxy=http://${MIXED_PROXY}
  export all_proxy=http://${MIXED_PROXY}
  export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com,.dev.xie.ke"
  export PROXY_ADDR="${http_proxy}"
fi