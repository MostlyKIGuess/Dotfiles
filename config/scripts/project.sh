proj=$(find ~/Documents/GitHub/ -maxdepth 1 -type d | rofi -dmenu -p "Projects")
[ -n "$proj" ] && kitty --working-directory "$proj" -e nvim
