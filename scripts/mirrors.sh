#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-11-11 16:20:31
# @LastEditTime: 2024-11-12 11:09:56
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

_set_arch()
{
  MIRRORS_FILE='/etc/pacman.d/mirrorlist'
  echo "Server = https://mirrors.nju.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.zju.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.aliyun.com/archlinux/\$repo/os/\$arch
Server = https://mirrors.huaweicloud.com/archlinux/\$repo/os/\$arch
Server = https://mirrors.tencent.com/archlinux/\$repo/os/\$arch" >${MIRRORS_FILE}
}

_set_ubuntu()
{
  MIRRORS_FILE='/etc/apt/sources.list'
  MIRRORS_HOST="https://mirrors.ustc.edu.cn/ubuntu/"
  echo "deb ${MIRRORS_HOST} ${VERSION_CODENAME} main restricted universe multiverse
  deb ${MIRRORS_HOST} ${VERSION_CODENAME}-backports main restricted universe multiverse
  deb ${MIRRORS_HOST} ${VERSION_CODENAME}-proposed main restricted universe multiverse
  deb ${MIRRORS_HOST} ${VERSION_CODENAME}-security main restricted universe multiverse
  deb ${MIRRORS_HOST} ${VERSION_CODENAME}-updates main restricted universe multiverse
  deb-src ${MIRRORS_HOST} ${VERSION_CODENAME} main restricted universe multiverse
  deb-src ${MIRRORS_HOST} ${VERSION_CODENAME}-backports main restricted universe multiverse
  deb-src ${MIRRORS_HOST} ${VERSION_CODENAME}-proposed main restricted universe multiverse
  deb-src ${MIRRORS_HOST} ${VERSION_CODENAME}-security main restricted universe multiverse
  deb-src ${MIRRORS_HOST} ${VERSION_CODENAME}-updates main restricted universe multiverse" >${MIRRORS_FILE}
}

_set_debian()
{
  MIRRORS_FILE='/etc/apt/sources.list'
  MIRRORS_HOST="https://mirrors.ustc.edu.cn/debian/"
  MIRRORS_HOST_SECURITY="https://mirrors.ustc.edu.cn/debian-security/"
  echo "deb ${MIRRORS_HOST} ${VERSION_CODENAME} main contrib non-free non-free-firmware
  deb ${MIRRORS_HOST} ${VERSION_CODENAME}-backports main contrib non-free non-free-firmware
  deb ${MIRRORS_HOST} ${VERSION_CODENAME}-proposed-updates main contrib non-free non-free-firmware
  deb ${MIRRORS_HOST_SECURITY} ${VERSION_CODENAME}-security main contrib non-free non-free-firmware
  deb ${MIRRORS_HOST} ${VERSION_CODENAME}-updates main contrib non-free non-free-firmware
  deb-src ${MIRRORS_HOST} ${VERSION_CODENAME} main contrib non-free non-free-firmware
  deb-src ${MIRRORS_HOST} ${VERSION_CODENAME}-backports main contrib non-free non-free-firmware
  deb-src ${MIRRORS_HOST} ${VERSION_CODENAME}-proposed-updates main contrib non-free non-free-firmware
  deb-src ${MIRRORS_HOST_SECURITY} ${VERSION_CODENAME}-security main contrib non-free non-free-firmware
  deb-src ${MIRRORS_HOST} ${VERSION_CODENAME}-updates main contrib non-free non-free-firmware" >${MIRRORS_FILE}
}

_set_kali()
{
  MIRRORS_FILE='/etc/apt/sources.list'
  MIRRORS_HOST="https://mirrors.ustc.edu.cn/kali/"
  echo "deb ${MIRRORS_HOST} kali-rolling main contrib non-free non-free-firmware
  deb-src ${MIRRORS_HOST} kali-rolling main contrib non-free non-free-firmware" >${MIRRORS_FILE}
}
