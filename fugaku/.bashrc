# .bashrc

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/u10039/vatai/opt/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/u10039/vatai/opt/miniconda/etc/profile.d/conda.sh" ]; then
#         . "/home/u10039/vatai/opt/miniconda/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/u10039/vatai/opt/miniconda/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Functions
function set_env ()
{
  if [ -d "$1/bin" ]; then
    export PATH="$1/bin${PATH:+:${PATH}}"
  fi
  if [ -d "$1/bin64" ]; then
    export PATH="$1/bin64${PATH:+:${PATH}}"
  fi
  if [ -d "$1/lib" ]; then
    export LD_LIBRARY_PATH="$1/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
    export LIBRARY_PATH="$1/lib${LIBRARY_PATH:+:${LIBRARY_PATH}}"
  fi
  if [ -d "$1/lib64" ]; then
    export LD_LIBRARY_PATH="$1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
    export LIBRARY_PATH="$1/lib64${LIBRARY_PATH:+:${LIBRARY_PATH}}"
  fi
  if [ -d "$1/include" ]; then
    export C_INCLUDE_PATH="$1/include${C_INCLUDE_PATH:+:${C_INCLUDE_PATH}}"
    export CPLUS_INCLUDE_PATH="$1/include${CPLUS_INCLUDE_PATH:+:${CPLUS_INCLUDE_PATH}}"
  fi
  if [ -d "$1/man" ]; then
    export MAN_PATH="$1/man${MAN_PATH:+:${MAN_PATH}}"
  fi
}


# User specific aliases and functions
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

if [ -e /worktmp ]; then
  export TMPDIR=/workdir
fi

if [ -e $HOME/spack ]; then
  source $HOME/spack/share/spack/setup-env.sh
fi

# If not running interactively, don't do anything
[[ $- == *i* ]] || return

alias l="ls -l"
alias qs="pjsub -mb -me -mr -ms --mail-list "$(git config --get user.email)""
alias qt="pjstat"
alias st="source /home/ra000012/data/fj-pytorch-builds/v1.10/venv/bin/activate"
alias sf="source /home/ra000012/data/fj-pytorch-builds/v1.10-Kfast/venv/bin/activate"
alias newscr='screen -S $(basename $(pwd))'

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
        # spack load zsh /y6pyc7c
        module load zsh/5.8-fj-4.8.1-y6pyc7c
        HOST_COLOR=${RED_BG}
else
        # spack load zsh /xnhnbwj
        module load zsh/5.8-gcc-12.2.0-xnhnbwj
        HOST_COLOR=${CLEAR_COLOR}
fi

source /usr/share/bash-completion/completions/git
source /usr/share/git-core/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# export PS1='\h:(\u$(echo ${TERM} | sed -e 's/screen/@screen/' -e 's/xterm.*/@not_in_screen/')) \w$(__git_ps1 " (%s)")\$ '
export PS1="${USER_COLOR}\u${CLEAR_COLOR}@${HOST_COLOR}\h${CLEAR_COLOR} "'\w$(__git_ps1 " (%s)") $ '

[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

fndscr(){
  INDICES="$(seq 1 6)"
  for i in ${INDICES}; do 
    host=$(printf "login%d" $i);  
    files[$i]=$(mktemp)
    ssh $host screen -list >| ${files[$i]} & 
    pids[$i]=$!
  done 
  for i in ${INDICES}; do
    wait ${pids[$i]}
  done 
  for i in ${INDICES}; do
    wait ${pids[$i]}
    if [[ $(cat ${files[$i]} | wc -l) -ge 3 ]]; then
      cat ${files[$i]} | while read line; do 
        if [[ $line != There* ]] && [[ $line != */run/screen* ]]; then
          echo -n "ssh login${i} -t screen -r "
          echo ${line} | sed -e 's/(Detached)//'
        fi
      done
    fi
    rm ${files[$i]}
  done
}

if [[ ${TERM} == *screen* ]]; then
  exec zsh -l
else
  if [[ $- == *i* ]]; then
    pjstat
    echo "Choose your path"
    fndscr
  fi
fi

function try_to_build() {
        ARGS=("${@}")
        #try first in ramdisk and hope its big enough
        export TMP=/worktmp ; export TMPDIR=/worktmp
        exec "${ARGS[@]}" && return
        #if not work, then llio disk
        export TMP=/local ; export TMPDIR=/local
        exec "${ARGS[@]}" || cp -r "${TMP}/$(whoami)/spack-stage" ~/project_SPRT/
}


