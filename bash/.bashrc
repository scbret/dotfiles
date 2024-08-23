#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Define Editor
export EDITOR=nvim
alias v='$EDITOR'
alias vim='$EDITOR'

# -----------------------------------------------------
# LOAD CUSTOM .bashrc_custom
# -----------------------------------------------------
if [ -f ~/.bashrc_custom ] ;then
    source ~/.bashrc_custom
fi

alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias la='ll -a'
alias shutdown='systemctl poweroff'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

figlet SwineID
pfetch
