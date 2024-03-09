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
    cp "./.zshrc" "$HOME/.zshrc" || { echo "Error copying Zsh configuration file."; exit 1; }
  else
    echo "Zsh configuration installation skipped."
  fi
else
  echo "Zsh configuration file not found in the dotfiles repository."
fi

# nvim
if [ -d "./config/nvim" ]; then
  read -p "Do you want to install Neovim configuration? (y/n): " install_nvim
  if [ "$install_nvim" == "y" ]; then
    echo "Installing Neovim configuration..."
    mkdir -p "$HOME/.config/nvim" || { echo "Error creating Neovim configuration directory."; exit 1; }
    cp -r "./config/nvim" "$HOME/.config/" || { echo "Error copying Neovim configuration files."; exit 1; }
  else
    echo "Neovim configuration installation skipped."
  fi
else
  echo "Neovim configuration folder not found in the dotfiles repository."
fi

