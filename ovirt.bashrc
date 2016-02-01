# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export DISPLAY=:0
export PATH=$PATH:$HOME/bin
export GIT_EDITOR=vim
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export PREFIX=$HOME/deploy
export INTELLIJ_PATH=$HOME/idea
ln -s $HOME/$(dirname $(tar -tf $HOME/idea15.tar.gz | head -1)) $INTELLIJ_PATH
alias intellij='$INTELLIJ_PATH/bin/idea.sh'

