#!/usr/bin/env bash

VERSION=$(curl -fsSL "https://cursor.com/install" | grep "DOWNLOAD_URL=" | awk -F "/" '{print $5}')

# https://downloads.cursor.com/lab/2026.07.09-a3815c0/linux/x64/agent-cli-package.tar.gz
# https://downloads.cursor.com/lab/2026.07.09-a3815c0/linux/arm64/agent-cli-package.tar.gz
# https://downloads.cursor.com/lab/2026.07.09-a3815c0/darwin/x64/agent-cli-package.tar.gz
# https://downloads.cursor.com/lab/2026.07.09-a3815c0/darwin/arm64/agent-cli-package.tar.gz
# https://downloads.cursor.com/lab/2026.07.09-a3815c0/windows/arm64/agent-cli-package.zip
# https://downloads.cursor.com/lab/2026.07.09-a3815c0/windows/x64/agent-cli-package.zip