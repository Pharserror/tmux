#! /bin/bash

# Start a Tmux session named taisun
/usr/bin/tmux new -s taisun -d
echo "Started Taisun tmux session"

# loop to monitor for the taisun session
while true
do
  if [[ "$(tmux ls)" != *"taisun"* ]]; then
    /usr/bin/tmux new -s taisun -d
    echo "Restarted Taisun tmux session due to missing pid"
  fi
  sleep 5
done
