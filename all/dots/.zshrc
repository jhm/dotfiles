# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="jhm"

# Aliases
alias emacs="emacs -nw"
alias ls="ls -l"

# Disable auto-setting the terminal title.
DISABLE_AUTO_TITLE="true"

# Enabled plugins.
plugins=(cabal git python ruby)

source $ZSH/oh-my-zsh.sh

BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# User configuration.
export EDITOR=vim

export PATH=$HOME/.bin:$HOME/.pub-cache/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin
