#!/usr/bin/env bash

ZSH_CACHE_DIR="$HOME/.cache/zsh"
dot_install_directory "$ZSH_CACHE_DIR/completions"

DST="$ZSH_CACHE_DIR/completions/_docker"
curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker -o "$DST"
