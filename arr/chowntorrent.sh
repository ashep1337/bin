#!/bin/bash

# Directory to watch
WATCH_DIR="/mnt/Raid_1/Media/Downloads/Torrents"

# User and group to set ownership
USER="ashep"
GROUP="ashep"

# Function to chown and move files
chown_and_move() {
    local file="$1"
    
    # Check if it's a file or directory
    if [ -e "$file" ]; then
        # Change ownership of the file/directory
        echo "Changing ownership of: $file"
        chown -R $USER:$GROUP "$file"
    fi
}

# Process existing files in the directory before monitoring new ones
echo "Processing existing files in $WATCH_DIR..."
for file in "$WATCH_DIR"/*; do
    chown_and_move "$file"
done
