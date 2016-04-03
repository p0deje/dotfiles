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
  echo "Movie $name has been added to home videos."
  open /Applications/iTunes.app
end

# Loads Docker environment if necessary and delegates execution
# to Docker exectuable.
function docker
  [ "$DOCKER_MACHINE_NAME" = "" ]; and eval (docker-machine env default)
  eval (which docker) $argv
end

# Removes unused containers and images.
function docker-cleanup
  docker rm --force (docker ps --all --quiet --filter status=exited)
  docker rmi --force (docker images --all --quiet)
end

# Finds all terminated GCE instances and removes them.
function gcloud-destroy-terminated
  gcloud compute instances list | grep TERMINATED | awk '{ print $1 }' | xargs gcloud compute instances delete --zone us-central1-b
end
