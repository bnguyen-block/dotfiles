# shellcheck disable=SC2164

export BLOCK_DIR="$HOME/Development/"

alias gcurl=grpcurl

kill-gradle() {
  ps -ef | grep -i gradle | awk '{print $2}' | head -n +2
}

hermit shell-hooks --zsh
