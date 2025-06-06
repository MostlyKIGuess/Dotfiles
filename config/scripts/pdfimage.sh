file=$(find ~/Downloads/ ~/Documents/ ~/Desktop/ -type f \( -name "*.pdf" -o -name "*.md" -o -name "*.tex" \) 2>/dev/null | rofi -dmenu -p "Docs")
xdg-open "$file"
