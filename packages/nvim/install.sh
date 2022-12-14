#!/usr/bin/env bash
# set -x

NVIM_CONFIG_DIR="$HOME/.config/nvim"
#dot_install_symlink "$(realpath "./config_nvim")" "$NVIM_CONFIG_DIR"
dot_install_directory "$NVIM_CONFIG_DIR"
dot_install_symlink "$(realpath "./init.lua")" "$NVIM_CONFIG_DIR/init.lua"

#pip3 install neovim
