# ubuntu-setup

A simple Ubuntu setup script to streamline the initial configuration of a new system.

## Usage
To run the script, use the following command:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/RBN-Apps/ubuntu-setup/main/setup.sh)"
```

## Features

The script automates the following tasks:

1. **Backup Existing Configuration:**
    - Creates a backup of the `~/.bashrc` file as `~/.bashrc.backup` to ensure existing configurations are preserved.

2. **Enable Color Support in Bash Prompt:**
    - Activates color support in the Bash prompt by modifying the `.bashrc` file.

3. **Add Tmux Aliases:**
    - Appends the following convenient `tmux` aliases to `~/.bashrc`:
        - `alias t='tmux'` - Shortcut for launching `tmux`.
        - `alias ta='tmux attach -t'` - Attach to an existing `tmux` session.
        - `alias tn='tmux new -s'` - Start a new `tmux` session with a specific name.
        - `alias tls='tmux ls'` - List all `tmux` sessions.
        - `alias tk='tmux kill-session -t'` - Kill a specific `tmux` session.

4. **Apply Bash Changes:**
    - Reloads the `.bashrc` to immediately apply the changes.

5. **System Update and Upgrade:**
    - Updates the system's package list and installs the latest versions of all packages.

6. **Install Neofetch:**
    - Installs `neofetch`, a tool for displaying system information in the terminal.

7. **Optional New User Creation:**
    - Prompts for a username and password to create a new user account.
    - Adds the new user to the `sudo` group (optional).
    - Copies the modified `.bashrc` to the new user's home directory to maintain consistency in configuration.
    - Applies the appropriate ownership for the `.bashrc` file in the new user's directory.

8. **Summary:**
   - Displays a confirmation message summarizing the performed actions:
     - Whether a new user was created.
     - Inclusion of `tmux` aliases and color support in `.bashrc`.
     - System update and `neofetch` installation.
