#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 21:44:12
# @LastEditTime: 2024-06-06 22:01:36
# @LastEditors: Cloudflying
# @Description: Boxs Env
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
# export LC_ALL="en_US.UTF-8"

# export BOXS_HOME=${HOME}/.boxs
export BOXS_HOME="$(dirname $(dirname $(dirname $(dirname $0))))"
export BOXS_CONF="${BOXS_HOME}/conf"
export BOXS_LOGS="${BOXS_HOME}/logs"

# Config System Environment
# Darwin or Linux
if [[ "$(uname -s)" == 'Darwin' ]]; then
  OSTYPE='Darwin'
  OSNAME='Darwin'
elif [[ "$(uname -s)" == 'Linux' ]]; then
  OSTYPE='Linux'
  OSNAME=$(grep '^ID=' /etc/os-release | grep '^ID=' | awk -F '=' '{print $2}')
fi

# Check Local IP
# export HOST_IP=$(ifconfig en1 | grep inet | grep -v inet6 | awk -F ' ' '{print $2}')
if [[ "${OSTYPE}" == 'Darwin' ]]; then
  export HOST_IP=$(ifconfig en1 | grep -Eo 'inet\ [0-9]\S+.[0-9]' | sed 's#inet\ ##g')
elif [[ "${OSTYPE}" == 'Linux' ]]; then
  export HOST_IP=$(ifconfig eth0 | grep -Eo 'inet\ [0-9]\S+.[0-9]' | sed 's#inet\ ##g')
else
  export HOST_IP="127.0.0.1"
fi

# 加载本地自定义变量
if [[ -f "${HOME}/.env" ]]; then
  source "${HOME}/.env"
else
  cp -fr ${BOXS_HOME}/.env-example ${HOME}/.env
  source ${HOME}/.env
fi

# 设定所属国家 否则默认为中国
# shellcheck disable=SC2143
if [[ -z "$(grep "CURRENT_COUNTRY" "${HOME}/.env")" ]]; then
  export CURRENT_COUNTRY='CN'
fi
