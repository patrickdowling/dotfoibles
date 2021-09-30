#!/usr/bin/env bash
set -e
#set -x

ROOT=$(pwd -P)
cd "$ROOT"

. ./common.sh

info "Install dotfiles from $ROOT"

install_symlink() {
	local src=$1
	local target="$HOME/.$(basename "${src%.*}")"

	local overwrite=
	local skip=
	local action=

	if [ -e "$target" ]; then
		[ "$skip_all" = "true" ] && { info "$target exists, skipping..."; return; }
		if [ "$overwrite_all" != "true" ]; then
			user "$target exists: [s]kip, [S]kip all, [o]verwrite, [O]verwrite all"
			read -n 1 action
			case "$action" in
				o) overwrite=true ;;
				O) overwrite_all=true ;;
				s) skip=true ;;
				S) skip_all=true ;;
			esac
		fi
	fi
	[ "$skip" = "true" ] && return
	[ "$skip_all" = "true" ] && return
	local FLAGS=
	if [ "$overwrite" = "true" ] || [ "$overwrite_all" = "true" ] ; then FLAGS=f ; fi

	ln -s$FLAGS $src $target
	success "$target -> $src"
}

install_symlinks() {
	local skip_all=
	local overwrite_all=

	for symlink in $(find "$ROOT" -maxdepth 2 -name "*.symlink") ; do
		install_symlink "$symlink"
	done
}

install() {
	info "Running installers..."
	for installer in $(find "$ROOT" -mindepth 2 -maxdepth 2 -name "install.sh") ; do
		info "$installer"
		( cd "$(dirname $installer)" && . install.sh )
	done
}


# install_symlinks
install

success "All done"
