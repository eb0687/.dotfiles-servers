# # find out which distribution we are running on
# LFILE="/etc/*-release"
# MFILE="/System/Library/CoreServices/SystemVersion.plist"
# if [[ -f $LFILE ]]; then
#   _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
# elif [[ -f $MFILE ]]; then
#   _distro="macos"
# fi

# # set an icon based on the distro
# # make sure your font is compatible with https://github.com/lukas-w/font-logos
# case $_distro in
#     *kali*)                  ICON="ﴣ";;
#     *arch*)                  ICON="";;
#     *debian*)                ICON="";;
#     *raspbian*)              ICON="";;
#     *ubuntu*)                ICON="";;
#     *elementary*)            ICON="";;
#     *fedora*)                ICON="";;
#     *coreos*)                ICON="";;
#     *gentoo*)                ICON="";;
#     *mageia*)                ICON="";;
#     *centos*)                ICON="";;
#     *opensuse*|*tumbleweed*) ICON="";;
#     *sabayon*)               ICON="";;
#     *slackware*)             ICON="";;
#     *linuxmint*)             ICON="";;
#     *alpine*)                ICON="";;
#     *aosc*)                  ICON="";;
#     *nixos*)                 ICON="";;
#     *devuan*)                ICON="";;
#     *manjaro*)               ICON="";;
#     *rhel*)                  ICON="";;
#     *macos*)                 ICON="";;
#     *)                       ICON="";;
# esac

export STARSHIP_DISTRO=""


# starship config
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init bash)"

# pfetch
PF_ASCII=ubuntu pfetch

# fzf
export FZF_DEFAULT_COMMAND="fdfind --type f --color=never --hidden --exclude .git --search-path=$HOME"
export FZF_DEFAULT_OPTS="
--layout=reverse
--height 100%
--info=inline
--no-unicode
--margin=2,5
--preview-window=:hidden
--color fg:#DFBF8E,hl:#E78A4E,fg+:#E78A4E,bg+:#3C3836,hl+:#89B482,border:#DFBF8E
--color info:#E78A4E,prompt:#EA6962,spinner:#EA6962,pointer:#EA6962,marker:#EA6962
--prompt=' '
--header='FZF'
--bind '?:toggle-preview'
--bind 'ctrl-t:execute(echo {+} | xargs -o nvim)'
"
# --color fg:#DFBF8E,bg:#1D2021,hl:#E78A4E,fg+:#DFBF8E,bg+:#32302F,hl+:#EA6962,border:#DFBF8E

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
        --bind '?:toggle-preview'
        --header='SEARCH FILES'
        "

export FZF_ALT_C_COMMAND='fdfind --type d --color=never --hidden --exclude .git --search-path=$HOME'
export FZF_ALT_C_OPTS="
        --preview 'tree -C {} | head  -50'
        --header='CHANGE DIRECTORY'
        "

source /usr/share/doc/fzf/examples/key-bindings.bash

# fzf tab completion
source ~/.bashtools/fzf-bash-completion.sh
bind -x '"\t": fzf_bash_completion'

# keybinds
bind -x '"\C-f":"tmux-sessionizer"'
# BEGIN ANSIBLE MANAGED BLOCK
# dotbare
# SOURCE: https://github.com/kazhala/dotbare
source $HOME/.github/dotbare/dotbare.plugin.bash
export DOTBARE_DIR="$HOME/.dotfiles"
export DOTBARE_TREE="$HOME"
export DOTBARE_FZF_DEFAULT_OPTS="--preview-window=right:65%"
export EDITOR='nvim'
alias dots=dotbare
bind -x '"\C-g":"dotbare fedit"'
# END ANSIBLE MANAGED BLOCK
