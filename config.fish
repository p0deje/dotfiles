# oh-my-fish
set fish_path $HOME/.oh-my-fish

# Fish configuration
set fish_theme agnoster
set fish_plugins brew extract rbenv z
set fish_greeting ""
function fish_title
  basename {$PWD}
end

# oh-my-fish
. $fish_path/oh-my-fish.fish

set -x EDITOR mvim
set -x BUNDLER_EDITOR mvim
set -x LOLCOMMITS_FORK true
set -x FZF_DEFAULT_OPTS '-e --reverse'
set -x Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh
set -x JAVA_HOME (/usr/libexec/java_home)
set -gx PATH $PATH /usr/local/share/npm/bin

alias be 'bundle exec'
alias ve 'vagrant exec'
alias vim 'mvim'
alias git 'hub'

eval (direnv hook fish)
