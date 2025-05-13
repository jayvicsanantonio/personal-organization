#!/bin/zsh
# Git Secrets Configuration Script (zsh version)
# This script configures git-secrets to detect various types of credentials and sensitive information
# Usage: ./git-secrets-setup.sh

# Check if git-secrets is installed
if ! command -v git-secrets &> /dev/null; then
    echo "Error: git-secrets is not installed."
    echo "Please install it first. For example:"
    echo "  - On macOS: brew install git-secrets"
    echo "  - On other systems: follow instructions at https://github.com/awslabs/git-secrets"
    exit 1
fi

echo "Setting up git-secrets patterns for various credentials and sensitive information..."

# ------------------------------
# AWS Credentials
# ------------------------------
echo "Adding AWS credential patterns..."

# AWS Access Key IDs
git secrets --add --global 'AKIA[0-9A-Z]{16}'  # AWS Access Key ID pattern
git secrets --add --global 'ASIA[0-9A-Z]{16}'  # AWS STS temporary credentials
git secrets --add --global 'A3T[A-Z0-9]{13}'   # AWS Account ID variant
git secrets --add --global 'AKTP[0-9A-Z]{16}'  # AWS Session token

# AWS Secret Key regex pattern (case insensitive)
git secrets --add --global '(?i)aws(.{0,20})?(secret|key)[^a-zA-Z0-9]+'

# ------------------------------
# GitHub, GitLab Tokens
# ------------------------------
echo "Adding GitHub and GitLab token patterns..."

# GitHub tokens (personal access tokens, OAuth tokens, etc.)
git secrets --add --global 'gh[pousr]_[A-Za-z0-9_]{36,255}'

# GitLab personal access tokens
git secrets --add --global 'gitlab_pat_[A-Za-z0-9_-]+'
git secrets --add --global 'glpat-[A-Za-z0-9-_]{20,40}'

# ------------------------------
# Slack & Discord Tokens
# ------------------------------
echo "Adding Slack and Discord token patterns..."

# Slack tokens (bot, app, user, etc.)
git secrets --add --global 'xox[baprs]-[0-9a-zA-Z]{10,48}'
git secrets --add --global 'SLACK_API_TOKEN=[A-Za-z0-9-]+'

# Discord webhook URLs
git secrets --add --global 'discord(?:app)?\.com/api/webhooks/[0-9]+/[A-Za-z0-9_-]+'

# ------------------------------
# Google API Keys
# ------------------------------
echo "Adding Google API key patterns..."

# Google API keys
git secrets --add --global 'AIza[0-9A-Za-z-_]{35}'
git secrets --add --global 'GOOG[0-9A-Za-z=_-]{20,40}'

# ------------------------------
# Stripe API Keys
# ------------------------------
echo "Adding Stripe API key patterns..."

# Stripe live secret and publishable keys
git secrets --add --global 'sk_live_[0-9a-zA-Z]{24}'
git secrets --add --global 'pk_live_[0-9a-zA-Z]{24}'

# ------------------------------
# Authentication Tokens
# ------------------------------
echo "Adding authentication token patterns..."

# JWT Tokens (Bearer auth)
git secrets --add --global 'Bearer\s+[A-Za-z0-9\-_]+\.[A-Za-z0-9\-_]+\.[A-Za-z0-9\-_]+'

# Basic Authentication
git secrets --add --global 'Basic\s+[A-Za-z0-9=:_-]{10,100}'

# ------------------------------
# Generic API Keys, Secrets, and Tokens
# ------------------------------
echo "Adding generic API key, secret, and token patterns..."

# Common patterns for environment variables containing secrets
git secrets --add --global '[a-zA-Z_]*_API_KEY\s*=\s*[A-Za-z0-9\-_]{8,100}'
git secrets --add --global '[a-zA-Z_]*_SECRET\s*=\s*[A-Za-z0-9\-_]{8,100}'
git secrets --add --global '[a-zA-Z_]*_TOKEN\s*=\s*[A-Za-z0-9\-_]{8,100}'

# ------------------------------
# Private Keys
# ------------------------------
echo "Adding private key patterns..."

# Various private key formats
git secrets --add --global 'BEGIN RSA PRIVATE KEY'
git secrets --add --global 'BEGIN OPENSSH PRIVATE KEY'
git secrets --add --global 'BEGIN PRIVATE KEY'

# ------------------------------
# Configure git-secrets to scan all files
# ------------------------------

echo "Git secrets setup complete!"
echo "These patterns will now be checked whenever you commit code."
echo "To test if a file contains secrets, run: git secrets --scan /path/to/file"