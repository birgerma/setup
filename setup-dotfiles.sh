
if [ -f ~/.bash_aliases ]; then
    ALIAS_FILE=~/.bash_aliases
else
    ALIAS_FILE=~/.bashrc
fi

# Trust github keys
gitkey1="github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ=="
gitkey2="github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg="
gitkey3="github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl"
if  grep -q "${gitkey1}" "${HOME}/.ssh/known_hosts" ; then
        echo 'Git key exists, do nothing' ;
    else
        echo 'Git key does not exist, adding alias' ;
	mkdir ${HOME}/.ssh
	touch ${HOME}/.ssh/known_hosts
        echo ${gitkey1} >> ${HOME}/.ssh/known_hosts
	echo ${gitkey2} >> ${HOME}/.ssh/known_hosts
	echo ${gitkey3} >> ${HOME}/.ssh/known_hosts
fi
#echo $gitkey1 >> ~/.ssh/known_hosts

echo "First arg:$1"

if [ $1 == "SSH" ] ; then
	REMOTE_URL=git@github.com:birgerma/config.git
else
	echo "NO SSH"
	REMOTE_URL=https://github.com/birgerma/config.git
fi

CONFIG_ALIAS='alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"'

function add_alias(){
    # Only add append aliases if not already in TARGET_FILE
    if  grep -q "${1}" "$ALIAS_FILE" ; then
        echo 'Alias exists, do nothing' ; 
    else
        echo 'Alias does not exist, adding alias' ;
	echo ${1} >> $ALIAS_FILE
    fi
}

mkdir ${HOME}/.cfg
git clone --bare $REMOTE_URL $HOME/.cfg || true
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME push --set-upstream origin main

# Backup and rename
# mv $HOME/.bashrc "$HOME/.bashrc.bak$(date +%s)"
# /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout

# add_alias "${CONFIG_ALIAS}"
echo "Run \"${CONFIG_ALIAS}\" to add alias. Add to .bashrc if you wish."
echo "Run \"config checkout\" to extract all dotfiles. Resolve potential duplicates."
