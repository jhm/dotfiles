#!/usr/bin/env bash
#
# Installs the dotfiles in the current user's home directory.

set -o errexit
set -o nounset
set -o pipefail

readonly DOTFILES_ROOT="$(pwd)"
readonly DOT_DIR="$HOME"
readonly BIN_DIR="$HOME/.bin"

overwrite_all=false
skip_all=false
overwrite=false
skip=false

info () {
    printf "  [ \033[00;34m..\033[0m ] $1\n"
}

prompt () {
    printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r\033[2K  [ \033[0;31mFAIL\033[0m ] $1\n"
    echo ''
    exit
}

link_file () {
    local source="$1"
    local target="$2"

    if [[ -e $target ]]; then
        overwrite=false
        skip=false

        if [[ "$overwrite_all" == "false" && "$skip_all" == "false" ]]; then
            promptExists
        fi

        if [[ "$overwrite" == "true" || "$overwrite_all" == "true" ]]; then
            rm -rf $target
            success "Removed $target"
        fi

        if [[ "$skip" == "false" && "$skip_all" == "false" ]]; then
            ln -s $source $target
            success "Linked $source to $target"
        else
            success "Skipped $source"
        fi
    else
        ln -s $source $target
        success "Linked $source to $target"
    fi
}


promptExists () {
    prompt "File exists: $target [s]kip, [S]kip all, [o]verwrite, [O]verwrite all?"
    read -n 1 action

    case $action in
        o ) overwrite=true ;;
        O ) overwrite_all=true ;;
        s ) skip=true ;;
        S ) skip_all=true ;;
        * ) promptExists ;;
    esac
}


link_dotfiles () {
    target="$1"
    for source in $(find "$target" -mindepth 1 -maxdepth 1); do
        target="$DOT_DIR/$(basename $source)"
        link_file $source $target
    done
}

link_bins () {
    target="$1"

    [[ -d "$BIN_DIR" ]] || mkdir "$BIN_DIR"

    for source in $(find "$target" -mindepth 1 -maxdepth 1); do
        target="$BIN_DIR/$(basename $source)"
        link_file $source $target
    done
}

info "Linking cross-platform dot files"
link_dotfiles "$DOTFILES_ROOT/all/dots"

info "Linking cross-platform executable files"
link_bins "$DOTFILES_ROOT/all/bin"

dist="$(uname)"
if [[ "$dist" == "Darwin" ]]; then
    info "Linking OS X dotfiles"
    link_dotfiles "$DOTFILES_ROOT/osx/dots"

    info "Linking OS X executable files"
    link_bins "$DOTFILES_ROOT/osx/bin"
elif [[ "$dist" == "Linux" ]]; then
    info "Linking Linux dotfiles"
    link_dotfiles "$DOTFILES_ROOT/linux/dots"

    info "Linking Linux executable files"
    link_dotfiles "$DOTFILES_ROOT/linux/bin"
fi
