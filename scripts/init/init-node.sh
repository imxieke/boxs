#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2023-03-27 20:24:49
 # @LastEditTime: 2025-12-27 23:46:45
 # @LastEditors: Cloudflying
# @Description: Node Init
###

_install()
{
  # Fabulously kill processes. Cross-platform
  npm i -g pnpm

  # Dev Tools
  pnpm install -g @devcontainers/cli

  # vsce VSCode Extension Manager
  pnpm i -g typescript \
    bower \
    bun \
    fkill-cli \
    fx \
    tldr \
    @electron/asar \
    apidoc \
    neovim \
    pm2 \
    @vscode/vsce

  # Pack
  pnpm i -g grunt \
    gulp-cli \
    webpack \
    webpack-cli \
    rollup \
    esbuild \
    vite

  # Bug Scanner
  # pnpm i -g snyk@latest
  # TypeScript Execute (tsx): Node.js enhanced with esbuild to run TypeScript & ESM files
  pnpm i -g tsx

  # intelephense php autocomplete PHP language server
  # tsserver typescript-language-server
  # https://github.com/hrsh7th/vscode-langservers-extracted
  # https://github.com/joe-re/sql-language-server
  pnpm i -g intelephense \
    bash-language-server \
    typescript-language-server \
    yaml-language-server-parser \
    dockerfile-language-server-nodejs \
    @microsoft/compose-language-service \
    vscode-langservers-extracted \
    sql-language-server

  # Language
  pnpm i -g prettier \
    @prettier/plugin-ruby \
    @prettier/plugin-php \
    @prettier/plugin-xml \
    prettier-plugin-sh \
    prettier-plugin-sql \
    prettier-plugin-java \
    prettier-plugin-solidity \
    prettier-plugin-kotlin

  # Frontend
  # Salesforce Apex
  pnpm i -g prettier-plugin-wxml \
    @shufo/prettier-plugin-blade \
    prettier-plugin-nginx \
    prettier-plugin-latex \
    prettier-plugin-apex \
    prettier-plugin-ssh-config \
    prettier-plugin-ini \
    prettier-plugin-pkg \
    prettier-plugin-toml

  # 用不到
  # @shopify/prettier-plugin-liquid prettier-plugin-go-template eslint-plugin-prettier-vue prettier-plugin-tvmsolidity @prettier/plugin-pug
  pnpm i -g eslint \
    eslint-plugin-jsonc \
    eslint-plugin-json

  # Lint
  pnpm i -g sql-lint \
    jsonlint \
    dockerlint \
    dockerfilelint \
    dockerfile_lint

  # 支付宝小程序 Cli
  pnpm i -g minidev
  pnpm i -g @qodo/command
  pnpm i -g @google/gemini-cli
  pnpm i -g @tencent-ai/codebuddy-code
  pnpm i -g @qwen-code/qwen-code
  pnpm i -g @openai/codex
  pnpm i -g @anthropic-ai/claude-code
  pnpm i -g @vibe-kit/grok-cli
  pnpm i -g @webdevtoday/grok-cli
  pnpm i -g @cloudbase/cli
  pnpm i -g @qoder-ai/qodercli
  pnpm i -g @iflow-ai/iflow-cli
  pnpm i -g @continuedev/cli
  pnpm i -g @github/copilot
  pnpm i -g opencode-ai@latest
  pnpm i -g @volcengine/vecli@latest
  pnpm i -g cline
}

_install
