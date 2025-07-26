#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2023-03-27 20:24:49
# @LastEditTime: 2025-01-11 22:56:05
# @LastEditors: Cloudflying
# @Description: Node Init
###

__mcp()
{
  pnpm add -g @mcpmarket/mcp-auto-installer

  pnpm add -g @modelcontextprotocol/server-everything
  pnpm add -g @modelcontextprotocol/server-memory
  pnpm add -g @modelcontextprotocol/server-aws-kb-retrieval
  pnpm add -g @modelcontextprotocol/server-brave-search
  pnpm add -g @modelcontextprotocol/server-filesystem
  pnpm add -g @modelcontextprotocol/server-gdrive
  pnpm add -g @modelcontextprotocol/server-gitlab
  pnpm add -g mcp-remote
}

_install()
{
  # Fabulously kill processes. Cross-platform
  npm i -g pnpm

  # vsce VSCode Extension Manager
  pnpm add -g typescript \
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
  pnpm add -g grunt \
    gulp-cli \
    webpack \
    webpack-cli \
    rollup \
    esbuild \
    vite

  # Bug Scanner
  # pnpm add -g snyk@latest
  # TypeScript Execute (tsx): Node.js enhanced with esbuild to run TypeScript & ESM files
  pnpm add -g tsx

  # intelephense php autocomplete PHP language server
  # tsserver typescript-language-server
  # https://github.com/hrsh7th/vscode-langservers-extracted
  # https://github.com/joe-re/sql-language-server
  pnpm add -g intelephense \
    bash-language-server \
    typescript-language-server \
    yaml-language-server-parser \
    dockerfile-language-server-nodejs \
    @microsoft/compose-language-service \
    vscode-langservers-extracted \
    sql-language-server

  # Language
  pnpm add -g prettier \
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
  pnpm add -g prettier-plugin-wxml \
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
  pnpm add -g eslint \
    eslint-plugin-jsonc \
    eslint-plugin-json

  # Lint
  pnpm add -g sql-lint \
    jsonlint \
    dockerlint \
    dockerfilelint \
    dockerfile_lint

  # 支付宝小程序 Cli
  pnpm add -g minidev
  pnpm add -g @qodo/command
  pnpm add -g @google/gemini-cli
}

_install
