#!/bin/zsh
# setup-git-hooks.sh - Automation script for git-secrets and pre-commit setup (zsh version)

echo "Setting up git-secrets and pre-commit hooks globally..."

# Step 1: Ensure tools are installed (already in Brewfile)
if ! command -v git-secrets &> /dev/null; then
    echo "Installing git-secrets..."
    brew install git-secrets
fi

if ! command -v pre-commit &> /dev/null; then
    echo "Installing pre-commit..."
    brew install pre-commit
fi

# Step 2: Set up git-secrets globally
echo "Configuring git-secrets globally..."
git secrets --install ~/.git-templates/git-secrets
git config --global init.templateDir ~/.git-templates/git-secrets

# Register common patterns to detect
git secrets --register-aws --global
git secrets --add --global 'private_key'
git secrets --add --global 'api[_]?key'
git secrets --add --global 'github_token'
git secrets --add --global 'access_token'
git secrets --add --global 'secret_key'
git secrets --add --global 'auth_token'
git secrets --add --global --literal 'GITHUB_PERSONAL_ACCESS_TOKEN'

# Step 3: Create global pre-commit configuration
echo "Creating global pre-commit configuration..."
mkdir -p ~/.config/pre-commit
cat > ~/.config/pre-commit/config.yaml << 'EOF'
repos:
-   repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
    -   id: detect-private-key
    -   id: detect-aws-credentials
    -   id: check-added-large-files
    -   id: trailing-whitespace
    -   id: check-yaml

-   repo: https://github.com/Yelp/detect-secrets
    rev: v1.4.0
    hooks:
    -   id: detect-secrets
EOF

# Step 4: Create global .gitignore for sensitive files
echo "Setting up global .gitignore..."
cat > ~/.gitignore_global << 'EOF'
# Secrets and credentials
.env
.env.local
*.pem
secrets.json
settings.json
.vscode/settings.json
EOF
git config --global core.excludesfile ~/.gitignore_global

# Step 5: Create a script to apply hooks to existing repositories
cat > ./apply-git-hooks.sh << 'EOF'
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
EOF
chmod +x ./apply-git-hooks.sh

echo "Creating script to scan for secrets in history..."
cat > ./scan-repo-for-secrets.sh << 'EOF'
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
EOF
chmod +x ./scan-repo-for-secrets.sh

echo "Done! Setup complete."
echo "For new repositories: Hooks will be automatically installed"
echo "For existing repositories: Run ./apply-git-hooks.sh /path/to/repo"
echo "To scan existing repos for secrets: Run ./scan-repo-for-secrets.sh /path/to/repo"
