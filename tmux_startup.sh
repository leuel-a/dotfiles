#!/bin/bash

ADMIN_SESSION="admin"
CHARGER_SESSION="charger"
SWAPPER_SESSION="swapper"
DRIVER_SESSION="driver"
BACKEND_SESSION="backend"
BACKEND_MOBILE_SESSION="backend-mobile"

declare -A project_locations

location_prefix="$HOME/projects/addissoftware"

sessions=($ADMIN_SESSION $DRIVER_SESSION $SWAPPER_SESSION $CHARGER_SESSION)
backend_sessions=($BACKEND_SESSION $BACKEND_MOBILE_SESSION)

project_locations[$DRIVER_SESSION]="$location_prefix/driver-app" 
project_locations[$CHARGER_SESSION]="$location_prefix/charger-app" 
project_locations[$SWAPPER_SESSION]="$location_prefix/swapper-app" 
project_locations[$ADMIN_SESSION]="$location_prefix/admin-frontend" 
project_locations[$BACKEND_SESSION]="$location_prefix/dodi-Backend" 
project_locations[$BACKEND_MOBILE_SESSION]="$location_prefix/dodai-mobile-backend" 

# frontend sessions
for session in ${sessions[@]}; do
	if ! tmux has-session -t "$session" 2>/dev/null; then
		# create the session with an initial window named 'git'
		tmux new-session -d -s "$session" -c "${project_locations[$session]}" -n git 

		tmux new-window -t "$session:" -c "${project_locations[$session]}" -n nvim 

		# create the windows
		if [[ $session == "admin" ]]; then
			tmux new-window -t "$session:" -c "${project_locations[$session]}" -n server 
		else
			tmux new-window -t "$session:" -c "${project_locations[$session]}" -n metro
			tmux new-window -t "$session:" -c "${project_locations[$session]}" -n android:dev
			tmux new-window -t "$session:" -c "${project_locations[$session]}/src/app/components/common" -n common
		fi
	fi
done

# backend sessions
for b_session in ${backend_sessions[@]}; do
	if ! tmux has-session -t "$b_session" 2>/dev/null; then
		# create the session with an intial window named 'git'
		tmux new-session -d -s "$b_session" -c "${project_locations[$b_session]}" -n git 

		# create the windows for the sessions
		tmux new-window -t "$b_session:" -c "${project_locations[$b_session]}" -n server
		tmux new-window -t "$b_session:" -c "${project_locations[$b_session]}/src/models" -n models
	fi
done


# create emulator session
EMULATOR_SESSION_NAME="emulator"

if ! tmux has-session -t "$EMULATOR_SESSION_NAME" 2>/dev/null; then
	tmux new-session -d -s "$EMULATOR_SESSION_NAME" -n "medium_phone"
fi

# raylib project path
RAYLIB_SESSION_NAME="raylib"
RAYLIB_PROJECT_LOCATION="/home/leul/projects/leuel/raylib-visuals"

if ! tmux has-session -t "$RAYLIB_SESSION_NAME" 2>/dev/null; then
	tmux new-session -d -s "$RAYLIB_SESSION_NAME" -c "$RAYLIB_PROJECT_LOCATION" -n nvim 
	tmux new-window -t "$RAYLIB_SESSION_NAME" -c "$RAYLIB_PROJECT_LOCATION" -n zsh
fi

