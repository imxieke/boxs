#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2023-03-27 20:24:49
# @LastEditTime: 2024-12-31 10:10:02
# @LastEditors: Cloudflying
# @Description: Node Init
###

_install()
{
  # Fabulously kill processes. Cross-platform
  npm i -g pnpm

  pnpm add -g typescript

  pnpm add -g bower yarn bun

  # Pack
  pnpm add -g grunt gulp-cli webpack webpack-cli rollup esbuild vite
  pnpm add -g fkill-cli
  pnpm add -g fx
  pnpm add -g tldr @electron/asar apidoc

  # Bug Scanner
  # pnpm add -g snyk@latest

  pnpm add -g prettier

  pnpm add -g neovim
  pnpm add -g pm2

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
  pnpm add -g @prettier/plugin-ruby \
    prettier-plugin-sh \
    prettier-plugin-sql \
    prettier-plugin-java \
    prettier-plugin-solidity \
    prettier-plugin-kotlin \
    @prettier/plugin-php \
    @prettier/plugin-xml

  # Frontend
  pnpm add -g prettier-plugin-wxml @shufo/prettier-plugin-blade

  # Lint
  pnpm add -g dockerfile_lint dockerlint dockerfilelint

  # Conf
  pnpm add -g prettier-plugin-nginx

  # Documents
  pnpm add -g prettier-plugin-latex

  # Salesforce Apex
  pnpm add -g prettier-plugin-apex

  # Other
  pnpm add -g prettier-plugin-ssh-config prettier-plugin-ini prettier-plugin-pkg prettier-plugin-toml

  # 用不到
  # @shopify/prettier-plugin-liquid prettier-plugin-go-template eslint-plugin-prettier-vue prettier-plugin-tvmsolidity @prettier/plugin-pug
  pnpm add -g eslint eslint-plugin-jsonc eslint-plugin-json

  # Lint
  pnpm add -g sql-lint
  pnpm add -g jsonlint

  pnpm add -g npm-run-all
}

_install
