#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2025-03-06 21:15:39
# @LastEditTime: 2025-03-06 23:25:03
# @LastEditors: Cloudflying
# @Description: Create SUDO User
###

# 检查是否为root用户
if [ "$EUID" -ne 0 ]; then
  echo "请使用root权限运行此脚本"
  exit 1
fi

[ ! -f "/etc/sudoers" ] && {
  echo "sudo Config File Not Found，install sudo first"
  exit 1
}

if [[ -z "$(command -v sudo)" ]]; then
  echo "sudo Command Not Found，install sudo first"
  exit 1
fi

USERNAME=${1}
PASSWORD=${2}

if [[ -z "${USERNAME}" ]]; then
  read -p "Input User Name: " USERNAME
fi

if [[ -z "${PASSWORD}" ]]; then
  read -s -p "Input ${USERNAME}'s Password: " PASSWORD
fi

echo "${USERNAME}:${PASSWORD}"

if [[ -z "$(grep wheel /etc/group)" ]]; then
  groupadd wheel
fi

if [[ -z "$(grep -v "#" /etc/sudoers | grep "wheel")" ]]; then
  echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/wheel >/dev/null
else
  sed -i 's@^%wheel@#%wheel@g' /etc/sudoers
  sed -i 's@^wheel@#wheel@g' /etc/sudoers
  echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/wheel >/dev/null
fi

useradd -m -s /bin/bash -g wheel ${USERNAME}

echo "${USERNAME}:${PASSWORD}" | chpasswd
