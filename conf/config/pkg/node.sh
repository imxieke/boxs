#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 21:18:43
 # @LastEditTime: 2026-01-14 11:49:59
 # @LastEditors: Cloudflying
# @Description: Node Config
###

# export NVM_NODEJS_ORG_MIRROR=http://mirrors.ustc.edu.cn/node
export NVM_NODEJS_ORG_MIRROR=https://registry.npmmirror.com/-/binary/node
# export NVM_NODEJS_ORG_MIRROR=https://mirrors.huaweicloud.com/nodejs/
export NVM_IOJS_ORG_MIRROR=https://mirrors.huaweicloud.com/iojs/

# export NPM_CONFIG_REGISTRY=https://registry.yarnpkg.com/
# export NPM_CONFIG_REGISTRY=https://registry.npmjs.org/
# export NPM_CONFIG_REGISTRY=https://registry.npmmirror.com/
export NPM_CONFIG_REGISTRY=http://mirrors.tencent.com/npm/
# export NPM_CONFIG_REGISTRY=https://mirrors.huaweicloud.com/repository/npm/

export NVM_DIR="${HOME}/.local/share/nvm"
export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
export NO_STRIP=true