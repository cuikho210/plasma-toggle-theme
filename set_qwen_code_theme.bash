#!/usr/bin/bash

theme_light="GitHub Light"
theme_dark="GitHub"
config_file="$HOME/.qwen/settings.json"

function get_current_theme() {
    jq -r '.theme' "$config_file"
}

function set_theme() {
    local theme=$1
    jq ".theme = \"$theme\"" "$config_file" > /tmp/tmp.$$.json && mv /tmp/tmp.$$.json "$config_file"
}

function to_light() {
    set_theme "$theme_light"
    echo "Qwen theme has been set to $theme_light"
}

function to_dark() {
    set_theme "$theme_dark"
    echo "Qwen theme has been set to $theme_dark"
}

function main() {
    if [ "$1" = "light" ]; then
        to_light
    elif [ "$1" = "dark" ]; then
        to_dark
    else
        current_theme=$(get_current_theme)
        if [ "$current_theme" = "$theme_dark" ]; then
            to_light
        else
            to_dark
        fi
    fi
}

main "$1"
