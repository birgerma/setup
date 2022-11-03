
ALIAS_FILE=$HOME/.bashrc

REMOTE_URL=git@github.com:birgerma/config.git
CONFIG_ALIAS='alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"'
# alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

function add_alias(){
    # Only add append aliases if not already in TARGET_FILE
    if  grep -q "${1}" "$ALIAS_FILE" ; then
        echo 'Alias exists, do nothing' ; 
    else
        echo 'Alias does not exist, adding alias' ;
	echo ${1} >> $ALIAS_FILE
    fi
}

git clone --bare $REMOTE_URL $HOME/.cfg || true
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME push --set-upstream origin main
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout

add_alias "${CONFIG_ALIAS}"




