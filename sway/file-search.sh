#!/bin/bash

# Use 'fd' to find all files starting from the user's home directory (~).
# Ignore hidden files, git, and node_modules directories for speed.
# The output is piped to wofi for selection.

FILE_PATH=$(
  fdfind \
    --type f \
    --hidden \
    --exclude .git \
    --exclude node_modules \
    --exclude cache \
    --max-depth 5 \
    . ~ | wofi --show dmenu \
    --prompt "Search Files:" \
    --allow-images
)

# Check if a file was selected
if [ -n "$FILE_PATH" ]; then
    # Use xdg-open to launch the file with the default application (e.g., Zathura for PDF)
    xdg-open "$FILE_PATH" &
fi
