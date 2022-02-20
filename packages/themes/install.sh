#!/usr/bin/env bash

DOT_THEMES=$HOME/.local/share/themes

dot_install_directory $DOT_THEMES

dot_git_clone "fnune/base16-fzf" "$DOT_THEMES"

if [ "$DOT_OS" = "macos" ] ; then
	dot_git_clone "martinlindhe/base16-iterm2" "$DOT_THEMES"
elif [ "$DOT_OS" = "linux" ] ; then
	dot_git_clone "https://github.com/aarowill/base16-gnome-terminal" "$DOT_THEMES"
fi
