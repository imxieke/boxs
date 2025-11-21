#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2025-11-21 14:52:05
# @LastEditTime: 2025-11-21 14:54:32
# @LastEditors: Cloudflying
# @Description: MCP Init
###

_node()
{
  pnpm i -g 12306-mcp
  pnpm i -g @mcpmarket/mcp-auto-installer

  pnpm i -g @modelcontextprotocol/server-everything
  pnpm i -g @modelcontextprotocol/server-memory
  pnpm i -g @modelcontextprotocol/server-aws-kb-retrieval
  pnpm i -g @modelcontextprotocol/server-brave-search
  pnpm i -g @modelcontextprotocol/server-filesystem
  pnpm i -g @modelcontextprotocol/server-gdrive
  pnpm i -g @modelcontextprotocol/server-gitlab
  pnpm i -g mcp-remote
  pnpm i -g @antv/mcp-server-antv
  pnpm i -g @alipay/mcp-server-alipay
}
