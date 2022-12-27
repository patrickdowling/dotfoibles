#!/usr/bin/env bash
set -e

. ./base/common.sh
dot_detect_os
log "Detected OS: $DOT_OS"

log_exec() {
    log "$@"
    $@
}

install_brew() {
    brew="$(command -v brew)"
	log "Checking for brew..."
	if [ -z "$brew" ] ; then
		log "Installing brew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
		#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    else
        log "Brew found: $brew"
    fi
}

bootstrap_macos() {
    #log "Install xcode" && xcode-select --install
    install_brew
    log_exec brew update --quiet
    log_exec pip3 install --upgrade pip
    log_exec pip3 install ansible
}

case "$DOT_OS" in
    "macos")
        bootstrap_macos
        ;;
    *)
        fail "Unsupported OS '$DOT_OS'"
esac
