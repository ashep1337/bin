#!/bin/bash

# Directory to watch
WATCH_DIR="/mnt/Raid_1/Media/Downloads/Torrents/"

# Destination directory
DEST_DIR="/mnt/Raid_1/Media/Plex_Media/TV_Shows/"

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
        sudo  chown -R $USER:$GROUP "$file"

        # Move the file/directory to the destination folder
        echo "Moving $file to $DEST_DIR"
        mv "$file" "$DEST_DIR"
    fi
}

# Process existing files in the directory before monitoring new ones
echo "Processing existing files in $WATCH_DIR..."
for file in "$WATCH_DIR"/*; do
    chown_and_move "$file"
done

# Use inotifywait to monitor for new files or directories
echo "Monitoring $WATCH_DIR for new files..."
inotifywait -m -r -e create "$WATCH_DIR" | while read path action file; do
    # Full path of the newly added file/directory
    NEW_FILE="$path$file"
    
    # Change ownership and move the new file/directory
    chown_and_move "$NEW_FILE"
done
