# git lmao
if ! command -v git &> /dev/null; then
  echo "Git is not installed. Please install Git first."
  return
fi

# zsh
if [ -f "./.zshrc" ]; then
  read -p "Do you want to install Zsh configuration? (y/n): " install_zsh
  if [ "$install_zsh" == "y" ]; then
    echo "Installing Zsh configuration..."
    cp "./.zshrc" "$HOME/.zshrc"
  else
    echo "Zsh configuration installation skipped."
  fi
else
  echo "Zsh configuration not found in the dotfiles repository."
fi

# nvim
if [ -d "./config/nvim" ]; then
  read -p "Do you want to install Neovim configuration? (y/n): " install_nvim
  if [ "$install_nvim" == "y" ]; then
    echo "Installing Neovim configuration..."
    mkdir -p "$HOME/.config/nvim"
    cp -r "./config/nvim" "$HOME/.config/"
  else
    echo "Neovim configuration installation skipped."
  fi
else
  echo "Neovim configuration folder not found in the dotfiles repository."
fi

