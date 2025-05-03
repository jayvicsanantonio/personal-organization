# AI Rules File (`.rules`)

This document describes the purpose, format, and usage of the `.rules` file for AI assistants in this repository.

## Purpose

The `.rules` file provides a clear, project-specific set of operational guidelines for AI tools and coding assistants. It ensures consistent behavior, adherence to user preferences, and alignment with project requirements regardless of which AI assistant or editor is used.

## Usage

- The canonical rules file is named `.rules` and stored in the project root.
- For compatibility with different AI tools or editors, symlinks are created per project:
  - `.windsurfrules` for Windsurf
  - `.clinerules` for Cline
  - `.cursorrules` for Cursor
  - (Add more as needed)
- Each AI tool/editor should be configured or instructed to read from its respective symlinked rules file.

## Structure

The `.rules` file is written in Markdown and typically includes:

1. **Core Operating Principles**: General guidelines for AI behavior.
2. **Task Analysis Section**: Template for breaking down tasks, including purpose, requirements, steps, risks, and standards.
3. **Implementation Planning**: Structured plan for executing tasks with detailed steps and expected challenges.
4. **Verification**: Instructions for continuous verification against quality standards and scope adherence.

## Example Symlink Commands

```sh
# For Windsurf
ln -sf .rules .windsurfrules
# For Cline
ln -sf .rules .clinerules
# For Cursor
ln -sf .rules .cursorrules
```

## Example Rule (Excerpt)

```
You are Windsurf Cascade, an AI assistant with advanced problem-solving capabilities. Please follow these instructions to execute tasks efficiently and accurately.

## Core Operating Principles
1. **Instruction Reception and Understanding**
   - Carefully read and interpret user instructions
   - Ask specific questions when clarification is needed
   ...
```

## Notes
- Update the `.rules` file as your operational preferences evolve.
- Ensure symlinks are updated or recreated if you rename or move the `.rules` file.
- Each project can have its own `.rules` file tailored to its needs.

---

For further details, see the actual `.rules` file in this repository.
