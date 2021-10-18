###
## PREREQUISITES
#
# Do things here that require user input
stty stop undef # Disable ctrl-s

export EDITOR=nvim
export GIT_EDITOR=${EDITOR}
export VISUAL=${EDITOR}
export LC_ALL=en_US.UTF-8


# P10K INSTANT PROMPT
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$ZDOTDIR/zsh-functions"
export ZOS=$(detect_os)

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

# ls on change of current working directory
(( $+functions[add-zsh-hook] )) || autoload -Uz add-zsh-hook
add-zsh-hook chpwd ls_on_chwd

# Edit and rerun
function edit_and_run() {
	BUFFER="fc"
	zle accept-line
}
zle -N edit_and_run
bindkey "^v" edit_and_run

###
## SOURCE DOFILE PACKAGE ZSH THINGS
#
typeset -U zsh_config_files
zsh_config_files=($DOT_ROOT/packages/**/*.zsh)
for file in ${zsh_config_files}
do
	source "$file"
done

source "$ZDOTDIR/zsh-bindings"

###
## PATHS & THINGS
#
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="/Users/pat/Library/Python/2.7/bin:/usr/local/opt/avr-gcc@9/bin:$PATH"
zsh_file_source $HOME/.cargo/env
export PATH="/usr/local/anaconda3/bin:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

zsh_file_source ~/.fzf.zsh

autopair-init
zsh_plugins_add "zsh-users/zsh-syntax-highlighting" # "must be sourced last"
