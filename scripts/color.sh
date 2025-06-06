#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2021-12-05 17:58:03
# @LastEditTime: 2024-06-07 23:54:30
# @LastEditors: Cloudflying
# @Description: Colorization Text
###

# Resources:
# * http://en.wikipedia.org/wiki/8-bit_color
# * http://en.wikipedia.org/wiki/ANSI_escape_code
# * /usr/share/X11/rgb.txt

_prefix="\033["
_suffix=""
_font=4

# echo -e "\033[字背景颜色；文字颜色m字符串\033[0m"
# \33[亮度;背景色;字体颜色m{文字}\033[字体控制
# \33\1;31;31mHello\033[0;90m
_none() {
  echo -e '\033[0m' "$1"
}

_gray() {
  printf "\033[${_font};3;30m%s\033[0m" "$1"
}

_red() {
  printf "\033[${_font};31;31m%s\033[0m" "$1"
}

_green() {
  printf '\033[1;31;32m%s\033[0m' "$1"
}

_yellow() {
  printf '\033[1;31;33m%s\033[0m' "$1"
}

_blue() {
  printf '\033[1;31;34m%s\033[0m' "$1"
}

_magenta() {
  printf '\033[1;31;35m%s\033[0m' "$1"
}

_cyan() {
  printf '\033[1;31;36m%s\033[0m' "$1"
}

_white() {
  printf '\033[1;31;37m%s\033[0m' "$1"
}

_info() {
  _green "[Info] "
  printf -- "%s" "$1"
  printf "\n"
}

_warn() {
  _yellow "[Warning] "
  printf -- "%s" "$1"
  printf "\n"
}

_error() {
  _red "[Error] "
  printf -- "%s" "$1"
  printf "\n"
  exit 1
}

function color() {
  local color=$1 font=$2 text=$3

  if [[ -z ${text} ]]; then
    text=${font}
    font=bold
  fi

  shift

  case $font in
    bold | b)
      style=1
      shift
      ;;
    dark | d)
      style=2
      shift
      ;;
    italic | i)
      style=3
      shift
      ;;
    underline | u)
      style=4
      shift
      ;;
    normal | n)
      style=5
      shift
      ;;
    # Backgroud reverse
    inverse | in)
      style=7
      shift
      ;;
    # delete line
    strikethrough | s)
      style=9
      shift
      ;;
  esac
  style=9
  case $color in
    gray) printf "\033[${style};31;30m%s\033[0m" "${text}" ;;
    red | r) printf "\033[${style};31;31m%s\033[0m" "${text}" ;;
    green | g) printf "\033[${style};31;32m%s\033[0m" "${text}" ;;
    yellow | y) printf "\033[${style};31;33m%s\033[0m" "${text}" ;;
    blue | bl) printf "\033[${style};31;34m%s\033[0m" "${text}" ;;
    magenta | m) printf "\033[${style};31;35m%s\033[0m" "${text}" ;;
    cyan | c) printf "\033[${style};31;36m%s\033[0m" "${text}" ;;
    white | w) printf "\033[${style};31;37m%s\033[0m" "${text}" ;;
    *) echo -e "${text}" ;;
  esac
}

color cyan b "$@"
# _red "$@"
