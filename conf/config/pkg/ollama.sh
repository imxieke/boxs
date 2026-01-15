#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2025-12-20 19:00:53
 # @LastEditTime: 2026-01-15 14:50:08
 # @LastEditors: Cloudflying
 # @Description: Ollama Config
###

export OLLAMA_MODELS="${HOME}/.ollama"
# 每个模型同时处理的最大并行请求数
export OLLAMA_NUM_PARALLEL=6
export OLLAMA_HOST=http://127.0.0.1:11434
export OLLAMA_MAX_LOADED_MODELS=0
# Ollama 在繁忙时拒绝额外请求之前会排队的最大请求数
export OLLAMA_MAX_QUEUE=512
export OLLAMA_LOAD_TIMEOUT="5m0s"
export OLLAMA_KEEP_ALIVE="5m0s"
# export OLLAMA_DEBUG="INFO"

mkdir -p "${OLLAMA_MODELS}"