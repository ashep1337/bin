#!/bin/bash

# Exit on error
set -e

# Create output directory if it doesn't exist
mkdir -p audio

# Loop through all .webm files in the current directory
for file in *.webm; do
    # Skip if no .webm files found
    [ -e "$file" ] || {
        echo "No .webm files found."
        exit 1
    }

    # Get base filename (remove extension)
    base="${file%.webm}"

    # Define output path
    output="audio/${base}.mp3"

    echo "Extracting audio from '$file' → '$output'"

    # Use ffmpeg to extract audio
    ffmpeg -i "$file" -vn -acodec libmp3lame -q:a 2 "$output"

done

echo "✅ All audio files have been extracted to the 'audio/' directory."
