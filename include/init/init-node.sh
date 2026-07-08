#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2023-03-27 20:24:49
 # @LastEditTime: 2026-06-01 21:53:23
 # @LastEditors: Cloudflying
# @Description: Node Init
###

_install()
{
  # Fabulously kill processes. Cross-platform
  # npm i -g pnpm bun
  # bun i -g bun

  # AI
  bun i -g skills
  bun i -g kanban

  # Dev Tools
  bun i -g @devcontainers/cli

  # vsce VSCode Extension Manager
  bun i -g typescript \
    bower \
    fkill-cli \
    fx \
    tldr \
    @electron/asar \
    apidoc \
    neovim \
    pm2 \
    @vscode/vsce

  # Pack
  bun i -g grunt \
    gulp-cli \
    webpack \
    webpack-cli \
    rollup \
    esbuild \
    vite

  # Bug Scanner
  bun i -g snyk@latest

  # TypeScript Execute (tsx): Node.js enhanced with esbuild to run TypeScript & ESM files
  bun i -g tsx

  # Automation
  bun i -g agent-browser
  bun i -g @playwright/cli@latest

  # intelephense php autocomplete PHP language server
  # tsserver typescript-language-server
  # https://github.com/hrsh7th/vscode-langservers-extracted
  # https://github.com/joe-re/sql-language-server
  bun i -g intelephense \
    bash-language-server \
    typescript-language-server \
    yaml-language-server-parser \
    dockerfile-language-server-nodejs \
    @microsoft/compose-language-service \
    vscode-langservers-extracted \
    sql-language-server

  # Language
  bun i -g prettier \
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
  bun i -g prettier-plugin-wxml \
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
  bun i -g eslint \
    eslint-plugin-jsonc \
    eslint-plugin-json

  # Lint
  bun i -g sql-lint \
    jsonlint \
    dockerlint \
    dockerfilelint \
    dockerfile_lint

  # 支付宝小程序 Cli
  bun i -g minidev
  bun i -g @webdevtoday/grok-cli
  # Tencent CloudBase Cli
  bun i -g @cloudbase/cli
  bun i -g @iflow-ai/iflow-cli
  bun i -g @volcengine/vecli@latest

  # Code Cli
  bun i -g @openai/codex
  bun i -g @google/gemini-cli
  bun i -g @anthropic-ai/claude-code
  bun i -g @qodo/command
  bun i -g @tencent-ai/codebuddy-code
  bun i -g @qwen-code/qwen-code
  bun i -g @qoder-ai/qodercli
  bun i -g @continuedev/cli
  bun i -g @github/copilot
  bun i -g cline
  bun i -g opencode-ai
  bun i -g @mimo-ai/cli

  # Compile
  # bun i -g @perryts/perry
  # Lark
  bun i -g @larksuite/cli@latest

  # Trade
  bun i -g @okx_ai/okx-trade-mcp
  bun i -g @okx_ai/okx-trade-cli
}

_install
