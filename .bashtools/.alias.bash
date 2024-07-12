# better ls
alias ls='eza -F -a --color=always --group-directories-first --sort=modified'
alias la='eza -F -al -g --time=modified --time-style="+%Y-%m-%d %H:%M" --color=always --icons=auto --group-directories-first --sort=modified --git --git-repos'
alias laf='eza -F -al -g --only-files --time=modified --time-style="+%Y-%m-%d %H:%M" --color=always --icons=auto --group-directories-first --sort=modified --git --git-repos'
alias lad='eza -F -al -g --only-dirs --time=modified --time-style="+%Y-%m-%d %H:%M" --color=always --icons=always --group-directories-first --sort=modified --git --git-repos'
alias ll='eza -F -l --color=always --icons=auto --no-time --no-filesize --no-permissions --no-user --group-directories-first --sort=modified'
alias lf='eza -F -l --only-files --color=always --icons=auto --no-time --no-filesize --no-permissions --no-user --group-directories-first --sort=modified'
alias ld='eza -F -l --only-dirs --color=always --icons=always --no-time --no-filesize --no-permissions --no-user --group-directories-first --sort=modified'
alias lg='eza -F -al --time=modified --time-style="+%Y-%m-%d %H:%M" --color=always --no-permissions --no-filesize --group-directories-first --sort=modified --git --git-repos'
alias lt='eza --long --tree --level=3 --no-time --no-permissions --no-user --no-filesize --icons=auto --git'
alias lt1='eza --long --tree --level=1 --no-time --no-permissions --no-user --no-filesize --icons=auto --git'
alias lt2='eza --long --tree --level=2 --no-time --no-permissions --no-user --no-filesize --icons=auto --git'
alias lt3='eza --long --tree --level=3 --no-time --no-permissions --no-user --no-filesize --icons=auto --git'
alias lt4='eza --long --tree --level=4 --no-time --no-permissions --no-user --no-filesize --icons=auto --git'
alias lt5='eza --long --tree --level=5 --no-time --no-permissions --no-user --no-filesize --icons=auto --git'
alias lts='eza --long --tree --level=3 --no-time --no-permissions --no-user --icons=auto --git'
alias ltd='eza --long --only-dirs --tree --level=3 --no-time --no-permissions --no-user --icons=auto --git'
alias ltd1='eza --long --only-dirs --tree --level=1 --no-time --no-permissions --no-user --icons=auto --git'
alias ltd2='eza --long --only-dirs --tree --level=2 --no-time --no-permissions --no-user --icons=auto --git'
alias ltd3='eza --long --only-dirs --tree --level=3 --no-time --no-permissions --no-user --icons=auto --git'
alias ltd4='eza --long --only-dirs --tree --level=4 --no-time --no-permissions --no-user --icons=auto --git'
alias ltd5='eza --long --only-dirs --tree --level=5 --no-time --no-permissions --no-user --icons=auto --git'
alias ltf='eza --long --only-files --tree --level=3 --no-time --no-permissions --no-user --icons=auto --git'

# general
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
