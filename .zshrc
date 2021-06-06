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
source /usr/share/autojump/autojump.zsh

powerline-daemon -q
source /usr/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh

dropbox-cli start
alias ringo='ssh -L 8080:ringo.is.s.u-tokyo.ac.jp:80 ringo.is.s.u-tokyo.ac.jp'

PATH=/home/vatai/.gem/ruby/2.6.0/bin:${HOME}/.local/bin:${PATH}

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
