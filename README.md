# dotfiles

Personal configuration files.

## Installation

Clone the repository:

```sh
git clone https://github.com/jhm/dotfiles.git ~/.dotfiles
```

The dotfiles are managed with [GNU Stow](https://www.gnu.org/software/stow).
For example, `stow tmux` will symlink the tmux configuration files found in
the tmux directory to your home directory.

### Irssi

Edit the `~/.irssi/config` to setup your IRC details. Once you've done so,
it's a good idea to ignore future changes on the irssi config file so that
your connection details are never accidentally uploaded to a public
repository.

```sh
git update-index --assume-unchanged ./irssi/config
```

### Vim

The vim configuration requires Plug to be installed manually.

* [Plug](https://github.com/junegunn/vim-plug)

Then simply run `:PlugInstall` within vim.

## License

MIT. See [LICENSE.txt](https://github.com/jhm/dotfiles/blob/master/LICENSE.txt).
