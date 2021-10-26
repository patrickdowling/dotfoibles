#!/usr/bin/env bash

ZSH_CONFIG_DIR="$HOME/.config/zsh"
ZSH_CACHE_DIR="$HOME/.cache/zsh"

dot_install_symlink "$(realpath .)" "$ZSH_CONFIG_DIR"
dot_install_directory "$ZSH_CACHE_DIR"
dot_install_directory "$ZSH_CACHE_DIR/.zcompcache"
