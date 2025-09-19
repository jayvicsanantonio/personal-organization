# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal macOS organization and configuration repository that contains:

- **Organizational files**: Bookmarks management, keyboard shortcuts documentation
- **System configuration**: macOS defaults settings, Homebrew packages, shell configurations
- **Security tools**: Git secrets prevention, repository scanning utilities
- **AI assistant rules**: Project-specific operational guidelines for AI tools

## Key Commands

### Git Security Operations
```bash
# Set up git-secrets and pre-commit hooks globally
./setup-git-hooks.sh

# Apply security hooks to an existing repository
./apply-git-hooks.sh /path/to/repository

# Scan repository for secrets in git history
./scan-repo-for-secrets.sh /path/to/repository
```

### macOS Configuration
```bash
# Apply macOS system preferences and defaults
./defaults_settings.sh

# Export current macOS settings to update defaults_settings.sh
./export_defaults.sh

# Install applications and tools via Homebrew
brew bundle install --file=Brewfile
```

## Architecture & Structure

### Core Components

- **`.rules`**: Central AI assistant rules file with symlinks for different AI tools (`.windsurfrules`, `.clinerules`, `.cursorrules`)
- **Git Security Framework**: Comprehensive git-secrets setup with automated hooks, pattern detection, and repository scanning
- **Configuration Management**: Declarative macOS settings via shell scripts and Homebrew Bundle
- **Documentation System**: Organized markdown files explaining setup procedures and organizational systems

### File Organization

- **Root directory**: Configuration files, scripts, and main documentation
- **Security utilities**: Git hooks setup, secrets scanning, and pattern detection
- **System management**: macOS defaults, Homebrew packages, and application settings
- **Reference materials**: Bookmarks organization, keyboard shortcuts, and personal documentation

## Important Guidelines

### AI Assistant Integration
- The `.rules` file contains comprehensive operational guidelines for AI assistants
- Different AI tools use symlinked rules files pointing to the central `.rules` file
- Follow the structured approach defined in `.rules` for task analysis and implementation

### Security Practices
- **Never commit secrets**: All scripts are configured to detect and prevent credential commits
- **Use git-secrets**: Automatically installed for all new repositories via global git templates
- **Regular scanning**: Use `scan-repo-for-secrets.sh` to audit existing repositories
- **Environment variables**: Sensitive data should use `.env` files (globally ignored)

### Configuration Management
- **Brewfile**: Declarative package management - modify this file rather than installing packages individually
- **Defaults scripts**: System preferences are version-controlled and repeatable
- **Documentation first**: All configurations are documented in corresponding `.md` files

## Development Workflow

1. **Security setup**: Run `./setup-git-hooks.sh` once to configure global git security
2. **System configuration**: Use `./defaults_settings.sh` for macOS setup on new machines
3. **Package management**: Modify `Brewfile` and run `brew bundle install` for software changes
4. **Documentation**: Update corresponding `.md` files when modifying configurations

## Special Considerations

- This repository contains personal configurations and organizational systems
- Scripts are designed for macOS environments with Homebrew
- Git security tools prevent accidental credential commits across all repositories
- AI assistant rules enforce structured task analysis and implementation planning