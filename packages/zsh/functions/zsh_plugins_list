function zsh_plugins_list() {
	echo "$ZSH_PLUGIN_DIR"
	for plugin in ${ZSH_PLUGINS[*]}; do
		if [ "-v" = "$1" ]; then
			local plugin_dir="$ZSH_PLUGIN_DIR/$plugin"
			local plugin_url="$(git -C "$plugin_dir" ls-remote --get-url)"
			local plugin_rev="$(git -C "$plugin_dir" rev-parse --short HEAD)"
			echo " $plugin -> $plugin_url @ $plugin_rev"
		else
			echo " $plugin"
		fi
	done
}
