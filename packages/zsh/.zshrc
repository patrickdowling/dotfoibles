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
export ZOS=$(detect_os)

###
## PLUGINS
#
zsh_file_source "$ZDOTDIR/.p10k.zsh"
zsh_plugins_add "romkatv/powerlevel10k" "powerlevel10k.zsh-theme"
zsh_plugins_add "zsh-users/zsh-syntax-highlighting" # Hm, supposedly must be sourced last?
zsh_plugins_add "hlissner/zsh-autopair"

source "$ZDOTDIR/zsh-settings"

###
## EXPORTS
#
export EDITOR=nvim
export GIT_EDITOR=${EDITOR}
export VISUAL=${EDITOR}
export LC_ALL=en_US.UTF-8

###
## COMPLETION
#
autoload -Uz compinit && compinit -d "$ZSH_CACHE_DIR/.zcompcache"

unsetopt menu_complete
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR/.zcompcache"

zstyle ':completion:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'expand'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' insert-tab pending

zmodload zsh/complist

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

export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="/Users/pat/Library/Python/2.7/bin:/usr/local/opt/avr-gcc@9/bin:$PATH"
zsh_file_source $HOME/.cargo/env
export PATH="/usr/local/anaconda3/bin:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

zsh_file_source ~/.fzf.zsh
