#   _           _        _ _ 
#  (_)_ __  ___| |_ __ _| | |
#  | | '_ \/ __| __/ _` | | |
#  | | | | \__ \ || (_| | | |
#  |_|_| |_|___/\__\__,_|_|_|
#
#  by Fráter Iván ©(2024)

#!/bin/bash

# Apps to install
apps=(
    "bat"
    "btop"
    "eza"
    "fastfetch"
    "gcc"
    "gh"
    "neovim"
    "stow"
    "thefuck"
    "trash-cli"
)

# Casks to install
casks=(
    "warp"
    "visual-studio-code"
    "orbstack"
    "rectangle"
    "hiddenbar"
    "alt-tab"
    "betterdisplay"
    "raycast"
    "linearmouse"
    "messenger"
    "discord"
    "spotify"
    "notion"
)

# Linux specific things
linux_apps=(
    "hyprland"
    "hyprpaper"
    "hypridle"
    "hyprlock"
    "waybar"
    "chromium"
)

# Directory containing the dotfiles
DOTFILES_DIR="$HOME/.dotfiles"

# Function to check the operating system
check_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    else
        echo "Unsupported OS: $OSTYPE"
        exit 1
    fi
}

# Function to install Homebrew on macOS
install_brew() {
    if [[ "$OS" == "linux" ]]; then
        echo "You are on Linux. Skipping Linuxbrew installation."
    elif [[ "$OS" == "macos" ]]; then
        if ! command -v brew &> /dev/null; then
            xcode-select --install
            echo "Homebrew is not installed. Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        else
            echo "Homebrew is already installed."
        fi
    fi
}

# Function to install apps with Homebrew
install_apps() {
    for app in "${apps[@]}"; do
        echo "Installing $app..."
        if [[ "$OS" == "linux" ]]; then
            sudo dnf install "$app"
        elif [[ "$OS" == "macos" ]]; then
            brew install "$app"
        fi
    done
}

install_linux_specific() {
    for app in "${linux_apps[@]}"; do
        if [[ "$OS" == "linux" ]]; then
            echo "Installing $app..."
            sudo dnf install "$app"
        elif [[ "$OS" == "macos" ]]; then
            echo "You are on macOS. Skipping Linux specific installation."
        fi
    done
}

# Function to install starship prompt
install_starship() {
    curl -sS https://starship.rs/install.sh | sh
}

# Function to install casks with Homebrew
install_casks() {
    if [[ "$OS" == "linux" ]]; then
        echo "You are on Linux. Skipping casks installation."
    elif [[ "$OS" == "macos" ]]; then
        for cask in "${casks[@]}"; do
            echo "Installing $cask..."
            brew install --cask "$cask"
        done
    fi
}

# Function to stow dotfiles
stow_dotfiles() {
    if [ -d "$DOTFILES_DIR" ]; then
        cd "$DOTFILES_DIR" || { echo "Failed to change to $DOTFILES_DIR"; exit 1; }
        for dir in */ ; do
            echo "Stowing \"$DOTFILES_DIR\""
            stow .
        done
    else
        echo "Dotfiles directory $DOTFILES_DIR does not exist."
        exit 1
    fi
}

# Check if Homebrew is installed
check_os
install_brew

# Update Homebrew and upgrade any already-installed formulae
if [[ "$OS" == "linux" ]]; then
    echo "You are on Linux. No need to update brew."
elif [[ "$OS" == "macos" ]]; then
    for cask in "${casks[@]}"; do
        echo "Updating Homebrew..."
        brew update
    done
fi

if [[ "$OS" == "linux" ]]; then
    echo "You are on Linux. No need to upgrade brew."
elif [[ "$OS" == "macos" ]]; then
    for cask in "${casks[@]}"; do
        echo "Upgrading any already-installed formulae..."
        brew upgrade
    done
fi

# Install the apps and casks
install_apps
install_casks
install_linux_specific

# Stow the dotfiles
stow_dotfiles

# Install starship prompt
install_starship

echo "Installation completed. Log out and log back in to see the full effect."
