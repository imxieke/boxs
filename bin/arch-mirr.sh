#!/usr/bin/env bash

if [[ "$(id -u)" != 0 ]]; then
  echo "This script must be run as root."
  exit 1;
fi

COUNTRY="CN"

if [[ -n "$1" ]]; then
  COUNTRY=$1
fi


__usage()
{
  printf "Usage: mirror [options]\n"
  printf "    --country=cn|us Specify the country to use \n"
}

_set()
{
  echo $1 | tee -a /etc/pacman.d/mirrorlist > /dev/null
}

__china()
{
  echo "" > /etc/pacman.d/mirrorlist
  _set 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.huaweicloud.com/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.tencent.com/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.cqu.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.zju.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.hit.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.hust.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.jcut.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.jlu.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.jxust.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.neusoft.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.nju.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.njupt.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirror.nyist.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.qlu.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.qvq.net.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirror.redrock.team/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.shanghaitech.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.wsyu.edu.cn/archlinux/$repo/os/$arch'
  _set 'Server = https://mirrors.xjtu.edu.cn/archlinux/$repo/os/$arch'

  printf "it's done"
}

_conf()
{
  sed -i "s/#\[multilib\]/\[multilib\]/g" /etc/pacman.conf
  sed -i "s/#\[extra\]/\[extra\]/g" /etc/pacman.conf
  sed -i "s/#\[core\]/\[core\]/g" /etc/pacman.conf
}

_keyring()
{
  pacman-key --init
  pacman-key --populate
  pacman -Sy --noconfirm archlinux-keyring
  # pacman -Sy --noconfirm archlinuxcn-keyring
}

case "${COUNTRY}" in
  'CN')
    __china
    ;;
  *)
    __usage
    ;;
esac