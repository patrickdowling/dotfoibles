#!/usr/bin/env bash
set -e
#set -x

ROOT=$(pwd -P)
cd "$ROOT"

. ./common.sh

install_symlinks() {
	info "Symlinking symlinks..."
	for symlink in $(find "$ROOT" -maxdepth 2 -name "*.symlink") ; do
		local DIR=" $(basename $(dirname $symlink))"
		dot_install_symlink "$symlink" "$HOME/.$(basename "${symlink%.*}")"
	done
}

install() {
	info "Running installers..."
	for installer in $(find "$ROOT" -mindepth 2 -maxdepth 2 -name "install.sh") ; do
		local DIR=" $(basename $(dirname $installer))"
		info "Installing..."
		( cd "$(dirname $installer)" && . install.sh )
	done
}

info "Install dotfiles from $ROOT"
dot_detect_os

info "Detected OS: $DOTFILES_OS"

install_symlinks
install

success "All done"
