function zsh_plugins_update() {
	echo "$ZSH_PLUGIN_DIR"
	for plugin in ${ZSH_PLUGINS}; do
		echo "** Updating $plugin"
		git -C "$ZSH_PLUGIN_DIR/$plugin" pull
	done
}
