#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-05-14 02:27:58
 # @LastEditTime: 2023-05-14 03:05:55
 # @LastEditors: Cloudflying
 # @Description: RoadRunner Installer
### 


latest_version=$(curl -sI https://github.com/roadrunner-server/roadrunner/releases/latest | grep location | awk -F 'location:' '{print $2}')

echo "${latest_version}"