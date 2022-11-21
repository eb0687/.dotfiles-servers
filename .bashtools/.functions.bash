# Change up a variable number of directories
# E.g:
#   cu   -> cd ../
#   cu 2 -> cd ../../
#   cu 3 -> cd ../../../
function cu {
    local count=$1
    if [ -z "${count}" ]; then
        count=1
    fi
    local path=""
    for i in $(seq 1 ${count}); do
        path="${path}../"
    done
    cd $path
}

# FZF functions
open-at-line () {
  nvim $(rg --line-number . | fzf --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' | awk -F ':' '{print "+"$2" "$1}')
}

function falias(){
    alias | cut -c 7- | fzf
}

# Git functions
function gcoma () {
    git add .
    git commit -m "$1"
}

ansible-role-fd() {
    local ANSIBLE_ROLE_DIR="$HOME/.ansible/roles/"
    local FD_RESULT=$(fdfind . $ANSIBLE_ROLE_DIR | fzf --header='Ansible Roles:')
    echo $ANSIBLE_DIR

    if [[ -d $ANSIBLE_ROLE_DIR ]]; then
        if [[ -d $FD_RESULT ]]; then
            cd "$FD_RESULT" || exit
        elif [[ -f $FD_RESULT ]]; then
            /usr/bin/nvim "$FD_RESULT"
        fi
    else
        echo -e "\n$ANSIBLE_ROLE_DIR does not exist, are you sure you have ansible installed on this device?"
        echo -e "\nCheck using the command: whereis ansible"
    fi
}

# a better clear command
function cl () {
    clear -x
    ls -lFh
}
