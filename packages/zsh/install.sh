#!/usr/bin/env bash

ZSH_CONFIG_DIR="$HOME/.config/zsh"

dot_install_symlink "$(realpath .)" "$ZSH_CONFIG_DIR"
