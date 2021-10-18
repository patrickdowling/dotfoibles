#!/usr/bin/env bash
set -e
# set -x

DOT_ROOT="$(dirname "$(realpath "$0")")"
cd "$DOT_ROOT"
DOT_PACKAGES="$DOT_ROOT/packages"

. ./base/common.sh

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

dot_install_prerequisites() {
	log "Installing prerequisites"
}

dot_check_prerequisites() {
	local zsh_path
	local zsh_version
	zsh_path=$(which zsh) || fail "ZSH not found"
	zsh_version=$(zsh --version) || fail "ZSH version not found"
	success "ZSH: $zsh_path, version: $zsh_version"
}

dot_install() {
	dot_check_prerequisites

	log "Install dotfiles from $DOT_ROOT"

	dot_detect_os
	log "Detected OS: $DOT_OS"

	dot_symlinks
	dot_installers

	success "All done"
}

case "$1" in
	"--prerequisites") dot_install_prerequisites ;;
	"--install") dot_install ;;
	*)
		echo "No action specified, doing nothing"
		exit 0
		;;
esac
