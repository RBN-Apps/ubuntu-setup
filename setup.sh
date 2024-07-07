#!/bin/bash

# Backup the ~/.bashrc file
cp ~/.bashrc ~/.bashrc.backup

# Enable color support in the Bash prompt
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc

# Add useful aliases for tmux
echo -e "\n# Useful aliases for tmux" >> ~/.bashrc
echo "alias t='tmux'" >> ~/.bashrc
echo "alias ta='tmux attach -t'" >> ~/.bashrc
echo "alias tn='tmux new -s'" >> ~/.bashrc
echo "alias tls='tmux ls'" >> ~/.bashrc
echo "alias tk='tmux kill-session -t'" >> ~/.bashrc

# Apply changes
source ~/.bashrc

# Update the system
sudo apt update && sudo apt upgrade -y

# Install neofetch
sudo apt install -y neofetch

echo "Color support in Bash enabled, system updated, neofetch installed, and useful tmux aliases added."
