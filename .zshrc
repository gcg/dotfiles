# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export HISTORY_IGNORE="(ls|cd|pwd|exit|vim|sudo reboot|history|cd -|cd ..)"


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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws brew colorize command-not-found composer docker docker-compose golang history npm macos laravel5 zsh-syntax-highlighting zsh-autosuggestions)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"

alias vim="nvim"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias zshrc="vim ~/.zshrc && reload"
alias vimrc="vim ~/.config/nvim/init.lua"
alias alacrc="vim ~/.config/alacritty/alacritty.yml"
alias zkrc="vim ~/.config/zk/config.toml"
alias tmuxrc="vim ~/.config/tmux/tmux.conf && tmux source-file ~/.config/tmux/tmux.conf"
alias iftop="sudo iftop"
alias powertop="sudo powertop"
alias fuck='sudo "$BASH" -c "$(history p !!)"'
alias work="cd ~/Work/src/github.com/"
alias gml="git checkout main || git checkout master && git pull && git remote prune origin"
alias privatefox="firefox -private"
alias inchrome="chromium --incognito"
alias latestdocker='docker exec -it `docker ps -q --latest` /bin/sh'
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias cloudsql="$HOME/Documents/PoltioSecrets/cloud_sql_proxy -instances=poltio-164412:europe-west1:rds-to-sql-final=tcp:3306"
alias kevents="kubectl get events --sort-by='{.lastTimestamp}'"
alias backup="tar -p -cvf backup.tar .ssh .aws .config/nvim .tmux.conf .wakatime.cfg .zshrc .gnupg .gitconfig .zsh_history .config/wtf .config/gh .zshenv .config/kitty .alacritty.yml"
alias cupdate="COMPOSER_MEMORY_LIMIT=-1 composer update"
alias b="brew"
alias bu='b update && b upgrade && b upgrade --cask --greedy && b cleanup -s && b autoremove && b doctor'
alias k="kubectl"
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias artisan='php artisan'

export GOPATH=$HOME/Work
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export ANDROID_HOME=$HOME/Android/Sdk
export REACT_EDITOR=nvim
export EDITOR=nvim
export VISUAL="$EDITOR"
export EVENT_NOKQUEUE=1
export GPG_TTY=$(tty)
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.tmux/bin
export PATH=$PATH:$HOME/.local/bin
export ZK_NOTEBOOK_DIR=$HOME/Documents/Notes


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gcg/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gcg/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gcg/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gcg/google-cloud-sdk/completion.zsh.inc'; fi

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)


bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
