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

# Prompt for new username
read -p "Do you want to create a new user? (y/N): " create_user
if [[ "$create_user" =~ ^[Yy]$ ]]; then
    # Validate username input
    while [[ -z "$newuser" ]]; do
        read -p "Enter a valid username for the new user: " newuser
    done

    # Add the new user
    sudo useradd -m -s /bin/bash "$newuser"

    # Set and confirm password for the new user
    while true; do
        read -sp "Enter the password for the new user: " password
        echo
        read -sp "Confirm the password: " password_confirm
        echo
        if [[ "$password" == "$password_confirm" ]]; then
            echo "$newuser:$password" | sudo chpasswd
            break
        else
            echo "Passwords do not match. Please try again."
        fi
    done

    # Ask if the new user should be added to the sudo group (default is yes)
    echo "Adding a user to the sudo group allows them to execute commands with administrative privileges using 'sudo'."
    echo "Without this, the user will not be able to execute commands that require 'sudo'."
    read -p "Do you want to add '$newuser' to the sudo group? (Y/n): " add_sudo
    if [[ "$add_sudo" =~ ^[Nn]$ ]]; then
        echo "User '$newuser' was not added to the sudo group."
    else
        sudo usermod -aG sudo "$newuser"
        echo "User '$newuser' added to the sudo group."
        echo "Groups for '$newuser':"
        groups "$newuser"
    fi

    # Copy .bashrc to the new user's home directory
    sudo cp ~/.bashrc /home/"$newuser"/.bashrc

    # Set ownership of the new .bashrc file to the new user
    sudo chown "$newuser":"$newuser" /home/"$newuser"/.bashrc

    # Reload the new user's .bashrc to apply changes (optional, applies when switching to the new user)
    sudo -u "$newuser" bash -c "source /home/$newuser/.bashrc"

    echo "New user '$newuser' created. Bash configuration applied."
else
    echo "Skipping user creation."
fi

echo "Color support in Bash enabled, system updated, neofetch installed, and useful tmux aliases added."
