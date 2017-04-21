# dotfiles

Personal configuration files.

## Installation

Clone the repository:
```sh
git clone https://github.com/jhm/dotfiles.git ~/.dotfiles
```

The dotfiles are managed with [GNU Stow](https://www.gnu.org/software/stow).
For example, `stow tmux` will symlink the tmux configuration files found in the
tmux directory to your home directory.

### Irssi

Edit the `~/.irssi/config` to setup your IRC details. Once you've done so, it's
a good idea to ignore future changes on the irssi config file so that your
connection details are never accidentally uploaded to a public repository.

```sh
git update-index --assume-unchanged ./irssi/config
```

### Shell Colors

For shell colors I use Base 16.

* [Gnome Terminal](https://github.com/aaron-williamson/base16-gnome-terminal)

```sh
git clone https://github.com/aaron-williamson/base16-gnome-terminal.git ~/.config/base16-gnome-terminal
.config/base16-gnome-terminal/color-scripts/base16-default-dark.sh
```

* [Shell](https://github.com/chriskempson/base16-shell)

```sh
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
```

### Vim

The vim configuration requires Vundle and YouCompleteMe to be installed
manually.

* [Vundle](https://github.com/VundleVim/Vundle.vim)
* [YouCompleteMe](https://valloric.github.io/YouCompleteMe)

### Zsh

The zsh configuration requires `oh-my-zsh` to be installed manually.

* [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)


You'll then have to edit `~/.zshrc` and select a zsh theme. The theme I use can
be found [here](https://gist.github.com/jhm/57e80b366ee4dc9cb70e) and it needs
to be placed in the `~/.oh-my-zsh/themes` directory.

## License

MIT. See [LICENSE.txt](https://github.com/jhm/dotfiles/blob/master/LICENSE.txt).
