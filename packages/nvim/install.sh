#!/usr/bin/env bash
# set -x

NVIM_CONFIG_DIR="$HOME/.config/nvim"
dot_install_directory "$NVIM_CONFIG_DIR"
dot_install_symlink "$(realpath "./init.vim")" "$NVIM_CONFIG_DIR/init.vim"
