#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-06-26 23:08:18
 # @LastEditTime: 2026-06-26 23:23:18
 # @LastEditors: Cloudflying
 # @Description: Nali Go
###

VER=0.8.1
URL="https://github.com/zu1k/nali/releases/download/v${VER}/nali-linux-amd64-v${VER}.gz"

echo "Downloading nali..."
mkdir -p "${HOME}"/.bin
cd /tmp || exit 1
wget -qO nali.gz "${URL}"
gzip -d nali.gz
mv nali "${HOME}"/.bin/nali
chmod +x "${HOME}"/.bin/nali