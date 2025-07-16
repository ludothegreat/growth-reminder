export EDITOR=nvim

## Plugins

# Load zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load zsh-autocomplete
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Load zsh-you-should-use
# source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

# Load zsh-sudo
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh-fzf-plugin
# source /usr/share/zsh/plugins/zsh-fzf-plugin/fzf.plugin.zsh

# Load zsh-git-prompt
source /usr/lib/zsh-git-prompt/zshrc.sh

# Bind Home and End keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Alternative bindings for some terminal emulators
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# Binding delete key
bindkey "^[[3~" delete-char

# Aliases

# Logout of AwesomeWM
alias quit='echo "awesome.quit()" | awesome-client'

# Navigation
alias ll='ls -la'               # Detailed list view
alias la='ls -A'                # List all except . and ..
alias l='ls -CF'                # Compact list view
alias ..='cd ..'                # Go up one directory
alias ...='cd ../..'            # Go up two directories
alias ....='cd ../../..'        # Go up three directories

# term shortcuts
alias c='clear'                 # Clear the terminal
alias h='history'               # Show command history
alias j='jobs -l'               # List active jobs

# System and Package Management
alias psg='ps aux | grep'       # Search for a process
alias reload='source ~/.zshrc'  # Reload Zsh configuration

# Networking
alias ipinfo='ip -c -br a'      # Show IP address information
alias myip='curl ifconfig.me'   # Show external IP address

# Miscellaneous
alias weather='curl wttr.in'    # Check the weather
alias untar='tar -zxvf'         # Extract a tar.gz file
alias path='echo $PATH'         # Show the system path

# Custom Aliases
alias e='nano'                  # Shorter nano command
alias wp='~/.scripts/random_wallpaper.sh' # Picks a random wallpaper

# Function to repeat last command with sudo
sudo_last_command() {
  eval "sudo $(fc -ln -1)"
}

# Eza setup
alias ls="eza --color=always --long --icons=always"

# Zoxide setup
alias cd="z"
eval "$(zoxide init zsh)"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# NeoVim aliases
alias v="nvim"
alias vim="nvim"

# cat = bat
alias cat="bat"

#connect to acc sslvpn
alias forti="REDACTED"

# Run fastfetch
fastfetch

### Prompt customization

# Define colors
autoload -U colors && colors
# Color definitions
RED="%F{red}"
GREEN="%F{green}"
YELLOW="%F{yellow}"
BLUE="%F{blue}"
MAGENTA="%F{magenta}"
CYAN="%F{cyan}"
WHITE="%F{white}"
RESET="%f"

# Git branch function
parse_git_branch() {
  git branch 2>/dev/null | grep '\*' | sed 's/* //'
}

# Custom prompt
setopt prompt_subst
PROMPT="${CYAN}%n@%m ${YELLOW}%~ ${MAGENTA}\$(parse_git_branch)${RESET}
${WHITE}-> "

#Personal Dev Groth Stack
#Daily Nudge
function daily_nudge() {
  local msg=("Document one command you used today"
             "Ship a broken idea"
             "Refactor something then share it"
             "Push your README-first project"
             "Record a 60s terminal walkthrough"
             "Ask a question in public")
  echo -e "\n ${msg[$RANDOM % ${#msg[@]} + 1]}"
}
daily_nudge

# Weekly Growth Reminder
function growth_reminder() {
  echo -e "\n Reminder: SHIP SOMETHING TODAY\n- Push a script\n- Write a 2-sentence README\n- Post a failure\n"
}
growth_reminder

