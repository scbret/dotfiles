#
# ~/.bashrc
#
export VISUAL='nano'

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias ll='ls -lha'
alias ez='eza -lha --icons'

#hardware info --short
alias hw="hwinfo --short"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI='qemu:///system'
