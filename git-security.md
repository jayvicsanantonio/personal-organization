# Git Security Tools

This document describes the Git security tools configured in this repository to prevent accidental commits of sensitive information like API keys, tokens, and credentials.

## Overview

Two primary tools are used to safeguard against accidentally committing secrets:

1. **git-secrets** - Scans commits, commit messages, and merges for secrets
2. **pre-commit** - Provides a framework for running checks before commits

These tools work together to create multiple layers of protection against leaked credentials.

## Setup

An automated setup script is provided to configure these tools:

```bash
# Run from the repository root
./setup-git-hooks.sh
```

This script:
- Installs git-secrets and pre-commit (if not already installed)
- Configures git-secrets globally with common secret patterns
- Sets up global git templates so hooks are automatically installed in new repositories
- Creates a global pre-commit configuration with security-focused hooks
- Sets up a global .gitignore for sensitive files
- Creates utility scripts (described below)

## Utility Scripts

Two utility scripts are provided in the repository root:

### apply-git-hooks.sh

Apply git-secrets and pre-commit hooks to an existing repository:

```bash
./apply-git-hooks.sh /path/to/your/repository
```

This is useful for adding security hooks to repositories that were created before the global hooks were set up.

### scan-repo-for-secrets.sh

Scan an existing repository for secrets that might be in the git history:

```bash
./scan-repo-for-secrets.sh /path/to/your/repository
```

Use this to check if any sensitive information has already been committed to a repository.

## Protected Patterns

The setup automatically configures git-secrets to detect common credential patterns:

- AWS credentials (access keys, secret keys)
- Private keys
- API keys (various formats)
- GitHub tokens and access tokens
- Secret keys and authentication tokens

## Global Configuration

The setup creates:

1. **Global git template directory** at `~/.git-templates/git-secrets`
2. **Global pre-commit configuration** at `~/.config/pre-commit/config.yaml`
3. **Global .gitignore** that excludes common sensitive files:
   - .env files
   - .pem files
   - secrets.json
   - settings.json with credentials

## Best Practices

Even with these tools in place, follow these best practices:

1. **Never hardcode credentials** - Use environment variables or dedicated credential management systems
2. **Use .env files** - For local environment variables (already added to global .gitignore)
3. **Regularly scan repositories** - Use the `scan-repo-for-secrets.sh` script periodically
4. **Review before commits** - Always review changes before committing

## Troubleshooting

If git-secrets is blocking a commit that doesn't actually contain secrets:

```bash
# Skip git hooks for a single commit (use with caution!)
git commit --no-verify
```

For pre-commit hooks, you can skip specific hooks:

```bash
# Skip a specific hook
pre-commit run --hook-stage pre-commit --hook-type detect-private-key
```
