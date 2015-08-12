# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="jhm"

# Aliases
alias ls="ls -l"
alias scala="scala -cp /home/john/.ivy2/cache/org.scalaz/scalaz-core_2.10/jars/scalaz-core_2.10-7.0.3.jar -feature -language:higherKinds"

# Disable auto-setting the terminal title.
DISABLE_AUTO_TITLE="true"

# Enabled plugins.
plugins=(cabal git python)

source $ZSH/oh-my-zsh.sh

# User configuration.
export EDITOR=emacs

export PATH=$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin
