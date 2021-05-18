# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
set -o noclobber

alias l="ls -l"

PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# TMPDIR=/tmp
# export TMPDIR

# autojump
[[ -e /home/g9300001/u93143/.autojump/etc/profile.d/autojump.sh ]] && source /home/g9300001/u93143/.autojump/etc/profile.d/autojump.sh

# spack
[[ -e ~/spack/share/spack/setup-env.sh ]] && source ~/spack/share/spack/setup-env.sh

# git prompt
source /usr/share/git-core/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

# My stuff

BLUE_BG='\[\033[44m\]'
RED_BG='\[\033[41m\]'
RED_FG='\[\033[00;31m\]'
CLEAR_COLOR='\[\033[00m\]'
if [[ ${TERM} == *screen* ]]; then
	USER_COLOR=${BLUE_BG}
else
	USER_COLOR=${RED_FG}
fi
if [[ ${HOSTNAME} == *-* ]]; then
	HOST_COLOR=${RED_BG}
else
	HOST_COLOR=${CLEAR_COLOR}
fi
export PS1="${USER_COLOR}\u${CLEAR_COLOR}@${HOST_COLOR}\h${CLEAR_COLOR} \w"'$(__git_ps1 " (%s)") $ '

