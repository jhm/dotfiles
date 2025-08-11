HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

bindkey "^R" history-incremental-search-backward
bindkey "^[[1;5A" history-beginning-search-backward
bindkey "^[[1;5B" history-beginning-search-forward

PROMPT=" %F{yellow}%n%f@%F{yellow}% %m%f :: %F{blue}%~%f %F{green}»%f "

alias ls='ls --color -G'
alias grep='grep --color=auto'

export GOPATH=$HOME/.gopath
export GOBIN=$GOPATH/bin
export PATH="$GOBIN:/usr/local/go/bin:$HOME/.local/bin:$PATH"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
