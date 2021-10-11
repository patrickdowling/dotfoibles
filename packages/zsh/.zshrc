###
## GENERAL OPTIONS
#
setopt auto_cd
setopt extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef # Disable ctrl-s
unsetopt BEEP

###
# HISTORY
#
HISTFILE="$ZSH_CACHE_DIR/zsh_history"
export HISTSIZE=50000        # History lines stored in mememory.
export SAVEHIST=50000        # History lines stored on disk.
setopt inc_append_history    # Immediately append commands to history file.
setopt hist_ignore_all_dups  # Never add duplicate entries.
setopt hist_ignore_space     # Ignore commands that start with a space.
setopt hist_reduce_blanks    # Remove unnecessary blank lines.
setopt share_history

###
## TODO PLUGINS
#
source "$ZDOTDIR/zsh-functions"
source $ZSH_CACHE_DIR/powerlevel10k/powerlevel10k.zsh-theme

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
autoload -Uz compinit && compinit 

unsetopt menu_complete
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZSH_CACHE_DIR:-${HOME}}/.zcompcache"
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

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

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


export PATH="/Users/pat/Library/Python/2.7/bin:/usr/local/opt/avr-gcc@9/bin:$PATH"

source $HOME/.cargo/env
export PATH="/usr/local/anaconda3/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
# Must be sourced last
source $ZSH_CACHE_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

