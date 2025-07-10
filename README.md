# Personal macOS Organization & Configuration

## Purpose

This repository serves as a central place to manage and document my personal organization system, configurations, scripts, and key resources used on my macOS environment. It aims to ensure consistency across machines (or after reinstalls), provide a version-controlled backup, and act as a personal reference guide.

## Contents

This repository contains various files and documentation related to my macOS setup and personal organization. Key contents include:

- **`bookmarks.md`**: A detailed guide explaining the categorization system for my browser bookmarks. This helps maintain consistency when adding new links.
- **`bookmarks.html`**: An exported HTML file of my curated and organized bookmarks, ready for import into Safari, Chrome, Firefox, or other browsers supporting the Netscape Bookmark File Format.
- **`Brewfile`**: A manifest of all applications, utilities, and tools to install via Homebrew on a new Mac.
- **`brewfile.md`**: Documentation explaining how to use the Brewfile for automated software installation.
- **`macos_defaults.md`**: Documentation explaining my macOS defaults settings for Dock, Finder, and Desktop Services configurations.
- **`defaults_settings.sh`**: An executable script containing my preferred macOS settings. This can be run on a new Mac to apply all my customized system preferences.
- **`export_defaults.sh`**: A utility script that exports current macOS preferences to generate an updated `defaults_settings.sh` file.
- **`setup-git-hooks.sh`**: Automation script for setting up Git security tools globally.
- **`apply-git-hooks.sh`**: Utility script to apply Git security hooks to existing repositories.
- **`scan-repo-for-secrets.sh`**: Utility script to scan repositories for secrets in Git history.
- **`git-security.md`**: Documentation on Git security tools and best practices for preventing credential leaks.
- **`git-secrets-setup.md`**: Documentation for the `git-secrets-setup.sh` script. See this file for detailed usage, prerequisites, and configuration instructions for automating git-secrets setup.

- **`.rules`**: Project-specific operational guidelines for AI coding assistants. Symlinks (e.g., `.windsurfrules`, `.clinerules`, `.cursorrules`) can be created to point to `.rules` for compatibility with different editors or AI tools.
- **`windsurf.settings.json`**: Contains settings for the Windsurf AI editor.
- _(Future additions may include:)_
  - Shell configuration files (`.zshrc`, `.bash_profile`, aliases, etc.)
  - Additional application settings or preferences
  - Installation scripts (e.g., using Homebrew Bundle)
  - Notes on preferred folder structures
  - Dotfiles for specific tools (`.vimrc`, `.gitconfig`, etc.)

## Structure

The repository is organized logically, aiming for clarity.

- **Root Directory:** Contains this `README.md`, the main `bookmarks.md` guide, `.rules` (AI assistant rules), and potentially top-level configuration or scripts. Symlinks for AI tools (e.g., `.windsurfrules`, `.clinerules`, `.cursorrules`) may also be present here, each pointing to `.rules`.
- **Bookmarks:** Includes the `bookmarks.html` file.
- **Git Security:** Includes scripts and documentation for Git security: `setup-git-hooks.sh`, `apply-git-hooks.sh`, `scan-repo-for-secrets.sh`, and `git-security.md`.
- _(Future directories might include `scripts/`, `config/`, `notes/`, etc., as needed.)_

Please refer to specific files like `bookmarks.md` for detailed explanations within their respective domains.

## Motivation

The primary motivations for creating and maintaining this repository are:

1.  **Consistency:** To quickly set up a familiar and efficient environment on a new Mac or after a system refresh.
2.  **Backup:** To have a reliable, version-controlled backup of important configurations and personalized resources like curated bookmarks.
3.  **Reference:** To serve as a personal knowledge base – "How did I set that up again?" or "Where did I save that useful link?".
4.  **Improvement:** Documenting the setup encourages thoughtful organization and refinement over time.
5.  **Security:** To ensure sensitive information like API keys and credentials are protected from accidental commits.

## Usage

- **Bookmarks:** The `bookmarks.html` file can be imported directly into most modern web browsers. Refer to `bookmarks.md` for the organizational philosophy behind it.
- **AI Assistant Rules:** The `.rules` file provides project-specific instructions for AI assistants. For each AI tool/editor, create a symlink (e.g., `ln -sf .rules .windsurfrules`) so the tool reads the correct rules. See `ai_assistant_rules.md` for details and examples.
- **Git Security Setup:** Run `./setup-git-hooks.sh` to configure git-secrets and pre-commit hooks globally. For existing repositories, use `./apply-git-hooks.sh /path/to/repo`. See `git-security.md` for detailed information.
- **Configuration Files (Future):** Specific instructions will be added if configuration files or setup scripts require manual steps or execution.

## Contributing

This is primarily a personal repository for my own use. While suggestions or questions via Issues are welcome, direct contributions (Pull Requests) are generally not expected unless specifically discussed.

## License

The contents of this repository are licensed under the [MIT License](LICENSE).
