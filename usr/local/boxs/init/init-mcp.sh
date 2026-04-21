#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2025-11-21 14:52:05
 # @LastEditTime: 2026-04-21 15:14:38
 # @LastEditors: Cloudflying
# @Description: MCP Init
###

_pip()
{
  pip install --break-system-packages
}

_python()
{
  _pip mcp-server-fetch
  _pip mcp-server-git
  _pip mcp-server-time
  # https://github.com/nickclyde/duckduckgo-mcp-server
  _pip duckduckgo-mcp-server
  # https://github.com/modelcontextprotocol/servers-archived/tree/main/src/sqlite
  _pip mcp-server-sqlite
  _pip 'markitdown[all]'
}

_node()
{
  bun i -g 12306-mcp
  # https://github.com/microsoft/playwright-mcp
  bun i -g @playwright/mcp
  bun i -g @mcpmarket/mcp-auto-install

  bun i -g @modelcontextprotocol/server-everything
  bun i -g @modelcontextprotocol/server-memory
  bun i -g @modelcontextprotocol/server-aws-kb-retrieval
  bun i -g @modelcontextprotocol/server-brave-search
  bun i -g @modelcontextprotocol/server-filesystem
  bun i -g @modelcontextprotocol/server-gdrive
  bun i -g @modelcontextprotocol/server-gitlab
  bun i -g @modelcontextprotocol/server-sequential-thinking
  bun i -g mcp-remote
  bun i -g grok-search-mcp
  bun i -g bing-cn-mcp
  bun i -g @antv/mcp-server-antv
  bun i -g @alipay/mcp-server-alipay
  bun i -g chrome-devtools-mcp@latest
  bun i -g @modelcontextprotocol/server-everart
  bun i -g @modelcontextprotocol/server-google-maps

  # App
  bun i -g @modelcontextprotocol/server-slack

  # Database
  bun i -g mongodb-mcp-server@latest
  bun i -g @modelcontextprotocol/server-postgres
  bun i -g @modelcontextprotocol/server-redis
  bun i -g @benborla29/mcp-server-mysql

  # Dev
  bun i -g @z_ai/mcp-server
  bun i -g @modelcontextprotocol/server-puppeteer
  bun i -g next-devtools-mcp@latest

  # Productive
  bun i -g @notionhq/notion-mcp-server
}
