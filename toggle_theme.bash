#!/usr/bin/bash

theme_light="LeafLight"
theme_dark="LeafDark"

working_dir=$(dirname $0)
kdeglobals=$(cat "$HOME/.config/kdeglobals")
pattern_light="ColorScheme=$theme_light"
pattern_dark="ColorScheme=$theme_dark"
is_dark_mode=$(echo "$kdeglobals" | grep "$pattern_dark")

day_start_at="6"
day_end_at="18"
current_time=$(date +"%H")
is_day=false

if [ "$current_time" -gt "$day_start_at" ] && [ "$current_time" -lt "$day_end_at" ]
then
	is_day=true
fi

function to_light() {
	plasma-apply-colorscheme $theme_light
	echo "The ColorScheme has changed to $theme_light"

	bash "$working_dir/set_nvim_theme.bash" light
	bash "$working_dir/set_alacritty_theme.bash" light
	bash "$working_dir/set_gemini_theme.bash" light
}

function to_dark() {
	plasma-apply-colorscheme $theme_dark
	echo "The ColorScheme has changed to $theme_dark"

	bash "$working_dir/set_nvim_theme.bash" dark
	bash "$working_dir/set_alacritty_theme.bash" dark
	bash "$working_dir/set_gemini_theme.bash" dark
}

function toggle_theme() {
	if [ -z "$is_dark_mode" ]; then
		to_dark
	else
		to_light
	fi
}

function auto_set_theme() {
	if "$is_day"; then
		echo "Currently is day time"
		to_light
	else
		echo "Currently is night time"
		to_dark
	fi
}

function main() {
	echo "Arg 1 is $1"
	if [ "$1" = "light" ]; then
		echo "To light"
		to_light
	elif [ "$1" = "dark" ]; then
		echo "To dark"
		to_dark
	elif [ "$1" = "toggle" ]; then
		echo "Toggle"
		toggle_theme
	else
		echo "Auto"
		auto_set_theme
	fi
}

main $1
