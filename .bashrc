###################################################################################
#░▀█▀░█▀▄▀█░▄▀▀▄░▄▀▀▄░█▀▀▄░▀█▀░█▀▀░█▀▄░░░█▀▀▄░█░░█░░░█▀▀▄░█▀▀▄░█▀▀░░▀░░█▀▀▄░█░░█▀▀#
#░▒█░░█░▀░█░█▄▄█░█░░█░█▄▄▀░░█░░█▀▀░█░█░░░█▀▀▄░█▄▄█░░░█▄▄█░█░▒█░▀▀▄░░█▀░█▀▀▄░█░░█▀▀#
#░▄█▄░▀░░▒▀░█░░░░░▀▀░░▀░▀▀░░▀░░▀▀▀░▀▀░░░░▀▀▀▀░▄▄▄▀░░░▀░░▀░▀░░▀░▀▀▀░▀▀▀░▀▀▀▀░▀▀░▀▀▀#
###################################################################################

set -o vi
# bind 'set show-mode-in-prompt on'
# bind 'set vi-ins-mode-string ""'
# bind 'set vi-cmd-mode-string ""'

# Custom paths
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# add date & time to history command
HISTTIMEFORMAT='%Y-%m-%d %T '

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
    xterm-color|*-256color) color_prompt=yes ;;
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
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview-window=nohidden --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview-window=nohidden --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview-window=nohidden --preview 'dig {}'                   "$@" ;;
  esac
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# shellcheck source="/dev/null"
BASH_CUSTOM=(
    "$HOME/.bashtools/.alias.bash"
    "$HOME/.bashtools/.custom.bash"
    "$HOME/.bashtools/.functions.bash"
    )
for file in "${BASH_CUSTOM[@]}"
do
    [ -f "$file" ] && source "$file"
done

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

# ssh fix
if [ -z ${TMUX+x} ]; then
    # Not in a TMUX session
    if [ ! -S ~/.ssh/ssh_auth_sock ] && [ -S "$SSH_AUTH_SOCK" ]; then
        ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
    fi
else
    # In TMUX session
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
fi

# alias for git bare repo
alias dot='/usr/bin/git --git-dir=/home/eb/.dotfiles --work-tree=/home/eb'

fetch_updates=$(dot fetch)
if [[ -n $fetch_updates ]]; then
    dot fetch
    dot pull
fi

# make a symlink link for fd
if [[ -f /usr/bin/fdfind ]]; then
    if [[ ! -h ~/.local/bin/fd ]]; then
        ln -s "$(which fdfind)" ~/.local/bin/fd
    fi
fi

if [[ ! -f ~/.fzf.bash ]]; then
    cd ~/.github/fzf/ || exit
    bash install
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
