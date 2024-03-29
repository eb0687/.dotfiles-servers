# general
alias ll='ls -lFh --group-directories-first'
alias la='ls -lFah --group-directories-first'
alias l='ls -CF --group-directories-first'
alias clear='clear -x'
# alias cl='clear -x'
alias vi='vim'
alias v='nvim'
alias reload='source ~/.bashrc'
alias follow='tail -f -n +1'

# fzf
alias f='fzf'

# cd
alias ..='cd ..'

# git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gcom='git commit -v'
alias gp='git push'
alias glf='git ls-files'
alias gl='git lg'

#tmux
alias tm='tmat'
alias tma='tmux attach'
alias tmd='tmux detach'
# alias tmls='tmux list-session'

# Some more, to avoid mistakes
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# docker
alias docker-ps='docker ps -a'
alias docker-exec='docker exec -it'
