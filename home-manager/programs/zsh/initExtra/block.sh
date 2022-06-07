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
  command="be rails s"

  # shellcheck disable=SC3011
  if [[ "$service_name" =~ "stubby" ]]; then
    command="be gruf"
  fi

  for pane in $(tmux list-panes -t "$window" -F "#{pane_current_path}:#W.#P"); do
    paneId=$(echo "$pane" | awk -F ":" '{print $2}')
    # shellcheck disable=SC3010
    # shellcheck disable=SC2076
    if [[ "$pane" =~ "$service_name" ]]; then
      if [[ "$op" == "up" ]]; then
        echo "Starting $service_name ..."
        tmux send-keys -t "$paneId" "$command" Enter
        sleep 3
        echo "$service_name server is up !!!"
      fi

      if [[ "$op" == "down" ]]; then
        echo "Shutting down $service_name ..."
        tmux send-keys -t "$paneId" C-C
        sleep 3
        echo "$service_name server is down !!!"
      fi
    fi
  done
}
