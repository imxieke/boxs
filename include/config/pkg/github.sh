#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-03-04 20:48:07
 # @LastEditTime: 2026-03-04 20:48:08
 # @LastEditors: Cloudflying
 # @Description: Github Config
###

# Github Cli
if [[ -n ${GITHUB_TOKEN} ]]; then
  export GH_TOKEN=${GITHUB_TOKEN}
fi