BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

PROMPT=" %F{yellow}%n%f@%F{yellow}% %m%f :: %F{blue}%~%f %F{green}»%f "

alias ls='ls -G'
alias grep='grep --color=auto'

export GOPATH=$HOME/.gopath
export GOBIN=$GOPATH/bin
export PATH="$GOBIN:$PATH"
