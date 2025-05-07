# macOS Defaults Guide

This document provides a comprehensive overview of the macOS defaults settings included in my defaults script. These settings allow for consistent configuration across machines and automated setup of a new Mac.

## What are macOS Defaults?

macOS defaults are system and application preferences stored in property list (`.plist`) files. These settings control various aspects of the system behavior, application settings, and user interface configurations.

The `defaults` command-line utility allows you to read, write, and delete these preferences from the Terminal.

## My Defaults Configuration

My defaults configuration focuses on three key areas:

1. **Dock settings** - Customizing the appearance and behavior of the Dock
2. **Finder settings** - Optimizing file browsing and view options
3. **Desktop Services settings** - Managing system behaviors for external drives

## Included Settings

### Dock Settings (`com.apple.dock`)

| Setting                   | Description                                  | My Value                    |
| ------------------------- | -------------------------------------------- | --------------------------- |
| `autohide`                | Automatically hide the Dock when not in use  | `1` (enabled)               |
| `minimize-to-application` | Minimize windows into their application icon | `0` (disabled)              |
| `orientation`             | Position of the Dock on screen               | `bottom`                    |
| `tilesize`                | Size of the Dock icons                       | `76`                        |
| `wvous-br-corner`         | Bottom right hot corner action               | `14` (Quick Note)           |
| `wvous-tr-corner`         | Top right hot corner action                  | `10` (Put display to sleep) |

### Finder Settings (`com.apple.finder`)

| Setting                | Description                        | Value                |
| ---------------------- | ---------------------------------- | -------------------- |
| `AppleShowAllFiles`    | Show hidden files                  | `0` (hidden)         |
| `ShowSidebar`          | Show the sidebar in Finder windows | `1` (visible)        |
| `ShowStatusBar`        | Show the status bar                | `0` (hidden)         |
| `ShowToolbar`          | Show the toolbar                   | `1` (visible)        |
| `FXPreferredViewStyle` | Default view style                 | Varies by folder     |
| `NewWindowTarget`      | Default folder for new windows     | `PfHm` (Home folder) |

### Desktop Services Settings (`com.apple.desktopservices`)

| Setting                    | Description                                | Value         |
| -------------------------- | ------------------------------------------ | ------------- |
| `DSDontWriteNetworkStores` | Prevent .DS_Store files on network volumes | `1` (enabled) |
| `DSDontWriteUSBStores`     | Prevent .DS_Store files on USB volumes     | `1` (enabled) |

## Using the Defaults Script

I maintain two scripts for working with these defaults:

1. `export_defaults.sh` - Exports current settings to create a defaults script
2. `defaults_settings.sh` - The generated script that can be run on a new machine

### Setting Up a New Machine

To apply these settings to a new Mac:

1. Copy the `defaults_settings.sh` file to the new machine
2. Open Terminal and navigate to the directory containing the script
3. Make the script executable with: `chmod +x defaults_settings.sh`
4. Run the script: `./defaults_settings.sh`
5. Log out and log back in (or restart) for all settings to take effect

### Customizing Your Settings

If you want to customize any of these settings:

1. Modify the system using System Settings app
2. Run `export_defaults.sh` to generate an updated script
3. Review the changes in the generated `defaults_settings.sh` file

## Common Defaults Commands

Here are some useful commands for working with defaults:

```bash
# Read all defaults for a domain
defaults read com.apple.finder

# Read a specific setting
defaults read com.apple.dock orientation

# Write a setting
defaults write com.apple.finder AppleShowAllFiles -bool true

# Delete a setting (reset to default)
defaults delete com.apple.dock tilesize
```

## Resources

- [Apple Developer Documentation on Property Lists](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/PropertyLists/Introduction/Introduction.html)
- [macOS Defaults List](https://macos-defaults.com/)
- [defaults man page](https://ss64.com/osx/defaults.html)
