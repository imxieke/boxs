if [[ -n "${FZF_PATH}" ]]; then
  # Auto-completion
  source "${FZF_PATH}/completion.zsh" 2>/dev/null
  # Key bindings
  source "${FZF_PATH}/key-bindings.zsh" 2>/dev/null
fi
