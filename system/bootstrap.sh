#!/usr/bin/env bash
set -e

. ./base/common.sh
dot_detect_os
log "Detected OS: $DOT_OS"

log_exec() {
    log "$@"
    "$@"
}

install_brew() {
	log "Checking for brew..."
	if command -v brew ; then
		log "Brew found: $(command -v brew)"
	else
		log "Installing brew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
		#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
}

check_binary() {
    local path
    path=$(command -v "$1")
    [ -n "$path" ] || fail "$1 not found"
    success "Found $1 at $path"
}

bootstrap_macos() {
    #log "Install xcode" && xcode-select --install
    install_brew
    log_exec brew update --quiet
}

case "$DOT_OS" in
    "macos")
        bootstrap_macos
        ;;
    *)
        fail "Unsupported OS '$DOT_OS'"
esac

check_binary "git"
check_binary "pip3"
log_exec pip3 install --upgrade pip
log_exec pip3 install ansible

check_binary "ansible"
check_binary "ansible-galaxy"

log_exec ansible-galaxy collection install community.general
