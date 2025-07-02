#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2025-04-06 22:36:27
 # @LastEditTime: 2025-04-11 10:14:15
 # @LastEditors: Cloudflying
 # @Description:
###
if [[ -f "/usr/local/bin/brew" ]]; then
  export HOMEBREW_NO_AUTO_UPDATE=true
  export HOMEBREW_NO_ENV_HINTS=true
  # export HOMEBREW_INSTALL_FROM_API=1

  # export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
  # export HOMEBREW_API_DOMAIN="https://mirrors.aliyun.com/homebrew-bottles/api"
  export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"

  # export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
  # export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.aliyun.com/homebrew/brew.git"
  export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"

  # export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
  # export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.aliyun.com/homebrew/homebrew-core.git"
  export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"

  # export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
  export HOMEBREW_PIP_INDEX_URL="http://mirrors.aliyun.com/pypi/simple/"

  # aliyun 更新速度慢
  # export HOMEBREW_BOTTLE_DOMAIN="https://pods.xie.ke/homebrew-bottles"
  # export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.cloud.tencent.com/homebrew-bottles/bottles"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
  # export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
  # export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
fi
