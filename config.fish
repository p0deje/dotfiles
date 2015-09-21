set fish_path $HOME/.oh-my-fish

set fish_theme agnoster
set fish_plugins brew extract rbenv z
set fish_greeting ""
function fish_title
  basename {$PWD}
end

source $fish_path/oh-my-fish.fish

set -x ANSIBLE_NOCOWS 1
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
alias cat '/usr/local/bin/ccat'
alias ccat '/bin/cat'

# https://github.com/nvbn/thefuck
function fuck
  eval (thefuck $history[1])
end

# Prints list of currently modified files to stdout,
# formatted for piping to other commands. Useful to rerun all modified tests
#
# Usage:
#   git-modified [directory|files|glob]
#
# Examples:
#   git-modified spec | rspec
function git-modified
  git ls-files -m $argv | tr "\n" " \0"
end

# Converts MKV movie to a new one and imports it to iTunes.
# Once completed, opens iTunes. New movie will be show in "Home Videos" tab.
#
# Usage:
#   mkv-to-itunes [source] [movie-name]
function mkv-to-itunes
  set src $argv[1]
  set name $argv[2]
  ffmpeg -i $src -c:v copy -c:a aac -b:a 256k -strict -2 $name.mp4
  mv $name.mp4 ~/Music/iTunes/iTunes\ Media/Automatically\ Add\ to\ iTunes.localized
  rm $src
  open /Applications/iTunes.app
end

eval (direnv hook fish)
