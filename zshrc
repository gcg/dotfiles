# Path to your oh-my-zsh installation.
export ZSH=/Users/gcg/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

plugins=(git github go golang redis-cli battery bower brew bundler cake capistrano composer npm osx rails zsh_reload laravel4 laravel5)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh


alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias zshrc="vim ~/.zshrc && reload"
alias vimrc="vim ~/.vimrc"

export GOPATH=$HOME/Workspace/go
export PATH=$PATH:$GOPATH/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

alias fuck='sudo $(fc -ln -1)'
alias up='vagrant up'
alias down='vagrant halt'
alias destroy='vagrant destroy'

