# Check prerequisits for nvim
# Assumed to be run from within install.sh

[ -x "$(which pip3)" ] || fail "pip3 not found"

[ -n "$(pip3 list | grep neovim)" ] || log "neovim python module not found"
