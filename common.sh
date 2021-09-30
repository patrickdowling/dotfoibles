#!/usr/bin/env bash


info() { echo "$(printf "\r  [ \033[00;34m..\033[0m ]") $*"; }

user() { echo "$(printf "\r  [ \033[0;33m??\033[0m ]") $*"; }

success() { echo "$(printf "\r\033[2K  [ \033[00;32mOK\033[0m ]") $*"; }

fail() { echo "$(printf "\r\033[2K  [\033[0;31mFAIL\033[0m]") $*"; exit 1; }


DOTFILES_OS=
if [ "$(uname -s)" = "Darwin" ] ; then DOTFILES_OS="mac" ; fi
if [ "$(uname -s)" = "Linux" ] ; then DOTFILES_OS="linux" ; fi

