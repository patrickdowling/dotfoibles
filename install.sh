#!/usr/bin/env bash
set -e
# set -x

###
## Before we get started, does anyone want to get out?
#
dot_help() {
cat << EOF
Valid actions are
--check : check prerequisites
--install : install things
--system_defaults : system default settings
--system_packages : install system packages
EOF
}
(( $# )) || { dot_help; exit 1; }

###
## Setup framework
#
. ./base/common.sh
dot_detect_os
log "Detected OS: $DOT_OS"
. ./system/system_packages

DOT_ROOT="$(dirname "$(realpath "$0")")"
cd "$DOT_ROOT"
DOT_PACKAGES="$DOT_ROOT/packages"

dot_symlinks() {
	title "Symlinking symlinks..."
	
	readarray -t symlinks < <(find "$DOT_PACKAGES" -maxdepth 2 -name "*.symlink" -type f)
	for symlink in ${symlinks[*]}; do
		local DIR
		DIR=" $(basename "$(dirname "$symlink")")"
		dot_install_symlink "$symlink" "$HOME/.$(basename "${symlink%.*}")"
	done
}

dot_installers() {
	title "Running installers..."

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
	title "Checking required binaries..."
	for bin in ${required_binaries[*]} ; do
		local path
		path="$(which "$bin")" || fail "$bin not installed?"
		success "Found $bin at $path"
	done

	title "Checking package requirements..."
	readarray -t checkers < <(find "$DOT_PACKAGES" -mindepth 2 -maxdepth 2 -name "check.sh")
	for checker in ${checkers[*]}; do
		local DIR
		DIR=" $(basename "$(dirname "$checker")")"
		log "Checking prerequisites"
		(cd "$(dirname "$checker")" && . check.sh )
		success
	done
}

dot_install() {
	dot_check
	title "Installing dotfiles from $DOT_ROOT"
	dot_symlinks
	dot_installers
}

dot_system_defaults() {
	title "Setting system defaults..."

	local system_defaults_sh="./system/$DOT_OS-defaults.sh"
	if [ -x "$system_defaults_sh" ] ; then
		. "$system_defaults_sh"
		success "Executed $system_defaults_sh"
	fi
}

###
## "MAIN"
#
while (( $# ))
do
	case "$1" in
		"--check") dot_check ;;
		"--install") dot_install ;;
		"--system_defaults") dot_system_defaults ;;
		"--system_packages") dot_system_packages ;;
		*) fail "Unknown action '$1'" ;;
	esac
	shift
done

success "All done"
