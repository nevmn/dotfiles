# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
if [[ -r "/usr/share/oh-my-zsh/" ]]; then
  ZSH=/usr/share/oh-my-zsh/
else
  ZSH=/usr/local/share/ohmyzsh/
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Set fzf installation directory path
# export FZF_BASE=/path/to/fzf/install/dir

# Uncomment to set the FZF_DEFAULT_COMMAND
# export FZF_DEFAULT_COMMAND='<your fzf default commmand>'

# Uncomment the following line to disable fuzzy completion
# DISABLE_FZF_AUTO_COMPLETION="true"

# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# DISABLE_FZF_KEY_BINDINGS="true"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"'
  --color=fg:#d4d4d4,fg+:#d4d4d4,bg:#1f1f1f,bg+:#222222
  --color=hl:#608b4e,hl+:#C586C0,info:#C586C0,marker:#C586C0
  --color=prompt:#C586C0,spinner:#C586C0,pointer:#C586C0,header:#608b4e
  --color=border:#808080,label:#C586C0,query:#d4d4d4'

# Would you like to use another custom folder than $ZSH/custom?
if [[ -r "/usr/share/zsh" ]]; then
  ZSH_CUSTOM=/usr/share/zsh
else
  ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
fi

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(extract docker nvm fzf systemadmin git docker-compose common-aliases command-not-found)
if [[ -r "/usr/local/share/zsh-autosuggestions" ]]; then
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    plugins+=(zsh-autosuggestions)
fi

if [[ -r "/usr/local/share/zsh-syntax-highlighting" ]]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    plugins+=(zsh-syntax-highlighting)
fi


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

set -o noclobber	# prevent overwrite of files

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export TERMINAL=alacritty
export TIME_STYLE=long-iso

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.yarn/bin:$HOME/go/bin:$PATH"

export HISTSIZE=10000
export HISTFILESIZE=10000

source $ZSH/oh-my-zsh.sh
if command -v pacman > /dev/null; then
  source /usr/share/doc/pkgfile/command-not-found.zsh
  source /usr/share/nvm/init-nvm.sh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey \^U backward-kill-line

function enabletor() {
    export http_proxy="socks5://127.0.0.1:9050"
    export https_proxy="socks5://127.0.0.1:9050"
    export all_proxy="socks5://127.0.0.1:9050"
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
}

function disabletor() {
    unset {http,https,all}_proxy
}

# pnpm
export PNPM_HOME="/home/maxim/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

export RUSTC_WRAPPER=sccache

export GOTELEMETRY=off
export GOPROXY=direct

export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
