#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2021-12-03 22:58:44
# @LastEditTime: 2024-06-06 21:46:33
# @LastEditors: Cloudflying
# @Description:
###

GITHUB_MIRROR='https://ghproxy.com/'

# _fetch url save
_fetch() {
  if [[ -n "${2}" ]]; then
    _WGET_OUTPUT="-O $2"
    _AXEL_OUTPUT="-o $2"
  fi

  if [[ -n "$(command -v axel)" ]]; then
    axel -k -v -a -n 4 $1 $_AXEL_OUTPUT
  elif [[ -n "$(command -v wget)" ]]; then
    wget -c --no-check-certificate $1 $_WGET_OUTPUT
  fi
}

# 获取 Github 最新发布的文件
fetch_github_latest_release() {
  # https://gh-proxy.com/
  # https://github.com
  # https://ghproxy.com
  # https://gitclone.com/
  # GIT_HOST="https://hub.fastgit.xyz"
  # GITHUB_MIRROR='https://ghproxy.com/'
  # GITHUB_MIRROR='https://gh-proxy.com/'
  # USERNAME/Project 格式
  NAMESPACE=$1
  # 需要下载的文件
  FILE=$2
  # 保存文件名
  SAVE=$3

  _fetch "${GITHUB_MIRROR}https://github.com/${NAMESPACE}/releases/latest/download/${FILE}" $3
}

# Load Library

# file
ls-file() {
  ls -lha $1 | grep -v "\.$" | grep "^-" | grep ''
}

# dir
ls-dir() {
  ls -lha $1 | grep -v "\.$" | grep "^d" | grep ''
}

# symbolic link file
ls-link() {
  ls -lha $1 | grep -v "\.$" | grep "^l" | grep ''
}

# Pipe File FIFO
ls-pine() {
  ls -lha $1 | grep -v "\.$" | grep "^p" | grep ''
}

# Block Device File
ls-block() {
  ls -lha $1 | grep -v "\.$" | grep "^b" | grep ''
}

# character device file
ls-char() {
  ls -lha $1 | grep -v "\.$" | grep "^c" | grep ''
}

opengate() {
  if [[ $(is_mac) == 'true' ]]; then
    echo "Opening the gates"
    sudo spctl --master-disable
    defaults write com.apple.LaunchServices LSQuarantine -bool NO
  fi
}

closegate() {
  if [[ $(is_mac) == 'true' ]]; then
    echo "Gatekeeper re-activated"
    sudo spctl --master-enable
    defaults write com.apple.LaunchServices LSQuarantine -bool YES
  fi
}

# sql()
# {
#   if [ -z "$(command -v mysql)" ] && echo 'mysql command not found' && exit 1
#   echo "$@" | mysql -uroot -p${MYSQL_PASSWD} | grep -v 'insecure'
# }

# 显示目录所有文件但不显示属性 大小权限创建日期等
ls-list() {
  ls -lha $1 | awk -F ' ' '{print $9}' | sed '1,3d'
}

flush_dns() {
  if [[ "${OSTYPE}" =~ ^darwin ]]; then
    sudo killall -HUP mDNSResponder
    sudo killall mDNSResponderHelper
    sudo dscacheutil -flushcache
  else
    echo "Not implemented on ${OSTYPE} yet." >&2
  fi
}

# mkdir & cd
function mkd {
  mkdir -p "$@" && cd $_
}

# base64 解码
debase64() {
  echo $1 | base64 -d
}

# base64 编码
enbase64() {
  echo $1 | base64
}

# 获取程序 Bundle ID
get_appid() {
  osascript -e "id of app \"$1\""
}

# 设置扩展默认打开程序
# 支持直接设定 App 名称或绝对路径 /Applications
set_ext_open_by() {
  ext=$1
  app=$2
  APP_REAL_NAME=''
  if [[ -d "$2" ]]; then
    APP_REAL_NAME=$(echo "$2" | awk -F '/' '{print $3}' | awk -F '.' '{print $1}')
  fi
  appid=$(get_appid "$APP_REAL_NAME")
  duti -s "${appid}" "${ext}" all
  echo "completed set ext: ${ext} open by ${appid}"
}

urlencode() {
  php -r "echo urlencode("$1").PHP_EOL;"
}

urldecode() {
  php -r "echo urldecode("$1").PHP_EOL;"
}

function crypt() {
  openssl des3 -in "$1" -out "$2"
}

function decrypt() {
  openssl des3 -d -in "$1" -out "$2"
}

# Find dictionary definition
dict() {
  if [ "$3" ]; then
    curl "dict://dict.org/d:$1 $2 $3"
  elif [ "$2" ]; then
    curl "dict://dict.org/d:$1 $2"
  else
    curl "dict://dict.org/d:$1"
  fi
}

# Find geo info from IP
ipgeo() {
  # Specify ip or your ip will be used
  if [ "$1" ]; then
    curl "http://api.db-ip.com/v2/free/$1"
  else
    curl "http://api.db-ip.com/v2/free/$(myip)"
  fi
}

# Show covid-19 spread stats
corona() {
  # Specify country otherwise shows stats for all
  if [ "$1" ]; then
    curl "https://corona-stats.online/$1"
  else
    curl "https://corona-stats.online"
  fi
}

show_terminal_colors() {
  for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolor${i}\n"
  done
}

# View infomation
function vif() {
  case "$1" in
    *.gpg)
      gpg --quiet --batch -d "$@"
      ;;
    *.html | html5 | htm)
      bat --style='numbers' -l html "$@"
      ;;
    *.css)
      bat --style='numbers' -l css "$@"
      ;;
    *.json)
      bat --style='numbers' -l json "$@"
      ;;
    *.c)
      bat --style='numbers' -l c "$@"
      ;;
    *.cpp)
      bat --style='numbers' -l cpp "$@"
      ;;
    *.js)
      bat --style='numbers' -l javascript "$@"
      ;;
    *)
      bat --style='numbers' "$@"
      ;;
  esac
}
