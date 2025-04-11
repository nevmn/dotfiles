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

# pnpm
export PNPM_HOME="/home/maxim/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

export EDITOR=nvim

export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
