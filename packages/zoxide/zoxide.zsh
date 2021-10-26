# There's a .plugin.zsh in the github but we've installed the binary.
# https://github.com/ajeetdsouza/zoxide

export _ZO_DATA_DIR=$HOME/.cache/zoxide
export _ZO_EXCLUDE_DIRS=$HOME/.ssh

eval "$(zoxide init zsh)"

alias zqls='zoxide query -ls'
