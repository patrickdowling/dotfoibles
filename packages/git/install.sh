#!/usr/bin/env bash
# set -x

GITCONFIG_LOCAL="$HOME/.gitconfig.local"

if [ -e "$GITCONFIG_LOCAL" ] ; then
	verbose ".gitconfig.local already exists"
	exit
fi

user "git user.name?"
read -e git_user_name

user "git user.email?"
read -e git_user_email

git_credential_helper=cache
if [ "$DOTFILES_OS" = "mac" ] ; then
	git_credential_helper='osxkeychain'
fi

sed \
	-e "s/GIT_USER_NAME/$git_user_name/g" \
	-e "s/GIT_USER_EMAIL/$git_user_email/g" \
	-e "s/GIT_CREDENTIAL_HELPER/$git_credential_helper/g" \
	"./gitconfig.local.template" > "$GITCONFIG_LOCAL"

success "$GITCONFIG_LOCAL created"
