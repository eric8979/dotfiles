# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/scrappy/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export EDITOR=vim

alias x=exit
alias l=ls
alias c=clear


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GOROOT=/usr/local/go
export GOPATH=$HOME/Development/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

cutter() {
	mkdir -p ~/.config/radare2
	mkdir -p ~/.local/share/radare2/projects
	mkdir -p ~/.config/Cutter
	touch ~/.radare2rc

	xhost +local:docker && \
		docker run \
		--rm \
		-it \
		--name cutter \
		--net=host \
		-e DISPLAY=$DISPLAY \
		-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		-v ~/.radare2rc:/home/r2/.radare2rc:ro \
		-v ~/.config/radare2:/home/r2/.config/radare2:ro \
		-v ~/.local/share/radare2/projects:/home/r2/.local/share/radare2/projects \
		-v ~/.config/Cutter:/home/r2/.config/Cutter \
		-v ~/Lab/samples:/home/r2/samples:ro \
		cutter

	xhost -local:docker
}

r2() {
	docker run \
		-it \
		-v ~/.radare2rc:/home/r2/.radare2rc:ro \
		-v ~/.config/radare2:/home/r2/.config/radare2:ro \
		-v ~/.local/share/radare2/projects:/home/r2/.local/share/radare2/projects \
		-v ~/Lab/samples:/home/r2/samples:ro \
		r2
}

samba() {
	docker run \
		--rm \
		-v ~/Lab/samples/:/shared \
		-p 192.168.3.1:137:137/udp \
		-p 192.168.3.1:138:138/udp \
		-p 192.168.3.1:139:139 \
		-p 192.168.3.1:445:445 \
		--name samba \
		samba
}

