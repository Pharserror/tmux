#! /bin/bash

# Start a Tmux session named development
/usr/bin/tmux new -s development -d
echo "Started Development tmux session"

# loop to monitor for the development session
while true
do
  if [[ "$(tmux ls)" != *"development"* ]]; then
    /usr/bin/tmux new -s development -d
    echo "Restarted Development tmux session due to missing pid"
  fi
  sleep 5
done
