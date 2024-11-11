#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-11-11 16:20:31
# @LastEditTime: 2024-11-11 17:24:04
# @LastEditors: Cloudflying
# @Description: Mirrors Set
###
[ -f '/etc/os-release' ] && . /etc/os-release

case "${ID}" in
  ubuntu)
    echo "${PRETTY_NAME}"
    ;;
  debian)
    echo "${PRETTY_NAME}"
    ;;
  kali)
    echo "${PRETTY_NAME}"
    ;;
  arch)
    echo "${PRETTY_NAME}"
    ;;
  manjaro)
    echo "${PRETTY_NAME}"
    ;;
  clear-linux-os)
    echo "${PRETTY_NAME}"
    ;;
  alpine)
    echo "${PRETTY_NAME}"
    ;;
  fedora)
    echo "${PRETTY_NAME}"
    ;;
  opensuse-tumbleweed)
    echo "${PRETTY_NAME}"
    ;;
  ol)
    echo "${PRETTY_NAME}"
    ;;
  rocky)
    echo "${PRETTY_NAME}"
    ;;
  rhel)
    echo "${PRETTY_NAME}"
    ;;
  alinux)
    echo "${PRETTY_NAME}"
    ;;
  almalinux)
    echo "${PRETTY_NAME}"
    ;;
  centos)
    echo "${PRETTY_NAME}"
    ;;
  *)
    echo "Unknow OS"
    ;;
esac

if [[ "${ID}" == 'ubuntu' ]]; then
  echo "${PRETTY_NAME}"
elif [[ "${ID}" == 'debian' ]]; then
  echo "${PRETTY_NAME}"
elif [[ "${ID}" == 'kali' ]]; then
  echo "${PRETTY_NAME}"
elif [[ "${ID}" == 'arch' ]]; then
  echo "${PRETTY_NAME}"
elif [[ "${ID}" == 'manjaro' ]]; then
  echo "${PRETTY_NAME}"
elif [[ "${ID}" == 'clear-linux-os' ]]; then
  echo "${PRETTY_NAME}"
elif [[ "${ID}" == 'alpine' ]]; then
  echo "${PRETTY_NAME}"
elif [[ "${ID}" == 'fedora' ]]; then
  echo "${PRETTY_NAME}"
elif [[ "${ID}" == 'opensuse-tumbleweed' ]]; then
  echo "${PRETTY_NAME}"
elif [[ "${ID}" == 'ol' ]]; then
  # Oracle Linux Server
  echo "${PRETTY_NAME}"
elif [[ "${ID}" == 'rocky' ]]; then
  # rhel
  echo "${PRETTY_NAME}"
elif [[ "${ID}" == 'rhel' ]]; then
  # rhel
  echo "${PRETTY_NAME}"
elif [[ "${ID}" == 'alinux' ]]; then
  # rhel
  echo "${PRETTY_NAME}"
elif [[ "${ID}" == 'almalinux' ]]; then
  # rhel
  echo "${PRETTY_NAME}"
fi
