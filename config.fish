# oh-my-fish
set fish_path $HOME/.oh-my-fish

# Fish configuration
set fish_theme agnoster
set fish_plugins brew extract rake rbenv
set fish_greeting ""

# oh-my-fish
. $fish_path/oh-my-fish.fish

# Environment
set -x EDITOR mvim
set -x BUNDLER_EDITOR mvim
set -x LOLCOMMITS_FORK true
set -x PATH "/usr/local/heroku/bin:$PATH"

# Aliases
alias be 'bundle exec'
alias ve 'vagrant exec'
alias vim 'mvim'
