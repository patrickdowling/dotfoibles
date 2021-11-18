alias cls='clear'

alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

alias zrc="${EDITOR} ${ZDOTDIR}/.zshrc"

alias dotfiles="cd $DOT_ROOT"

if [ "$ZOS" = "macos" ]; then
    alias ls="ls -G"
    alias grep="grep -G"
    alias fgrep="fgrep -G"
    alias egrep="egrep -G"
else
    alias ls="ls --color=auto"
    alias grep="grep --color=auto"
    alias fgrep="fgrep --color=auto"
    alias egrep="egrep --color=auto"
fi

alias ll="ls -alFh"
alias la="ls -A"
alias l="ls -CF"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd -${index}"; unset index

alias md='mkdir -p'
alias rd='rmdir'

alias paths='echo $PATH | tr ":" "\n"'
alias fpaths='echo $FPATH | tr ":" "\n"'
