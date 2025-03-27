# shellcheck disable=SC2164

export BLOCK_DIR="$HOME/Development/"
export PATH=$PATH:~/bin
export NODE_EXTRA_CA_CERTS=${HOMEBREW_PREFIX:-/opt/homebrew}/etc/ca-certificates/cert.pem
export COREPACK_NPM_REGISTRY=https://artifactory.global.square/artifactory/api/npm/square-npm/
export COREPACK_INTEGRITY_KEYS=0

alias gcurl=grpcurl

kill-gradle() {
  ps -ef | grep -i gradle | awk '{print $2}' | head -n +2
}

docker-connect-mysql() {
  docker exec -it "$1" mysql -h 127.0.0.1 -P 3306 -u root
}

hermit shell-hooks --zsh
