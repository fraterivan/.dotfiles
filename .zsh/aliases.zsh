#         _ _                               _     
#    __ _| (_) __ _ ___  ___  ___   _______| |__  
#   / _` | | |/ _` / __|/ _ \/ __| |_  / __| '_ \ 
#  | (_| | | | (_| \__ \  __/\__ \_ / /\__ \ | | |
#   \__,_|_|_|\__,_|___/\___||___(_)___|___/_| |_|
#
#  by Fráter Iván ©(2024)

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Shortcuts
alias home="cd ~"
alias dot="cd ~/.dotfiles"
alias dotfiles="cd ~/.dotfiles"
alias desk="cd ~/Desktop"
alias desktop="cd ~/Desktop"
alias dev="cd ~/Developer"
alias developer="cd ~/Developer"
alias doc="cd ~/Documents"
alias documents="cd ~/Documents"
alias down="cd ~/Downloads"
alias downloads="cd ~/Downloads"

# Replace ls with eza
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"

# Replacements
alias c="clear"
alias cat="bat"
alias top="btop"
alias nano="nvim"

# Open current directory in VS Code
alias code="code ."

# Enable aliases to be sudo’ed
alias sudo="sudo "

# Connect to OrbStack VM
alias pro="ssh fraterivan@prometheus@orb"
alias prometheus="ssh fraterivan@prometheus@orb"
