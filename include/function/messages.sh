#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-06-27 00:05:53
 # @LastEditTime: 2026-06-27 01:23:21
 # @LastEditors: Cloudflying
 # @Description: Messages Function
###

_red()
{
  printf '\033[1;31;31m%b\033[0m' "$1"
}

_green()
{
  printf '\033[1;31;32m%b\033[0m' "$1"
}

_yellow()
{
  printf '\033[1;31;33m%b\033[0m' "$1"
}

_info()
{
  _green "[Info] "
  printf -- "%s" "$1"
  printf "\n"
}

_warn()
{
  _yellow "[Warning] "
  printf -- "%s" "$1"
  printf "\n"
}

_error()
{
  _red "[Error] "
  printf -- "%s" "$1"
  printf "\n"
  exit 1
}