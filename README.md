# dotfiles

Linux and OS X configuration files.

## Installation

Clone the repository:
```sh
git clone https://github.com/jhm/dotfiles.git ~/.dotfiles
```

Initialize and update the submodules:
```sh
cd ~/.dotfiles
git submodule init
git submodule update
```

Run the install script:
```sh
./install.sh
```

This will symlink all the appropriate files and directories in `~` and
`~/bin`.

You'll then have to edit ~/.zshrc and select a zsh
theme. Alternatively, you can download the theme I use
[here](https://gist.github.com/jhm/57e80b366ee4dc9cb70e) and place it
in ~/.oh-my-zsh/themes/jhm.zsh-theme.

## File Layout

- `all` - Platform independent files.
- `linux` - Linux specific files.
- `osx` - OS X specific files.

Each of the above sub-directories has a `bin` and a `dots` directory
that will be linked depending on the current platform. By default, all
of the files in the `bin` directory will be linked in `~/bin` and
all of the files in the `dots` directory will be linked in `~`.


## Inspiration

Largely inspired by [Zach Holman's dotfiles](https://github.com/holman/dotfiles) 
and a desire to rid myself of a decades worth of unorganized cruft.

## License

MIT. See [LICENSE.txt](https://github.com/jhm/dotfiles/blob/master/LICENSE.txt).
