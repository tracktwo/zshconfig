HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd
unsetopt beep

zle-keymap-select() {
    if [ $KEYMAP = vicmd ]; then
        printf "\033[2 q"
    else
        printf "\033[6 q"
    fi
}

zle -N zle-keymap-select

zle-line-init() {
    zle -K viins
    printf "\033[6 q"
}

zle -N zle-line-init

bindkey -v
bindkey -v '^?' backward-delete-char

alias ls='ls --color=auto'
source $ZDOTDIR/zsh-fzf-history-search/zsh-fzf-history-search.zsh

fpath+=($ZDOTDIR/agkozak-zsh-prompt)
autoload promptinit; promptinit
prompt agkozak-zsh-prompt
