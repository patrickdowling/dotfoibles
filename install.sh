#!/usr/bin/env bash
set -e
# set -x

DOT_ROOT="$(pwd -P)"
cd "$DOT_ROOT"

. ./common.sh

install_symlinks() {
	log "Symlinking symlinks..."
	
	readarray -t symlinks < <(find "$DOT_ROOT" -maxdepth 2 -name "*.symlink" -type f)
	for symlink in ${symlinks[*]}; do
		local DIR
		DIR=" $(basename "$(dirname "$symlink")")"
		dot_install_symlink "$symlink" "$HOME/.$(basename "${symlink%.*}")"
	done
}

install() {
	log "Running installers..."

	readarray -t installers < <(find "$DOT_ROOT" -mindepth 2 -maxdepth 2 -name "install.sh")
	for installer in ${installers[*]}; do
		local DIR
		DIR=" $(basename "$(dirname "$installer")")"
		log "Installing..."
		( cd "$(dirname "$installer")" && . install.sh )
	done
}

log "Install dotfiles from $DOT_ROOT"

dot_detect_os
log "Detected OS: $DOT_OS"

install_symlinks
install

success "All done"
