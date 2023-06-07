PROMPT=" %F{yellow}%n%f@%F{yellow}% %m%f :: %F{blue}%~%f %F{green}»%f "

alias ls='ls -G'
alias grep='grep --color=auto'

export GOPATH=$HOME/.gopath
export GOBIN=$GOPATH/bin
export PATH="$GOBIN:/usr/local/go/bin:$HOME/.local/bin:$PATH"
