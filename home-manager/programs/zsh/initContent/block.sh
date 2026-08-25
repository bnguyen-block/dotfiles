# shellcheck disable=SC2164

export BLOCK_DIR="$HOME/Development/"
export PATH=$PATH:~/bin
export NODE_EXTRA_CA_CERTS=${HOMEBREW_PREFIX:-/opt/homebrew}/etc/ca-certificates/cert.pem
export COREPACK_NPM_REGISTRY=https://artifactory.global.square/artifactory/api/npm/square-npm/
export COREPACK_INTEGRITY_KEYS=0

alias gcurl=grpcurl
alias claude="claude --dangerously-skip-permissions"

kill-gradle() {
  ps -ef | grep -i gradle | awk '{print $2}' | head -n +2
}

docker-connect-mysql() {
  docker exec -it "$2" mysql -h 127.0.0.1 -P 3306 -u root -p "$1"
}

hermit shell-hooks --zsh

alias ccr="claude --resume"
alias ccoh="claude --model opus --effort high"
alias ccox="claude --model opus --effort xhigh"
alias ccfh="claude --model fable --effort high"
alias ccfx="claude --model fable --effort xhigh"

alias cdr="codex resume --all"
alias cdsh="codex -m gpt-5.6-sol -c model_reasoning_effort=high"
alias cdsx="codex -m gpt-5.6-sol -c model_reasoning_effort=xhigh"
