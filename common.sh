#!/usr/bin/env bash

info() { echo "$(printf "\r  [ \033[00;34m..\033[0m ]")$DIR $*"; }

user() { echo "$(printf "\r  [ \033[0;33m??\033[0m ]")$DIR $*"; }

success() { echo "$(printf "\r\033[2K  [ \033[00;32mOK\033[0m ]")$DIR $*"; }

fail() { echo "$(printf "\r\033[2K  [\033[0;31mFAIL\033[0m]")$DIR $*"; exit 1; }

dot_detect_os() {
	case "$(uname -s)" in
		Darwin*) DOTFILES_OS=mac ;;
		Linux*) DOTFILES_OS=linux ;;
		*) fail "Unrecognized OS" ;;
	esac
}

skip_all=
overwrite_all=

dot_install_symlink() {
	#echo $1 $2
	local src=$1
	local target=$2

	local overwrite=
	local skip=

	if [ -e "$target" ] || [ -L "$target" ]; then
		[ "$skip_all" = "true" ] && { info "$target exists, skipping..."; return; }
		if [ "$overwrite_all" != "true" ]; then
			user "Symlink '$target' exists: [s]kip, [S]kip all, [o]verwrite, [O]verwrite all"
			local action=
			read -n 1 action
			case "$action" in
				o) overwrite=true ;;
				O) overwrite_all=true ;;
				s) skip=true ;;
				S) skip_all=true ;;
				*) fail "aborted" ;;
			esac
		fi
	fi

	if [ "$skip" = "true" ] || [ "$skip_all" = "true" ] ; then return ; fi
	if [ "$overwrite" = "true" ] || [ "$overwrite_all" = "true" ] ; then FLAGS=f ; fi

	ln -s$FLAGS $src $target
	success "Symlink $target -> $src created"
}

dot_install_directory() {
	if [ -d "$1" ] ; then
		info "Directory '$1' exists"
	else
		mkdir -p "$1"
		success "Directory '$1' created"
	fi
}
