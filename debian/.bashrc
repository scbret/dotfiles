#!/usr/bin/env bash
# Modular .bashrc configuration

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ============================================================================
# SHELL OPTIONS
# ============================================================================

# Disable ctrl-s and ctrl-q (terminal pause)
stty -ixon

# Better history management
shopt -s histappend              # Append to history, don't overwrite
shopt -s checkwinsize            # Check window size after each command
shopt -s cdspell                 # Autocorrect typos in path names when using cd
shopt -s dirspell                # Correct directory name typos
shopt -s autocd                  # Type directory name to cd
shopt -s globstar                # Allow ** for recursive matching
shopt -s nocaseglob              # Case-insensitive globbing
shopt -s extglob                 # Extended pattern matching

# ============================================================================
# HISTORY CONFIGURATION
# ============================================================================

export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:ll:cd:pwd:exit:clear:history"
export HISTTIMEFORMAT="%F %T "

# Immediately write history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# ============================================================================
# ENVIRONMENT VARIABLES
# ============================================================================

# Path configuration
export PATH="$HOME/scripts:$HOME/.local/bin:/usr/local/go/bin:$HOME/.cargo/bin:$PATH"

# Default editors
export EDITOR=$(command -v nvim || command -v vim || command -v micro || echo nano)
export VISUAL="$EDITOR"

# Better less defaults
export LESS='-R -F -X -i -P %f (%i/%m) '
export LESSHISTFILE=/dev/null

# Colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ============================================================================
# LOAD MODULAR CONFIGURATIONS
# ============================================================================

BASH_CONFIG_DIR="$HOME/.config/bash"

# Load all bash configuration files
if [ -d "$BASH_CONFIG_DIR" ]; then
    # Load main configuration files
    for config in "$BASH_CONFIG_DIR"/*.bash; do
        [ -f "$config" ] && source "$config"
    done
    
    # Load function files
    if [ -d "$BASH_CONFIG_DIR/functions" ]; then
        for func in "$BASH_CONFIG_DIR/functions"/*.bash; do
            [ -f "$func" ] && source "$func"
        done
    fi
fi

# ============================================================================
# COMPLETION
# ============================================================================

# Enable programmable completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Git completion
if [ -f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
fi

# ============================================================================
# WELCOME MESSAGE
# ============================================================================

# Display system info on login (optional - comment out if not wanted)
if [ -n "$PS1" ]; then
    echo -e "\033[1;34m=== Welcome back, $USER! ===\033[0m"
    echo -e "Date: $(date '+%A, %B %d, %Y - %H:%M:%S')"
    echo -e "Uptime:$(uptime -p | sed 's/up //')"
    echo -e "Load: $(uptime | awk -F'load average:' '{print $2}')"
    echo
fi

# ============================================================================
# LOCAL OVERRIDES
# ============================================================================

# Source local bashrc if it exists (for machine-specific settings)
#if [ -f "$HOME/.bashrc.local" ]; then
#    . "$HOME/.bashrc.local"
#fi
