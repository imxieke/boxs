#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 21:20:10
 # @LastEditTime: 2026-01-15 10:06:42
 # @LastEditors: Cloudflying
# @Description: System Proxy Config
###

# Proxy
# 配置代理
if [[ -n ${MIXED_PROXY} ]]; then
  export http_proxy=http://${MIXED_PROXY}
  export https_proxy=http://${MIXED_PROXY}
  export rsync_proxy=http://${MIXED_PROXY}
  export ftp_proxy=http://${MIXED_PROXY}
  export all_proxy=http://${MIXED_PROXY}
  export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com,.dev.xie.ke"
fi

if [[ "$(uname -s)" == 'Darwin' ]]; then
  HOST_IP_CMD="ifconfig"
elif [[ "$(uname -s)" == 'Linux' ]]; then
  HOST_IP_CMD="ip addr"
fi

export PROXY_ADDR="http://$(${HOST_IP_CMD} | grep "inet " | grep -Ev "docker|host lo| global lo|br-|/16|/8|127.0" | awk -F " " '{print $2}' | awk -F "/" '{print $1}' | head -n 1):7890"

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

  for proxy in ${PROXY_LISTS[*]}; do
    unset "${proxy}"
  done
}