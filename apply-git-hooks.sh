#!/bin/bash
# Script to apply git hooks to existing repositories

REPO_PATH=$1

if [ -z "$REPO_PATH" ]; then
    echo "Usage: $0 /path/to/repository"
    exit 1
fi

if [ ! -d "$REPO_PATH/.git" ]; then
    echo "Not a git repository: $REPO_PATH"
    exit 1
fi

echo "Applying git-secrets to $REPO_PATH..."
cd "$REPO_PATH"
git secrets --install

echo "Installing pre-commit hooks to $REPO_PATH..."
cd "$REPO_PATH"
pre-commit install

echo "Done! Hooks applied to $REPO_PATH"
