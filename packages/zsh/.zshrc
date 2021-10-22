###
## PREREQUISITES
#
# Do things here that require user input
stty stop undef # Disable ctrl-s

# P10K INSTANT PROMPT
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$ZDOTDIR/zsh-functions"
export ZOS=$(zsh_detect_os)

###
## PLUGINS
#
zsh_file_source "$ZDOTDIR/.p10k.zsh"
zsh_plugins_add "romkatv/powerlevel10k" "powerlevel10k.zsh-theme"
zsh_plugins_add "zsh-users/zsh-completions"
AUTOPAIR_INHIBIT_INIT=1
zsh_plugins_add "hlissner/zsh-autopair"

zsh_file_source "$ZDOTDIR/zsh-settings"
zsh_file_source "$ZDOTDIR/zsh-completion"
zsh_file_source "$ZDOTDIR/zsh-paths"

###
## SOURCE DOFILE PACKAGE ZSH THINGS
#
typeset -U zsh_config_files
zsh_config_files=($DOT_ROOT/packages/**/*.zsh)
for file in ${zsh_config_files}
do
	source "$file"
done
unset zsh_config_files

###
## BINDINGS & MISC
#
zsh_file_source "$ZDOTDIR/zsh-bindings"
zsh_file_source ~/.fzf.zsh

autopair-init
zsh_plugins_add "zsh-users/zsh-syntax-highlighting" # "must be sourced last"
