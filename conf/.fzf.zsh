# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${FZF_PATH}/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------

[ -f "${FZF_PATH}/shell/key-bindings.zsh" ] && source "${FZF_PATH}/shell/key-bindings.zsh"

