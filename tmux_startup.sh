#!/bin/bash

ADMIN_SESSION="admin"
CHARGER_SESSION="charger"
SWAPPER_SESSION="swapper"
DRIVER_SESSION="driver"

sessions=("$ADMIN_SESSION" "$DRIVER_SESSION" "$SWAPPER_SESSION" "$CHARGER_SESSION")

for session in ${sessions[@]}; do
	if ! tmux has-session -t "$session" 2>/dev/null; then
		if [[ $session == "admin" ]]; then
			# create the session with an initial window named 'git'
			tmux new-session -d -s "$session" -n git

			tmux new-window -t "$session:" -n dev-server 
		else
			# create the session with an initial window named 'git'
			tmux new-session -d -s "$session" -n git

			tmux new-window -t "$session: " -n metro

			tmux new-window -t "$session: " -n android:dev
		fi
	fi
done

