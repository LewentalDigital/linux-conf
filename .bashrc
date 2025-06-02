#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

print_line() {
    printf '─%.0s' $(seq 1 $(tput cols))
}
is_image() {
    mime=$(file --mime-type -b "$1")
    case "$mime" in
        image/*)
            return
            ;;
        *)
            false
            ;;
    esac
}
cool_cat() {
    if is_image "$1" ; then
        viu -h $(($(tput lines)/2)) "$1"
    else
        bat "$1"
    fi
}

# PS1='\[\033[01;90m\]$(print_line)\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --literal -h --sort=extension --group-directories-first --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -lA'
alias l='ls -1'
alias cat='cool_cat'

bind '"\C-h": backward-kill-word'
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [[ "$(tty)" == "/dev/tty1" ]]; then
    exec Hyprland &>/dev/null
fi
