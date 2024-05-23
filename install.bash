#!/usr/bin/bash

sudo cp ./sunrise_and_sunset.timer /etc/systemd/user
sudo cp ./toggle_theme.service /etc/systemd/user
systemctl --user daemon-reload
systemctl --user start toggle_theme.service
systemctl --user enable --now sunrise_and_sunset.timer
