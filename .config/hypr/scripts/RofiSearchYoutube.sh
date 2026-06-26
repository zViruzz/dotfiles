#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# For Searching via web browsers

# Modify this config file for default search engine
config_file="$HOME/.config/hypr/UserConfigs/01-UserDefaults.conf"

tmp_config_file=$(mktemp)
sed 's/^\$//g; s/ = /=/g' "$config_file" >"$tmp_config_file"
source "$tmp_config_file"
# ##################################### #

# Rofi theme and message
rofi_theme="$HOME/.config/rofi/config-search-youtube.rasi"
msg='‼️ **note** ‼️ search via default web browser'

# Kill Rofi if already running before execution
if pgrep -x "rofi" >/dev/null; then
  pkill rofi
fi

# Open Rofi and pass the selected query to xdg-open for Youtube search
echo "" | rofi -dmenu -config "$rofi_theme" -mesg "$msg" | xargs -I{} flatpak run app.zen_browser.zen --new-window "https://www.youtube.com/results?search_query={}"
# Clean up temporary file after sourcing
rm "$tmp_config_file"
