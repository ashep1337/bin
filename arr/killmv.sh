#!/bin/bash

# Function to kill processes by script name
kill_process_by_name() {
    local script_name="$1"
    
    # Find the PIDs of the given script using a more reliable grep pattern
    echo "Searching for processes matching: $script_name"
    PIDS=$(ps aux | grep -v "grep" | grep -w "$script_name" | awk '{print $2}')

    # Check if PIDs were found
    if [ -z "$PIDS" ]; then
        echo "$script_name is not running."
    else
        # Loop through each PID and kill the process
        for PID in $PIDS; do
            echo "Killing $script_name with PID: $PID"
            kill "$PID"
            if [ $? -eq 0 ]; then
                echo "Process with PID $PID killed."
            else
                echo "Failed to kill process with PID $PID."
            fi
        done
    fi
}

# Kill Move_Movies.sh processes
kill_process_by_name "mvmovies.sh"

# Kill Move_TV.sh processes
kill_process_by_name "mvtv.sh"
