#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2025-12-20 19:00:53
 # @LastEditTime: 2025-12-20 19:02:39
 # @LastEditors: Cloudflying
 # @Description: Ollama Config
###

export OLLAMA_MODELS=${HOME}/.ollama
export OLLAMA_NUM_PARALLEL=1

mkdir -p "${OLLAMA_MODELS}"