# shellcheck disable=SC2164

export BLOCK_DIR="$HOME/Development/"

alias gcurl=grpcurl
alias bcurl=beyond-curl

# Theses functions is tightly coupled with tmux window and pane name
server() {
  service_name="$1"
  op="$2"
  usage="Usage: server [api|stubby] [up|down]"

  # shellcheck disable=SC3010
  if ! [[ "$op" == "up" || "$op" == "down" || "$service_name" == "api" || "$service_name" == "stubby" ]]; then
    echo "$usage"
    return
  fi

  window="bestie-servers"
  startup_command="be rails s"
  paneId=""

  # shellcheck disable=SC3010
  if [[ "$service_name" =~ "stubby" ]]; then
    startup_command="fd rb -E \"*lib/proto*\" | entr -rc bundle exec gruf"
    paneId="$window.2"
  else
    paneId="$window.1"
  fi

  # shellcheck disable=SC3010
  # shellcheck disable=SC2076
  if [[ "$op" == "up" ]]; then
    echo "Starting $service_name ..."
    tmux send-keys -t "$paneId" "$startup_command" Enter
    sleep 1
    echo "$service_name server is up !!!"
  fi

  # shellcheck disable=SC3010
  if [[ "$op" == "down" ]]; then
    echo "Shutting down $service_name ..."
    tmux send-keys -t "$paneId" C-C
    sleep 1
    echo "$service_name server is down !!!"
  fi
}
