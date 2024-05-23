#!/usr/bin/bash

config_path="$HOME/.config/nvim/lua/theme.lua"
config=$(cat "$config_path")
pattern_light='vim.opt.background = "light"'
pattern_dark='vim.opt.background = "dark"'
is_dark_mode=$(echo "$config" | grep "$pattern_dark")

function to_light() {
	echo "$pattern_light" > "$config_path"
	echo "Neovim theme has changed to light"
}

function to_dark() {
	echo "$pattern_dark" > "$config_path"
	echo "Neovim theme has changed to dark"
}

function toggle_theme() {
	if [ -z "$is_dark_mode" ]; then
		to_dark
	else
		to_light
	fi
}

if [ "$1" = "light" ]; then
	to_light
elif [ "$1" = "dark" ]; then
	to_dark
else
	toggle_theme
fi
