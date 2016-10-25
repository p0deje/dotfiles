set fish_greeting ""

function fish_title
  basename {$PWD}
end

set -x ANSIBLE_NOCOWS 1
set -x BUNDLER_EDITOR mvim
set -x EDITOR mvim
set -x FZF_DEFAULT_OPTS "--exact --reverse --color=bw"
set -x JAVA_HOME (/usr/libexec/java_home)
set -x LOLCOMMITS_FORK true
set -x Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh

set -gx PATH $PATH /usr/local/share/npm/bin
