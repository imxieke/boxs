# terminal coloring
export CLICOLOR=1
export LSCOLORS=dxFxCxDxBxegedabagacad

# zsh 自带颜色变量
# $fg[color]
# $fg_bold[color]
# $fg_no_bold[color]
# 背景颜色
# $bg[color]
# $bg_bold[color]
# $bg_no_bold[color]
# 清除颜色
# $reset_color

# Text Color
c_black="\e[30m"
c_red="\e[31m"
c_green="\e[32m"
c_yellow="\e[33m"
c_blue="\e[34m"
c_purple="\e[35m"
c_lightblue="\e[36m"
# 灰白色
c_gray="\e[37m"

# Backgroud Color
b_black="\e[40m"
b_red="\e[41m"
b_green="\e[42m"
b_yellow="\e[43m"
b_blue="\e[44m"
b_purple="\e[45m"
b_lightblue="\e[46m"
# 灰白色
b_gray="\e[47m"

# 重置为默认 无颜色
c_rest="\e[0m"
# 高亮显示 突出蓝色文字
t_highlight="\e[1m"
# 灰色文字 类似灰色文字显示
t_highlight="\e[2m"
# 下划线
t_underline="\e[4m"
# 文字闪烁 macOS iTerm2 无反应
t_flicker="\e[5m"
# 反白显示 类似灰色背景
t_reverse="\e[7m"
# 文字中间删除线
t_deleteline="\e[9m"

git_time_since_commit() {
    local COLOR MINUTES HOURS DAYS SUB_HOURS SUB_MINUTES
    local last_commit seconds_since_last_commit

    if ! last_commit=$(command git log --pretty=format:'%at' -1 2>/dev/null); then
        # echo "[$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL~%{$reset_color%}]"
        return
    fi

    seconds_since_last_commit=$(( EPOCHSECONDS - last_commit ))
    MINUTES=$(( seconds_since_last_commit / 60 ))
    HOURS=$(( MINUTES / 60 ))

    DAYS=$(( HOURS / 24 ))
    SUB_HOURS=$(( HOURS % 24 ))
    SUB_MINUTES=$(( MINUTES % 60 ))

    if [[ -z "$(command git status -s 2>/dev/null)" ]]; then
        COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
    else
        if [[ "$MINUTES" -gt 30 ]]; then
            COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
        elif [[ "$MINUTES" -gt 10 ]]; then
            COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
        else
            COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
        fi
    fi

    if [ "$USER" = "root" ]; then
        return
    else
        if [[ "$HOURS" -gt 24 ]]; then
            echo "$GITTIMEBEFORE${COLOR}${DAYS}d ${SUB_HOURS}H ${SUB_MINUTES}m$GITTIMEAFTER$SEPARATOR"
        elif [[ "$MINUTES" -gt 60 ]]; then
            echo "$GITTIMEBEFORE${COLOR}${HOURS}H ${SUB_MINUTES}m$GITTIMEAFTER$SEPARATOR"
        else
            echo "$GITTIMEBEFORE${COLOR}${MINUTES}m$GITTIMEAFTER$SEPARATOR"
        fi
    fi
    
}

local get_last_cmd_status()
{
	print -P %?
}

if [[ "$(get_last_cmd_status)" -ne 0 ]]; then
	LATST_CMD_STATUS='x'
else
	LATST_CMD_STATUS='√'
fi

# Color Output
local _c()
{
	echo -e "$reset_color $fg[$1] $2 $reset_color"
}

if [[ "$(uname -s)" == 'Darwin' ]]; then
	OS_ICON=''
elif [[ -n "$(grep -i 'Manjaro' /etc/os-release)" ]]; then
	OS_ICON=''
elif [[ -n "$(grep -i 'ubuntu' /etc/os-release)" ]]; then
	OS_ICON=''
elif [[ -n "$(grep -i 'debian' /etc/os-release)" ]]; then
	OS_ICON=''
elif [[ -n "$(grep -i 'archlinux' /etc/os-release)" ]]; then
	OS_ICON=''
elif [[ -n "$(grep -i 'alpine' /etc/os-release)" ]]; then
	OS_ICON=''
elif [[ -n "$(grep -i 'centos' /etc/os-release)" ]]; then
	OS_ICON=''
elif [[ -n "$(grep -i 'fedora' /etc/os-release)" ]]; then
	OS_ICON=''
elif [[ "$(uname -s)" == 'Linux' ]]; then
	OS_ICON=''
else
	OS_ICON=''
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}on "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{$fg[red]%} ✘ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED=true
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX="%{$fg[yellow]%})%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" +"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR=%{$fg[green]%}

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=" -"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR=%{$fg[red]%}

# Git status info
if [[ -d "$(pwd)/.git" ]]; then
	GIT_STATUS_UNTRACKER=$(git status --porcelain | grep '^??' | wc -l| sed 's# ##g')
	GIT_STATUS_DELETE=$(git status --porcelain | grep '^ D' | wc -l| sed 's# ##g')
	GIT_STATUS_ADD=$(git status --porcelain | grep '^A' | wc -l| sed 's# ##g')
	GIT_STATUS_MODIFY=$(git status --porcelain | grep '^ M' | wc -l| sed 's# ##g')
fi

PROMPT="
╭─${fg[yellow]}${reset_color}"
# OS Icon
PROMPT+="${bg[yellow]} ${fg[black]}${OS_ICON} %{$reset_color%}${bg[red]}"
PROMPT+="%{$fg[yellow]%} %{$reset_color%}"
# user@hostname
PROMPT+="%{$bg[red]%}%n@%m %{$reset_color%}"
PROMPT+="${bg[green]}%{$fg[red]%}%{$reset_color%}"
# current directory
PROMPT+="%{$bg[green]%}%{$fg[black]%}  in %~ %{$reset_color%}"
PROMPT+="%{$bg[blue]%}%{$fg[green]%} %{$reset_color%}"
# Git info
# PROMPT+="%{$fg[blue]%}%{$fg[red]%} $(git_prompt_info)$(git_remote_status)%{$reset_color%}"
# Commit at $(git_time_since_commit)
PROMPT+="%{$bg[blue]%}%{$fg[black]%} on   $(git_current_branch) +${GIT_STATUS_ADD} -${GIT_STATUS_DELETE} ?${GIT_STATUS_MODIFY} ?${GIT_STATUS_UNTRACKER} ▓▒░%{$reset_color%}"
PROMPT+="
╰\$ "

RPROMPT="%{$fg[red]%}░▒▓${LATST_CMD_STATUS}%{$reset_color%}%{$bg[red]%}%n@%m  in %~ %{$reset_color%}"
RPROMPT+="%{$bg[red]%}%{$fg[white]%}%{$reset_color%}"
# Date
RPROMPT+="%{$bg[white]%}%{$fg[black]%} at $(date "+%r")%{$reset_color%}"
RPROMPT+="%{$bg[white]%}%{$fg[white]%}%{$reset_color%}"
RPROMPT+="%{$fg[white]%}%{$reset_color%}"
# PROMPT='%{$fg_bold[cyan]%}%n@%m %{$fg_bold[yellow]%}🗀 /%{$fg_bold[blue]%}%p%{$fg_bold[blue]%}[%{$fg[cyan]%}%c%{$fg_bold[blue]%}] $(git_prompt_info)%{$fg_bold[green]%}➜ %{$reset_color%}'
