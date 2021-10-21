#!/usr/bin/env bash
set -e
# set -x

. ./base/common.sh
dot_detect_os
log "Detected OS: $DOT_OS"
. ./system/system_packages

DOT_ROOT="$(dirname "$(realpath "$0")")"
cd "$DOT_ROOT"
DOT_PACKAGES="$DOT_ROOT/packages"

dot_symlinks() {
	log "Symlinking symlinks..."
	
	readarray -t symlinks < <(find "$DOT_PACKAGES" -maxdepth 2 -name "*.symlink" -type f)
	for symlink in ${symlinks[*]}; do
		local DIR
		DIR=" $(basename "$(dirname "$symlink")")"
		dot_install_symlink "$symlink" "$HOME/.$(basename "${symlink%.*}")"
	done
}

dot_installers() {
	log "Running installers..."

	readarray -t installers < <(find "$DOT_PACKAGES" -mindepth 2 -maxdepth 2 -name "install.sh")
	for installer in ${installers[*]}; do
		local DIR
		DIR=" $(basename "$(dirname "$installer")")"
		log "Installing package"
		( cd "$(dirname "$installer")" && . install.sh )
		success
	done
}

dot_check() {
	for bin in ${required_binaries[*]} ; do
		local path
		path="$(which "$bin")" || fail "$exe not installed?"
		success "Found $bin at $path"
	done
}

dot_install() {
	dot_check
	log "Installing dotfiles from $DOT_ROOT"
	dot_symlinks
	dot_installers
}


case "$1" in
	"--check") dot_check ;;
	"--install") dot_install ;;
	"--system_packages") dot_system_packages ;;
	*)
		echo "No action specified, doing nothing"
		exit 0
		;;
esac

success "All done"
