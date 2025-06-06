session=$(ls ~/Documents/GitHub/ ~/Desktop/ | rofi -dmenu -p "Dev Session")
tmux has-session -t "$session" 2>/dev/null || tmux new-session -ds "$session" -c "$HOME/Projects/$session"
kitty -e tmux attach -t "$session"
