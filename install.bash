#!/usr/bin/bash

cp ./sunrise_and_sunset.timer ~/.config/systemd/user
cp ./toggle_theme.service ~/.config/systemd/user
systemctl --user daemon-reload
systemctl --user start toggle_theme.service
systemctl --user enable --now sunrise_and_sunset.timer
