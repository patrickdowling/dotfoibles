#!/usr/bin/env bash

COLOR_RED="\033[0;31m"
COLOR_GREEN="\033[0;32m"
COLOR_BLUE="\033[0;34m"
COLOR_YELLOW="\033[0;33m"
COLOR_RESET="\033[0m"
ESC_CLEAR_LINE="\033[2K"

title() {
	echo -e "\r [${COLOR_BLUE}####${COLOR_RESET}] $*"
}

log() {
	echo -e "\r [${COLOR_BLUE} ** ${COLOR_RESET}]$DIR $*"
}

user() {
	echo -e "\r [${COLOR_YELLOW}????${COLOR_RESET}]$DIR $*"
}

success() {
	echo -e "\r${ESC_CLEAR_LINE} [${COLOR_GREEN} OK ${COLOR_RESET}]$DIR $*"
}

fail() {
	echo -e "\r${ESC_CLEAR_LINE} [${COLOR_RED}FAIL${COLOR_RESET}]$DIR $*"
	exit 1
}

verbose() {
	echo -e "\r [${COLOR_BLUE} ** ${COLOR_RESET}]$DIR $*"
}

dot_detect_os() {
	case "$(uname -s)" in
		Darwin*) DOT_OS=macos ;;
		Linux*) DOT_OS=linux ;;
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
		[ "$skip_all" = "true" ] && { verbose "$target exists, skipping..."; return; }
		if [ "$overwrite_all" != "true" ]; then
			user "Symlink '$target' exists: [s]kip, [S]kip all, [o]verwrite, [O]verwrite all"
			local action=
			read -r -n 1 action
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

	ln -s$FLAGS "$src" "$target"
	success "Symlink $target -> $src created"
}

dot_install_directory() {
	if [ -d "$1" ] ; then
		verbose "Directory '$1' exists"
	else
		mkdir -p "$1"
		success "Directory '$1' created"
	fi
}
