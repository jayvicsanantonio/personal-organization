#!/bin/bash
# Script to scan a repository for secrets in history

REPO_PATH=$1

if [ -z "$REPO_PATH" ]; then
    echo "Usage: $0 /path/to/repository"
    exit 1
fi

if [ ! -d "$REPO_PATH/.git" ]; then
    echo "Not a git repository: $REPO_PATH"
    exit 1
fi

echo "Scanning $REPO_PATH for secrets in history..."
cd "$REPO_PATH"
git secrets --scan-history

echo "Done! Check output for any detected secrets."
