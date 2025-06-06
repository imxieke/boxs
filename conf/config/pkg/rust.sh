#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2025-01-01 00:41:05
# @LastEditTime: 2025-01-01 01:02:01
# @LastEditors: Cloudflying
# @Description: Rust Config
###

if [[ -n "$(command -v rustup)" ]]; then
  # export RUSTUP_UPDATE_ROOT=https://mirror.sjtu.edu.cn/rust-static/rustup
  # export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
  # export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
  # export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
  export RUSTUP_UPDATE_ROOT=https://mirrors.aliyun.com/rustup/rustup

  # export RUSTUP_DIST_SERVER=https://mirror.sjtu.edu.cn/rust-static
  # export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
  # export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
  # export RUSTUP_DIST_SERVER="https://rsproxy.cn"
  export RUSTUP_DIST_SERVER=https://mirrors.aliyun.com/rustup
fi
