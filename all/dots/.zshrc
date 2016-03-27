# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="jhm"

# Aliases
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias ls="ls -l"

# Disable auto-setting the terminal title.
DISABLE_AUTO_TITLE="true"

# Enabled plugins.
plugins=(cabal git python ruby)

source $ZSH/oh-my-zsh.sh

# User configuration.
export EDITOR=emacs

export PATH=$HOME/.bin:$HOME/.pub-cache/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin
