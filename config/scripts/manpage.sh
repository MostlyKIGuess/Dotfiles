man -k . | rofi -dmenu -p "man search" | awk '{print $1}' | xargs -r -I {} kitty sh -c "man {} && read -p 'Press Enter to skibiddi boom...'"
