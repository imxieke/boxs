#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-06-27 00:03:17
 # @LastEditTime: 2026-06-27 01:43:36
 # @LastEditors: Cloudflying
 # @Description: Boxs Global Functions
###

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
CUR_DIR=$(cd "$(dirname "$0")"; pwd)
echo "CURRENT_DIR: ${CUR_DIR}"
echo "SCRIPT_DIR: ${SCRIPT_DIR}"
echo "$(readlink -f $0)"

. "${CUR_DIR}/function/messages.sh"

__cmd_yes_no()
{
  if [[ -n "$(command -v "$1")" ]]; then
    echo "✓"
  else
    echo "x"
  fi
}

__rootness()
{
  if [[ "$(id -u)" -ne 0 ]]; then
    echo "==> Current User No Permission"
    exit 1
  fi
}

_cmd_exist()
{
  if [[ -z "$(command -v "$1")" ]]; then
    _warn "command $1 not found"
    exit 1
  fi
}

_init_pkg()
{
  if [[ -f "${BOXS_INIT_PATH}/pkg/${1}.sh" ]]; then
    bash "${BOXS_INIT_PATH}/pkg/${1}.sh"
  else
    _warn "${1} not found"
  fi
}

_lnf()
{
  from=$1
  to=$2
  if [[ ! -f ${to} ]]; then
    ln -sf "${from}" "${to}"
  else
    _warn "${to} has been exists"
  fi
}

_lnd()
{
  from=$1
  to=$2
  if [[ ! -d ${to} ]]; then
    ln -sf "${from}" "${to}"
  else
    _warn "${to} has been exists"
  fi
}

_sudo()
{
  sudo "$@"
}

__user()
{
  sudo -Hu "${USERNAME}" "$@"
}

function unproxy()
{
  PROXY_LISTS=(
    http_proxy
    https_proxy
    rsync_proxy
    ftp_proxy
    all_proxy
    no_proxy
  )

  for proxy in "${PROXY_LISTS[@]}"; do
    unset "${proxy}"
  done
}

pkg_add()
{
  __rootness
  echo "==> Install Depends $*"
  if [[ -f "/etc/os-release" ]]; then
    . /etc/os-release
  fi

  if [[ "$(uname -s)" == "Darwin" ]]; then
    brew install "$@"
  elif [[ ${ID} == 'ubuntu' ]]; then
    apt install -y "$@"
  elif [[ ${ID} == 'arch' ]]; then
    pacman -S --noconfirm "$@"
  elif [[ ${ID} == 'alpine' ]]; then
    apk add "$@"
  else
    echo "Unknow Platform"
    exit 1
  fi
}