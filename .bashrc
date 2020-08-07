#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias cl='clear'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
PS1='[\u@\h \W]\$ '

set -o noclobber	# prevent overwrite of files
shopt -s checkwinsize	# line wrap on window resize

export DOTDROP_PROFILE="arch-pc"
export DOTDROP_CONFIG="~/.config/dotdrop/config.yaml"
export TERMINAL=kitty

export PATH="$HOME/.local/bin:$PATH"

export HISTSIZE=10000
export HISTFILESIZE=10000

source /usr/share/bash-complete-alias/complete_alias
