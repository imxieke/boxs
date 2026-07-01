#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-07-01 11:49:05
 # @LastEditTime: 2026-07-01 12:21:19
 # @LastEditors: Cloudflying
 # @Description: Mago is a toolchain for PHP that aims to provide a set of tools to help developers write better code.
###

VER="1.42.0"
ARCH=$(uname -m)
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
LIBC="gnu"
ldd_version=$(ldd --version | head -n 1)
URL="https://github.com/carthage-software/mago/releases/download/${VER}"

if [ "${OS}" == 'darwin' ]; then
  if [ "{$ARCH}" == 'x86_64' ]; then
    FILENAME="mago-${VER}-x86_64-apple-darwin"
  else
    FILENAME="mago-${VER}-aarch64-apple-darwin"
  fi
elif [ "${OS}" == 'linux' ]; then
  if [ -n "$(echo "$ldd_version" | grep -i "gnu")" ]; then
    FILENAME="mago-${VER}-x86_64-unknown-linux-gnu"
  elif [ -n "$(echo "$ldd_version" | grep -i "musl")" ]; then
    FILENAME="mago-${VER}-x86_64-unknown-linux-gnu"
  fi
fi

FULLNAME="${URL}/${FILENAME}.tar.gz"

mkdir -p /tmp/boxs-init
cd /tmp/boxs-init || exit 1

wget "${FULLNAME}" -O "${FILENAME}.tar.gz"
tar -xzf "${FILENAME}.tar.gz"
mv "${FILENAME}"/mago .
chmod +x ./mago
mv ./mago ${HOME}/.bin/mago
rm -fr "/tmp/boxs-init/${FILENAME}"
rm -rf "/tmp/boxs-init/${FILENAME}.tar.gz"
echo "Mago has been installed successfully! Version: ${VER}"

# echo "${FULLNAME}"