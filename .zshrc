# The following lines were added by compinstall
zstyle :compinstall filename '/home/vatai/.zshrc'

autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit
prompt grml-large

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# Insert last arg M-.
bindkey -M viins '\e.' insert-last-word

# Noclober
set -o noclobber

# set_env()
function set_env ()
{
  echo $1
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

# AutoJump
source /usr/share/autojump/autojump.zsh

# Gem
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# Powerline
powerline-daemon -q
source /usr/lib/python3.10/site-packages/powerline/bindings/zsh/powerline.zsh

dropbox-cli start
alias ringo='ssh -L 8080:ringo.is.s.u-tokyo.ac.jp:80 ringo.is.s.u-tokyo.ac.jp'
alias wttr="curl wttr.in"

PATH=${HOME}/bin:${HOME}/.local/bin:${PATH}

# Vim keys
bindkey -v
bindkey -M vicmd v edit-command-line
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# This should probably be last.
# if [ -z "$DISPLAY" ]  && [ -z "$SSH_CLIENT" ]; then
#     startx;
# fi

if [ "$TERM" = xterm-kitty ]; then
	echo KITTY autocomplete
	kitty + complete setup zsh | source /dev/stdin
fi
