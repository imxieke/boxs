#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-09-04 19:55:18
 # @LastEditTime: 2022-09-07 12:50:40
 # @LastEditors: Cloudflying
 # @Description: Optimize neovim launch speed
 # @FilePath: /nvim/scripts/speedtest.sh
### 

rm -fr /tmp/startime.log
nvim --startuptime /tmp/startime.log ${HOME}/Code/Project/boxs/app/common.php -c ":qa"
cat /tmp/startime.log | sort -k 2
