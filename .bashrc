#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#Enable auto cd
shopt -s autocd

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cdpia='cd ~/Documents/UA/IA/tpg-tetris-ia_89119_85085/'
alias vim='neovide'
alias v='nvim'
alias anime='ani-cli'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export EDITOR=vim

#starship prompt
eval "$(starship init bash)"

#neofecth on terminal open
#neofetch --source /home/jtomaspm/.config/neofetch/asciiartanime5.txt
neofetch
