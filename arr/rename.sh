#!/bin/bash

# Source directory where your files are located
SOURCE_DIR=~/Spidey

# Loop through all the .mp3 files
for file in "$SOURCE_DIR"/*.mp3; do
    # Rename the file by removing the unwanted part of the filename
    new_name=$(echo "$file" | sed 's/\.720p\.HULU\.WEBRip\.x264\-GalaxyTV\+//')

    # Rename the file
    mv "$file" "$new_name"
done
