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

# Register built-in AWS patterns (Access Key ID and Secret Access Key)
git secrets --register-aws --global

# ------------------------------
# Google API Keys
# ------------------------------
echo "Adding Google API key patterns..."

git secrets --add --global 'AIza[0-9A-Za-z_-]{35}'
git secrets --add --global 'GOOG[0-9A-Za-z_-]{20}'

# ------------------------------
# Slack Tokens
# ------------------------------
echo "Adding Slack token patterns..."

git secrets --add --global 'xox[baprs]-[0-9a-zA-Z]{10,48}'

# ------------------------------
# GitHub Tokens
# ------------------------------
echo "Adding GitHub token patterns..."

git secrets --add --global 'ghp_[0-9A-Za-z]{36}'

# ------------------------------
# Stripe Keys
# ------------------------------
echo "Adding Stripe secret key patterns..."

git secrets --add --global 'sk_live_[0-9a-zA-Z]{24}'

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
# JSON Web Tokens (JWT)
# ------------------------------
echo "Adding JWT token patterns..."

git secrets --add --global 'eyJ[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+'

# ------------------------------
# PEM Private Keys
# ------------------------------
echo "Adding PEM private key patterns..."

git secrets --add --global '\\-\\-\\-\\-\\-BEGIN PRIVATE KEY\\-\\-\\-\\-\\-'
git secrets --add --global '\\-\\-\\-\\-\\-BEGIN RSA PRIVATE KEY\\-\\-\\-\\-\\-'

# ------------------------------
# Configure git-secrets to scan all files
# ------------------------------

echo "Git secrets setup complete!"
echo "These patterns will now be checked whenever you commit code."
echo "To test if a file contains secrets, run: git secrets --scan /path/to/file"