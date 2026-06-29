#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-03-04 00:31:07
 # @LastEditTime: 2026-03-04 00:32:11
 # @LastEditors: Cloudflying
 # @Description: Shell Utils
###

_bsync()
{
  rsync -avz --progress "$1" "$2"
}