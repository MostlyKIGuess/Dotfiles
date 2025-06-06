options="Play/Pause\nNext\nPrevious"
choice=$(echo -e "$options" | rofi -dmenu -p "Spotify")
case "$choice" in
"Play/Pause") playerctl play-pause ;;
"Next") playerctl next ;;
"Previous") playerctl previous ;;
esac
