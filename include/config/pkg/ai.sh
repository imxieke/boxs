#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-01-15 19:54:55
 # @LastEditTime: 2026-01-15 20:04:08
 # @LastEditors: Cloudflying
 # @Description: AI Config
###

# Ollama
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

# LocalAI
# https://localai.io/reference/cli-reference/

export LOCALAI_ADDRESS="127.0.0.1:8080"
export LOCALAI_PATH="${HOME}/.localai"
export LOCALAI_MODELS_PATH="${HOME}/.localai/models"
# error,warn,info,debug,trace
export LOCALAI_LOG_LEVEL="info"
export LOCALAI_GENERATED_CONTENT_PATH="${HOME}/.localai/generated/content"
export LOCALAI_UPLOAD_PATH="${HOME}/.localai/uploads"
export LOCALAI_CONFIG_DIR="${HOME}/.localai/config"
export LOCALAI_BACKENDS_PATH="${HOME}/.localai/backends"
export LOCALAI_PARALLEL_REQUESTS=true
export LOCALAI_MAX_ACTIVE_BACKENDS=0
# Enable GPU acceleration
export LOCALAI_F16=true