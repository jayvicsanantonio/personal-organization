# Git Secrets Configuration Script

## Overview

This script automates the setup of [git-secrets](https://github.com/awslabs/git-secrets) in your local git repository or globally. `git-secrets` helps prevent you from committing sensitive information such as passwords, API keys, or AWS secrets into your git repositories.

## Features

- Installs `git-secrets` if not already present.
- Configures `git-secrets` hooks for the current repository or globally.
- Adds custom secret detection patterns (e.g., AWS keys, generic passwords).
- Optionally imports additional rules from a `.rules` file.

## Prerequisites

- zsh shell
- Git installed
- Homebrew (for macOS, if using the install option)
- (Optional) `.rules` file with custom patterns

## Usage

```zsh
zsh git-secrets-setup.sh [--global] [--rules /path/to/.rules]
```

- `--global`: Configure `git-secrets` for all repositories on your system.
- `--rules`: Specify a custom rules file to import additional patterns.

### Example

```zsh
zsh git-secrets-setup.sh --rules .rules
```

## What the Script Does

1. **Checks for `git-secrets` installation:**  
   Installs via Homebrew if not present (macOS), or prompts for manual install otherwise.

2. **Initializes `git-secrets`:**

   - If `--global` is specified, installs hooks globally.
   - Otherwise, installs hooks for the current repository.

3. **Adds Common Patterns:**

   - AWS Access Key IDs and Secret Access Keys.
   - Generic patterns for passwords, tokens, and secrets.

4. **Imports Custom Rules:**  
   If a `.rules` file is provided, imports all patterns from it.

## Customizing Patterns

You can edit the `.rules` file to add your own regular expressions for secrets you want to block. Each line should be a valid regex pattern.

## Uninstalling

To remove `git-secrets` hooks:

- For a single repo:  
  Remove the hooks from `.git/hooks/`
- For global:  
  Remove the hooks from the global git template directory.

## References

- [git-secrets GitHub](https://github.com/awslabs/git-secrets)
- [git-secrets Documentation](https://github.com/awslabs/git-secrets#readme)
