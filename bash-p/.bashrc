# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Define Editor
export EDITOR=nvim

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # alias ls='ls --color=auto'
    alias ls='exa --icons'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# cycle through all matches with 'TAB' key
bind 'TAB:menu-complete'

# some more ls aliases
alias ll='exa -alF --icons'
alias la='exa -a --icons'
alias l='ls -C'
alias lt='exa -a --tree --level=1 --icons'
alias lsn='ls | cat -n'
alias cl='clear'
alias q='exit'
alias bat='batcat'
# git section
alias g='git'
alias ga='g add .'
alias gc='g commit -m "X1-popos"'
alias gps='g push'
alias gpl='g pull'
alias gs='g status'
alias gst='g stash'
alias gsp='g stash; g pull'
# git section
alias vi='nvim'
alias fh='history | fzf'
alias df='df -haT --total'
alias ht='htop'
alias bt='btop'
alias free='free -mt'
alias cputemp='sensors | grep Core'
alias fp="\$(fzf --reverse --preview 'batcat --style=numbers --color=always --line-range :500 {}')"
alias fp1="fzf --reverse --preview='batcat --color=always --line-range :500 {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
alias fd='finder'
alias tl='task list'
alias tw='task waiting'

alias sb='source ~/.bashrc'
alias brc='vi ~/.bashrc'
alias vrc='vi ~/.config/nvim/init.vim'
alias tm='tmux'
alias lsd='lsd -l'
alias ff='fastfetch'
alias pf='pfetch'
alias sup='sudo apt update && sudo apt upgrade -y && sudo apt autoclean'
alias zl='zellij'
alias qn='$EDITOR ~/qnotes.md'

export PATH="$HOME/.local/bin:$PATH"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# <<< open or edit previewed files with fzf >>> #
export FZF_DEFAULT_OPTS='--height 75% --layout=reverse --border'

fo() {
  IFS=$'\n' out=("$(fzf --preview 'batcat --style=numbers --color=always --line-range :500 {}' --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-nvim} "$file"
  fi
}

finder() {
    local dir
    dir=$(find /home/$USER -maxdepth 3 -type d,l | fzf)
    if [[ -n "$dir" ]]; then
        cd "$dir" || return
    fi
}

# Colored man
export MANPAGER="less -R --use-color -Dd+g -Du+b"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/steve/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/steve/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/steve/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/steve/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

figlet SwineID
pf

eval "$(starship init bash)"
