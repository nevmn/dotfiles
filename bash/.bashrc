#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

set -o noclobber	# prevent overwrite of files
shopt -s checkwinsize	# line wrap on window resize

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export TERMINAL=kitty

export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"

export HISTSIZE=10000
export HISTFILESIZE=10000

source /usr/share/nvm/init-nvm.sh
