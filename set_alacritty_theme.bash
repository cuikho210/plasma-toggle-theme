#!/usr/bin/bash

config_path="$HOME/.config/alacritty/alacritty.toml"
config=$(cat "$config_path")
pattern_light="catppuccin-latte.toml"
pattern_dark="catppuccin-mocha.toml"
is_dark_mode=$(echo "$config" | grep "$pattern_dark")

function to_light() {
	echo "${config/"$pattern_dark"/"$pattern_light"}" > "$config_path"
	echo "Aclaritty theme has changed to light"
}

function to_dark() {
	echo "${config/"$pattern_light"/"$pattern_dark"}" > "$config_path"
	echo "Aclaritty theme has changed to dark"
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
