# Repository Guidelines

## Project Structure & Module Organization
Source, scripts, and documentation live at the repository root for quick auditing. Automation lives in shell scripts such as `setup-git-hooks.sh`, `apply-git-hooks.sh`, `export_defaults.sh`, and `scan-repo-for-secrets.sh`. Reference material sits alongside them (`bookmarks.md`, `git-security.md`, `brewfile.md`, `macos_defaults.md`). Configuration artifacts (`Brewfile`, `defaults_settings.sh`, `windsurf.settings.json`) should remain top-level so they are easy to diff after regenerating.

## Build, Test, and Development Commands
Use `brew bundle install --file=Brewfile` to recreate the expected macOS tooling baseline. Run `./setup-git-hooks.sh` after cloning to install and register `git-secrets` and pre-commit templates. Apply the hooks to an existing checkout with `./apply-git-hooks.sh $(pwd)`. Regenerate macOS defaults by executing `./export_defaults.sh`, then inspect the staged `defaults_settings.sh` diff before committing. To apply a saved profile on a new machine, run `bash defaults_settings.sh`.

## Coding Style & Naming Conventions
Scripts target Bash or Zsh; keep the shebang aligned with the language you extend and stay consistent with four-space indentation inside conditionals and loops. Prefer descriptive, hyphenated filenames for automation (`<verb>-<object>.sh`) and lowercase-with-hyphen Markdown titles. Group related logic with blank lines and annotate non-obvious shell steps with concise comments. Document updates should use second-level headings (`##`) and short paragraphs or bullet lists for quick scanning.

## Testing Guidelines
There is no formal test harness; validate changes by running the touched scripts locally and confirming they exit cleanly. Lint shell edits with `shellcheck <file>` if available, and rerun `brew bundle check --file=Brewfile` after modifying dependencies. When adjusting defaults exports, compare against a known-good backup or run `defaults read` spot checks before trusting regenerated values. Always execute `./scan-repo-for-secrets.sh $(pwd)` to ensure git history stays free of sensitive data prior to publishing.

## Commit & Pull Request Guidelines
Follow the existing convention of concise, imperative commit subjects (e.g., "Add Windsurf settings.json"). Squash noisy or experimental commits before opening a pull request. PR descriptions should summarize intent, list affected scripts or docs, and note manual validation steps or environment prerequisites. Link back to any relevant notes or checklists and attach screenshots when documenting UI-facing defaults or bookmark structures. Confirm `git status` is clean and hooks are present before requesting review.

## Security & Configuration Tips
Keep Homebrew bundle definitions lean; remove abandoned tools instead of commenting them out. Avoid hard-coding credentials—rely on `git-secrets` patterns and environment variables when documenting sensitive workflows. When sharing configuration snippets, scrub machine-specific identifiers and prefer placeholders (`<username>`, `/path/to/repo`).
