#!/bin/bash
set -euo pipefail

echo "Entry point script running"

# Detect workspace location (VS Code devcontainer auto-mount)
WORKSPACE_DIR=${WORKSPACE_DIR:-/workspaces/$(ls /workspaces)}

echo "Using workspace directory: $WORKSPACE_DIR"
cd "$WORKSPACE_DIR"

echo "Running bundle install..."
bundle install

CONFIG_FILE=_config.yml

start_jekyll() {
    echo "Starting Jekyll..."
    bundle exec jekyll serve --watch \
        --port=8080 \
        --host=0.0.0.0 \
        --livereload \
        --verbose \
        --trace \
        --force_polling &
}

start_jekyll

while true; do
    inotifywait -q -e modify,move,create,delete "$CONFIG_FILE"
    echo "Change detected in $CONFIG_FILE, restarting Jekyll"
    pkill -KILL -f jekyll
    start_jekyll
done


