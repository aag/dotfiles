# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Include the Khan Academy bashrc file if it exists
if [ -f "$HOME/.bashrc.khan" ]; then
. "$HOME/.bashrc.khan"
fi

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


# Define the console color codes
CODE_RED=$'\[\033[0;31m\]'
CODE_GREEN=$'\[\033[0;32m\]'
CODE_YELLOW=$'\[\033[0;33m\]'
CODE_LBLUE=$'\[\033[1;34m\]'
CODE_CYAN=$'\[\033[0;36m\]'
CODE_LGRAY=$'\[\033[0;37m\]'
CODE_DGRAY=$'\[\033[1;30m\]'
CODE_NORM=$'\[\033[m\]'

function local_datetime {
    # Get the date string in the Eastern time zone
    EDT_DATETIME="$(env TZ=EST5EDT date +"%a %b %d %r")"
    echo $EDT_DATETIME

    # Get the date string in the Central European Time time zone
    #CET_DATETIME="$(env TZ=CET date +"%a %b %d %r")"
    #echo $CET_DATETIME
}

function git_prompt_char {
	git branch >/dev/null 2>/dev/null && echo "G" && return
	echo ''
}

HOST_COLOR=$CODE_GREEN

# Actually set the prompt.  It is colorized and two line.
# It should look something like this:
# user@server|Tue Feb 19 05:25:05 PM|626|/usr/local/bin
# $
PS1="${debian_chroot:+($debian_chroot)}${CODE_GREEN}\u@${HOST_COLOR}\h${CODE_DGRAY}|${CODE_LBLUE}\$(local_datetime)${CODE_DGRAY}|${CODE_CYAN}\!${CODE_DGRAY}|${CODE_YELLOW}\w${CODE_NORM}\n${CODE_CYAN}\$(git_prompt_char)${CODE_NORM}\$ "


# ** The below was in the default bashrc. Commenting out to use above prompt.
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
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
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# git aliases
alias ga='git add'
alias gaa='git add .'
alias gb='git branch'
alias gcom='git commit'
alias gc='git checkout'
alias gc-='git checkout --'
alias gd='git diff'
alias gl="git log --decorate --stat --graph --pretty=format:'%C(yellow)%h%C(blue) %cr%Creset (%Cred%an%Creset) %s%n'"
alias gp='git pull'
alias gts='git status'
alias gpom='git push origin master'

# hg aliases
alias hgs='hg status'
alias hp='hg pull -u'

# RXVT
alias rxvt='rxvt -vb -bg black -fg white -sb -sr -sl 1024'

# Other aliases
alias m='meld . &'
alias passes='pwgen -cnsB 24 9'

# alias to upload the image in the clipboard to Phabricator
if which arc >/dev/null 2>&1 ; then
    alias arcclip='tmpfile=/tmp/screenshot.png; xclip -selection clipboard -t image/png -o > $tmpfile && arc upload $tmpfile; rm -f $tmpfile'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

# Initialize rbenv if it's installed
if [ -d "$HOME/.rbenv/bin" ] ; then
    eval "$($HOME/.rbenv/bin/rbenv init -)"
fi

# Initialize jenv if it's installed
if [ -d "$HOME/.jenv/bin" ] ; then
    source "$HOME/.jenv/bin/jenv-init.sh" && source "$HOME/.jenv/commands/completion.sh"
fi

