# starship config
export STARSHIP_DISTRO=""
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

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
        --bind '?:toggle-preview'
        --header='SEARCH FILES'
        "

export FZF_ALT_C_COMMAND="fdfind --type d --color=never --hidden --exclude .git --search-path=$HOME"
export FZF_ALT_C_OPTS="
        --preview-window=nohidden
        --preview 'tree -C {} | head  -50'
        --header='CHANGE DIRECTORY'
        "

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
    *)            fzf --preview-window=nohidden --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

source /usr/share/doc/fzf/examples/key-bindings.bash

# fzf tab completion
if [[ -f "$HOME/.github/fzf/shell/completion.bash" ]]; then
    source "$HOME/.github/fzf/shell/completion.bash"
fi
bind -x '"\t": fzf_bash_completion'

# fzf-marks
if [[ -f "$HOME/.github/fzf-marks/fzf-marks.plugin.bash"  ]]; then
    source "$HOME/.github/fzf-marks/fzf-marks.plugin.bash"
fi

# keybinds
bind -x '"\C-f":"tmux-sessionizer"'

# dotbare
# SOURCE: https://github.com/kazhala/dotbare
if [[ -f "$HOME/.github/dotbare/dotbare.plugin.bash" ]]; then
    source "$HOME/.github/dotbare/dotbare.plugin.bash"
fi
export DOTBARE_DIR="$HOME/.dotfiles"
export DOTBARE_TREE="$HOME"
export DOTBARE_FZF_DEFAULT_OPTS="--preview-window=nohidden --preview-window=right:50%"
export EDITOR='nvim'
alias dots=dotbare
bind -x '"\C-n":"dotbare fedit"'
