# Path to your oh-my-zsh installation.
export ZSH=/Users/gcg/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

plugins=(git github go golang redis-cli battery bower brew bundler cake capistrano composer npm osx rails zsh_reload laravel4 laravel5 git-flow git-flow-completion)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh


alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias zshrc="vim ~/.zshrc && reload"
alias vimrc="vim ~/.vimrc"
alias tmuxrc="vim ~/.tmux.conf && tmux source-file ~/.tmux.conf"

# Gopath settings
export GOPATH=$HOME/Work
export PATH=$PATH:$GOPATH/bin


# PHP For OSX
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

# tmux scripts to the bin
export PATH=$PATH:$HOME/.tmux/bin

alias fuck='sudo $(fc -ln -1)'
alias up='vagrant up'
alias down='vagrant halt'
alias destroy='vagrant destroy'
alias dev="ssh dev.gcg.me"
alias work="cd ~/Work/src/github.com/"

alias andy='./gradlew assembleRelease && ./gradlew publishApkRelease'
alias andy_device='./gradlew assembleRelease && adb install -r app/build/outputs/apk/app-release.apk'

DISABLE_AUTO_TITLE=true

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export ANDROID_HOME=~/Library/Android/sdk
export PATH="~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:${PATH}"

export REACT_EDITOR=vim

export EDITOR=vim

export HOMEBREW_GITHUB_API_TOKEN="3e4def9c84587164bb6105ebd0a7cf21e936373e"

export PATH=~/.composer/vendor/bin:$PATH

export PATH=~/Library/Python/2.7/bin:$PATH

#export NVM_DIR="/Users/gcg/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export EVENT_NOKQUEUE=1
export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.yarn/bin:$PATH"
