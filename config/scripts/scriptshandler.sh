script=$(ls ~/.config/scripts | rofi -dmenu -p "Run Script")
[ -n "$script" ] && bash "$HOME/.config/scripts/$script"
