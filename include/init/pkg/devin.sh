#!/usr/bin/env bash

# https://static.devin.ai/cli/current/manifest.json

URL=$(curl -fsSL https://static.devin.ai/cli/current/manifest.json | jq -r '.platforms.["x86_64-unknown-linux"].url')