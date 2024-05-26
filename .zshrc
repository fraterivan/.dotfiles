#             _              
#     _______| |__  _ __ ___ 
#    |_  / __| '_ \| '__/ __|
#   _ / /\__ \ | | | | | (__ 
#  (_)___|___/_| |_|_|  \___|
#
#  by Fráter Iván ©(2024)

# Source aliases.zsh
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh

# Add fuck command
eval $(thefuck --alias)

# Load Starship prompt
eval "$(starship init zsh)"
