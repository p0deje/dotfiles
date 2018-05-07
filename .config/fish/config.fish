set fish_greeting ""

function fish_title
  basename {$PWD}
end

set -x ANSIBLE_NOCOWS 1
set -x BUNDLER_EDITOR vimr
set -x EDITOR vimr
set -x JAVA_HOME (/usr/libexec/java_home)
set -x LOLCOMMITS_FORK true

set -x FZF_DEFAULT_OPTS "--reverse --exact"
set -x FZF_LEGACY_KEYBINDINGS 0

set -g fish_user_paths /usr/local/sbin $fish_user_paths
set -g fish_user_paths /usr/local/share/npm/bin $fish_user_paths
set -g fish_user_paths /opt/puppetlabs/bin $fish_user_paths
set -g fish_user_paths /usr/local/opt/node@8/bin $fish_user_paths

alias be 'bundle exec'
alias ve 'vagrant exec'
alias git 'hub'
alias cat '/usr/local/bin/ccat'
alias ccat '/bin/cat'

eval (direnv hook fish)

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

# Removes unused containers and images.
function docker-cleanup
  docker rm --force (docker ps --all --quiet --filter status=exited)
  docker rmi --force (docker images --all --quiet)
  rm -i $HOME/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
end

# Finds all terminated GCE instances and removes them.
function gcloud-destroy-terminated
  gcloud compute instances list | grep TERMINATED | awk '{ print $1 }' | xargs gcloud compute instances delete --zone us-central1-b
end
