$user = [System.Environment]::GetEnvironmentVariable("USERNAME")
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")

function Put-Path{
    param(
        [string]$Path
    )
    # 检查路径是否已经存在（不区分大小写比较）
    if ($currentPath -and ($currentPath -split ";" | Where-Object { $_.TrimEnd("\") -ieq $Path.TrimEnd("\") })) {
        Write-Host "[信息] 路径已存在于用户 PATH 中，无需修改: $Path" -ForegroundColor Yellow
    } else {
        # 拼接新路径并写入用户环境变量
        $newPath = if ([string]::IsNullOrEmpty($currentPath)) {
            $bunBinPath
        } else {
            "$currentPath;$bunBinPath"
        }

        [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
        Write-Host "[成功] 已将以下路径添加到用户 PATH:" -ForegroundColor Green
        Write-Host "       $bunBinPath" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "[提示] 请重新打开终端/PowerShell 窗口以使更改生效。" -ForegroundColor Yellow
    }
}

$bunBinPath = "$env:USERPROFILE\.bun\bin"

Put-Path $bunBinPath

# echo "$env:USERPROFILE\.bun\bin"