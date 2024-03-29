set fish_greeting ""

function fish_title
  basename {$PWD}
end

set -x ANSIBLE_NOCOWS 1
set -x BAT_THEME ansi
set -x BUNDLER_EDITOR nvim
set -x EDITOR nvim
set -x LANG en_US.UTF-8
set -x LOLCOMMITS_DEVICE "FaceTime HD Camera"
set -x LOLCOMMITS_FORK true
set -x USE_GKE_GCLOUD_AUTH_PLUGIN True

set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_DEFAULT_OPTS "--history=$HOME/.fzf_history --reverse"
set -x FZF_LEGACY_KEYBINDINGS 0

set -x PATH /usr/local/sbin $PATH
set -x PATH /opt/homebrew/opt/openjdk/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
# Created by `pipx` on 2023-10-26 15:12:05
set -x PATH $HOME/.local/bin $PATH

alias be 'bundle exec'
alias cat 'bat'
alias git 'hub'
alias ve 'vagrant exec'

eval (/opt/homebrew/bin/brew shellenv)
eval (direnv hook fish)

source /opt/homebrew/opt/asdf/libexec/asdf.fish

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
  echo "Movie $name has been added to home videos."
  open /Applications/iTunes.app
end

# Finds all terminated GCE instances and removes them.
function gcloud-destroy-terminated
  gcloud compute instances list | grep TERMINATED | awk '{ print $1 }' | xargs gcloud compute instances delete --zone us-central1-b
end

# Convert input video for Mac App Store preview format:
# - generates silent audio track
# - scales to 1920x1080 and fills the background with white
# - forces 30 FPS
function convert-to-mac-app-preview
  ffmpeg -f lavfi -i anullsrc -i $argv[1] \
         -vf scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=white,setsar=1,fps=30 \
         -c:a aac -map 0:a -map 1:v -shortest Preview.mp4
end

function maccy-backup
  cp -R \
    "$HOME/Library/Containers/org.p0deje.Maccy/Data/Library/Application Support/Maccy/" \
    "$HOME/Downloads/maccy.backup"
end

function maccy-restore
  cp -R \
    "$HOME/Downloads/maccy.backup/" \
    "$HOME/Library/Containers/org.p0deje.Maccy/Data/Library/Application Support/Maccy/"
  rm -r "$HOME/Downloads/maccy.backup/"
end
