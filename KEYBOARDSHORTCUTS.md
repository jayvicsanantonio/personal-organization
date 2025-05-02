# My Productivity Keyboard Shortcuts

This document outlines my personal setup for keyboard shortcuts, aliases, and snippets across my essential tools on my new MacBook Pro. My goal is to optimize my workflow, enable smooth multitasking, and minimize keybinding conflicts, primarily by leveraging Raycast's built-in Hyperkey feature. Window management is a key part of my multitasking strategy, and I use specific shortcuts for that.

This setup is designed for my specific needs as a Senior Software Engineer focused on web development and AI/ML tasks.

**Tools Covered:** macOS System, Raycast, VS Code, Chrome DevTools, Warp Terminal (and the specific Raycast Extensions I use).

## 1. My Conflict Resolution Strategy: The Hyperkey (Using Raycast's Built-in Feature)

For me, the most effective way to reduce keyboard shortcut conflicts between the system, my applications, and powerful tools like Raycast is to use a **Hyperkey**. Raycast conveniently has a built-in setting for this! This means I can remap a key I rarely use (like `Caps Lock`) directly within Raycast to act as a Hyperkey, which sends a unique combination of standard modifiers (typically `⌃ Control + ⌥ Option + ⌘ Command + ⇧ Shift`).

By assigning my most critical global or Raycast-based shortcuts to `Hyper + [Key]`, I create a layer of keybindings that are highly unlikely to conflict with standard shortcuts within my applications (like VS Code, Chrome, etc.).

**Here's how I set up my Hyperkey in Raycast:**

1.  I open **Raycast Settings**.
2.  I navigate to the **Advanced** tab.
3.  Under the **Hyper Key** section, I select the key I want to remap (I choose `Caps Lock`). Raycast handles the rest, mapping it to the `⌃ Control + ⌥ Option + ⌘ Command + ⇧ Shift` combination behind the scenes.

Throughout this document, `Hyper + [Key]` refers to pressing my remapped `Caps Lock` key simultaneously with another key.

## 2. My Core macOS System & Multitasking Shortcuts

These are the fundamental shortcuts I rely on to navigate macOS and quickly jump between my applications, windows, and spaces.

| Type       | Shortcut                           | Action                       | Description                                                                           | Focus          | Conflict Notes                                                       |
| :--------- | :--------------------------------- | :--------------------------- | :------------------------------------------------------------------------------------ | :------------- | :------------------------------------------------------------------- |
| **System** | `Command + Tab`                    | Switch Applications          | Cycle through my open applications. I hold `Command` and press `Tab`.                 | Multitasking   | Standard, rarely conflicts with apps themselves.                     |
| **System** | `Command + ~` (tilde)              | Switch Windows (Current App) | Cycle through the windows of the _currently active_ application I'm in.               | Multitasking   | Standard, crucial for apps with multiple windows.                    |
| **System** | `Control + Arrow`                  | Switch Spaces (Desktops)     | I move between my full-screen apps or desktop spaces (`Left`/`Right` arrow).          | Multitasking   | Standard, conflict unlikely.                                         |
| **System** | `Control + 1`, `Control + 2`, etc. | Switch to Specific Space     | I jump directly to a numbered Space.                                                  | Multitasking   | I set this up in System Settings > Desktop & Dock > Mission Control. |
| **System** | `Command + H`                      | Hide Application             | I hide the windows of my current application.                                         | Multitasking   | Standard.                                                            |
| **System** | `Command + M`                      | Minimize Window              | I minimize the current window to the Dock.                                            | Multitasking   | Standard.                                                            |
| **System** | `Command + W`                      | Close Window                 | I close the current window or tab (behavior varies by app).                           | General App    | Standard, common across apps.                                        |
| **System** | `Command + Q`                      | Quit Application             | I quit the currently active application.                                              | General App    | Standard, common across apps.                                        |
| **System** | `Option + Command + Esc`           | Force Quit Applications      | I open the Force Quit Applications dialog if an app is stuck.                         | System/Utility | Standard, emergency use.                                             |
| **System** | `Command + Space`                  | Toggle Spotlight Search      | Default system search. **Conflict:** This conflicts with my preferred Raycast toggle. | System/Search  | **My Recommendation:** I disable this and use Raycast instead.       |

## 3. My Raycast Shortcuts, Aliases & Snippets (Leveraging Hyperkey)

Raycast serves as my command center. Assigning its core features to Hyperkey combinations makes them instantly accessible from anywhere without conflicting with my development tools.

**Setup:** I configure Hotkeys in Raycast Settings > General & Extension Hotkeys. I set Aliases in Raycast Settings > Aliases. I set Snippets in Raycast Settings > Snippets.

| Type        | Trigger (My Recommended Hyperkey)     | Alternative Trigger (No Hyperkey) | Action/Command                       | Description                                                                                           | Focus          | Setup Location & Notes                                                                                                           |
| :---------- | :------------------------------------ | :-------------------------------- | :----------------------------------- | :---------------------------------------------------------------------------------------------------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------- |
| **Hotkey**  | `Option + Space` (Primary)            | `Hyper + Space` (Alternative)     | Toggle Raycast                       | My main shortcut to bring up the Raycast bar. I pick one and disable others.                          | Command Center | Raycast Settings > General. `Option+Space` works well if I disable Spotlight's `Command+Space`.                                  |
| **Hotkey**  | `Hyper + V`                           | `Control + Option + V`            | Toggle Clipboard History             | Instant access to everything I've copied. This is invaluable for coding.                              | Utility        | Raycast Settings > Extensions > Clipboard History > Configure Hotkey. I configure buffer size/ignored apps here.                 |
| **Hotkey**  | `Hyper + S`                           | `Control + Option + S`            | Toggle Snippets                      | Quickly insert my saved text or code snippets.                                                        | Snippets       | Raycast Settings > Extensions > Snippets > Configure Hotkey. I define my snippets here.                                          |
| **Hotkey**  | `Hyper + A`                           | `Control + Option + A`            | Toggle Raycast AI                    | I instantly access Raycast AI for queries, code generation, etc. (if subscribed).                     | AI Integration | Raycast Settings > Extensions > Raycast AI > Configure Hotkey.                                                                   |
| **Hotkey**  | `Hyper + L`                           | `Control + Option + L`            | Toggle Quicklinks                    | I access my saved Quicklinks (URLs, files, folders) quickly.                                          | Navigation/Web | Raycast Settings > Extensions > Quicklinks > Configure Hotkey.                                                                   |
| **Hotkey**  | `Hyper + D`                           | `Control + Option + D`            | Open Dictionary/Define               | I quickly look up word definitions.                                                                   | Utility        | Raycast Settings > Extensions > Dictionary > Configure Hotkey.                                                                   |
| **Hotkey**  | `Hyper + F`                           | `Shift + Command + F` (Riskier)   | Search Files                         | I rapidly find files and folders on my Mac using Raycast's indexer.                                   | Files/Search   | Raycast Settings > Extensions > File Search > Configure Hotkey. Note: This can conflict with Finder's default `Shift+Command+F`. |
| **Hotkey**  | `Hyper + P`                           | `Control + Option + P`            | Run Command: Open Project [Specific] | I define a custom command or script to open a specific project folder/workspace I work on frequently. | Development    | Create a custom command in Raycast (Type `Create Command` in bar). Map its hotkey in Extension settings.                         |
| **Hotkey**  | `Hyper + R`                           | `Control + Option + R`            | Run Command: Run Script [Specific]   | I trigger a common development script (e.g., `npm run dev`, `pytest`).                                | Development    | Create a custom script command. Map its hotkey in Extension settings.                                                            |
| **Hotkey**  | `Hyper + K`                           | `Shift + Command + K`             | Kill Process                         | I access the Kill Process command directly via hotkey.                                                | System         | Can be faster than typing "kill".                                                                                                |
| **Hotkey**  | `Command + Enter`                     | N/A                               | Open in Background                   | I execute a command or open an application in the background.                                         | General        | Default behavior for many results in the main bar.                                                                               |
| **Alias**   | `vs`, `term`, `chrome`, `figma`, etc. | N/A                               | Open Application [Specific]          | I type the alias in the Raycast bar to launch my frequently used apps.                                | Application    | Raycast Settings > Aliases > Create Alias.                                                                                       |
| **Alias**   | `jira`, `gh`, `cloud`, `colab`, etc.  | N/A                               | Open URL [Specific]                  | I type the alias in the Raycast bar to open frequent URLs I visit.                                    | Web/Navigation | Raycast Settings > Aliases > Create Alias.                                                                                       |
| **Snippet** | `html5`, `useState`, `pyimport`, etc. | N/A                               | Insert Code/Text Snippet             | I type the snippet keyword in any text field and press Enter/Space to insert the text.                | Coding/Text    | Raycast Settings > Snippets > Create Snippet. I define my Keyword and Content here.                                              |

### My Window Management Shortcuts (Using Raycast Window Management Extension)

Managing windows is key to efficient multitasking. I use the Raycast Window Management extension and assign Hyperkey combinations to the actions I use most often. These hotkeys are configured specifically _within the settings for the Window Management extension_.

| Type       | Trigger (My Recommended Hyperkey) | Action                     | Description                                                                      | Focus             | Setup Location & Notes                                                                                                                 |
| :--------- | :-------------------------------- | :------------------------- | :------------------------------------------------------------------------------- | :---------------- | :------------------------------------------------------------------------------------------------------------------------------------- |
| **Hotkey** | `Hyper + W`                       | Toggle Window Menu         | I bring up the menu of all window management actions.                            | Window Management | Configured in Raycast Settings > Extensions > Window Management > Configure Hotkey for "Manage Windows".                               |
| **Hotkey** | `Hyper + Left Arrow`              | Snap Left Half             | I move the window to the left half of my screen.                                 | Window Management | Configured _within_ the Raycast Window Management Extension settings.                                                                  |
| **Hotkey** | `Hyper + Right Arrow`             | Snap Right Half            | I move the window to the right half of my screen.                                | Window Management | Configured _within_ the Raycast Window Management Extension settings.                                                                  |
| **Hotkey** | `Hyper + Up Arrow`                | Maximize / Snap Top        | I maximize the window or snap it to the top half.                                | Window Management | Configured _within_ the Raycast Window Management Extension settings. Behavior depends on how the extension is set up for Up Arrow.    |
| **Hotkey** | `Hyper + Down Arrow`              | Snap Bottom Half           | I move the window to the bottom half of my screen.                               | Window Management | Configured _within_ the Raycast Window Management Extension settings.                                                                  |
| **Hotkey** | `Hyper + C`                       | Center Window              | I center the window on the screen.                                               | Window Management | Configured _within_ the Raycast Window Management Extension settings.                                                                  |
| **Hotkey** | `Hyper + M`                       | Maximize Window            | I make the window fill the entire screen without going to a new Space.           | Window Management | If `Hyper + Up` is set to Snap Top, I assign Maximize to a different key like `Hyper + M`. Configured _within_ the Extension settings. |
| **Hotkey** | `Hyper + Return`                  | Full Screen (Native macOS) | I trigger the native macOS full screen mode, moving the window to its own Space. | Window Management | Configured _within_ the Raycast Window Management Extension settings. This mimics the green button / `Control+Command+F`.              |
| **Hotkey** | `Hyper + [`                       | Move to Previous Display   | I move the active window to the monitor on the left.                             | Window Management | Configured _within_ the Raycast Window Management Extension settings. Useful with multiple monitors.                                   |
| **Hotkey** | `Hyper + ]`                       | Move to Next Display       | I move the active window to the monitor on the right.                            | Window Management | Configured _within_ the Raycast Window Management Extension settings. Useful with multiple monitors.                                   |
| **Hotkey** | `Hyper + U`                       | Undo Last Action           | I undo the last window management action I performed.                            | Window Management | Configured _within_ the Raycast Window Management Extension settings. Good for fixing mistakes quickly.                                |

## 4. My Development Environment Shortcuts (Continued)

These are the critical shortcuts _within_ my primary development tools. Conflicts between these apps are less common but can happen depending on plugins or extensions I install. The Hyperkey strategy primarily protects _Raycast's global actions_ from conflicting with these, but I might still need to customize _within_ VS Code or Warp if their _internal_ keybindings clash.

### VS Code Shortcuts

These are essential for my coding, navigation, and debugging within VS Code.

| Type        | Shortcut                           | Action                     | Description                                                        | Focus            | Notes                                                          |
| :---------- | :--------------------------------- | :------------------------- | :----------------------------------------------------------------- | :--------------- | :------------------------------------------------------------- |
| **VS Code** | `Shift + Command + P`              | Show Command Palette       | I access all VS Code commands by name here. I use this a lot.      | General          | My crucial entry point for most actions.                       |
| **VS Code** | `Command + P`                      | Go to File (Quick Open)    | I quickly search and open files by name. I use this constantly.    | Navigation/Files |                                                                |
| **VS Code** | `Command + F`                      | Find                       | I find text within the current file.                               | Search           | Standard in most apps.                                         |
| **VS Code** | `Option + Command + F`             | Replace                    | I replace text within the current file.                            | Search           | Standard variant of Find.                                      |
| **VS Code** | `Shift + Command + F`              | Find in Files              | I search across my entire workspace. I use this very frequently.   | Search           | Can conflict with Raycast File Search Hyperkey if not careful. |
| **VS Code** | `Shift + Option + Command + F`     | Replace in Files           | I replace text across my entire workspace.                         | Search           |                                                                |
| **VS Code** | ` Control + ``  ` (backtick)       | Toggle Integrated Terminal | I show or hide the built-in terminal. This is super frequent.      | Terminal         | Standard VS Code binding.                                      |
| **VS Code** | ` Shift + Command + ``  `          | Create New Terminal        | I open a new instance of the integrated terminal.                  | Terminal         |                                                                |
| **VS Code** | `Command + B`                      | Toggle Sidebar             | I show or hide the main activity bar/sidebar.                      | View             |                                                                |
| **VS Code** | `Command + /`                      | Toggle Line Comment        | I comment or uncomment the current line or selection.              | Editing          | I use this very frequently.                                    |
| **VS Code** | `Option + Up/Down Arrow`           | Move Line Up/Down          | I move the current line(s) above or below.                         | Editing          | Highly productive for rearranging code.                        |
| **VS Code** | `Option + Command + Up/Down Arrow` | Add Cursor Above/Below     | I add multiple cursors for simultaneous editing. I use this often. | Editing          | Powerful multi-cursor editing.                                 |
| **VS Code** | `Shift + Option + L`               | Select All Occurrences     | I find and select all instances of the current word/selection.     | Editing          | Excellent for renaming variables locally.                      |
| **VS Code** | `F12`                              | Go to Definition           | I jump to the definition of a symbol. I use this a lot.            | Navigation       | Standard for many IDEs.                                        |
| **VS Code** | `Shift + F12`                      | Go to References           | I find where a symbol is used.                                     | Navigation       |                                                                |
| **VS Code** | `F2`                               | Rename Symbol              | I refactor-rename a symbol across my project.                      | Refactoring      | More powerful than local multi-cursor replace.                 |
| **VS Code** | `Shift + Option + F`               | Format Document            | I auto-format the entire file based on my settings/extensions.     | Editing/Format   | Ensures consistent code style.                                 |
| **VS Code** | `F5`                               | Start Debugging            | I begin my debugging session.                                      | Debugging        | Standard debugger control.                                     |
| **VS Code** | `Shift + F5`                       | Stop Debugging             | I end the debugging session.                                       | Debugging        | Standard debugger control.                                     |
| **VS Code** | `F10`                              | Step Over (Debugger)       | I step over the next line in the debugger.                         | Debugging        | Standard debugger control.                                     |
| **VS Code** | `F11`                              | Step Into (Debugger)       | I step into a function call in the debugger.                       | Debugging        | Standard debugger control.                                     |
| **VS Code** | `Shift + F11`                      | Step Out (Debugger)        | I step out of the current function in the debugger.                | Debugging        | Standard debugger control.                                     |

### Chrome DevTools Shortcuts

These are essential for me when inspecting elements, debugging frontend JavaScript, and monitoring network activity in Chrome.

| Type         | Shortcut               | Action                           | Description                                                                                        | Focus          | Notes                                                                  |
| :----------- | :--------------------- | :------------------------------- | :------------------------------------------------------------------------------------------------- | :------------- | :--------------------------------------------------------------------- |
| **DevTools** | `Option + Command + I` | Toggle DevTools                  | I open or close the entire DevTools panel.                                                         | General        | Standard Chrome binding.                                               |
| **DevTools** | `Option + Command + J` | Open Console Panel               | I directly open the Console panel. I use this frequently for logs/errors.                          | Console/Debug  | Very frequent.                                                         |
| **DevTools** | `Option + Command + C` | Open Elements Panel & Inspect    | This opens the Elements panel and activates the inspect element tool for me.                       | Elements/Debug | I then click on an element.                                            |
| **DevTools** | `Shift + Command + M`  | Toggle Device Mode               | I simulate different screen sizes and devices for responsive testing.                              | Responsive Dev |                                                                        |
| **DevTools** | `Command + R`          | Reload Page (Normal)             | Standard page reload.                                                                              | General        | Conflicts with VS Code Run Script Hyperkey - but context is different. |
| **DevTools** | `Shift + Command + R`  | Reload Page (Hard, ignore cache) | I reload ignoring cached cached resources. Crucial during frontend development to see latest code. | General        | Avoids stale code issues.                                              |
| **DevTools** | `Escape`               | Toggle Drawer                    | I show or hide the Console/Source/etc. drawer within other panels.                                 | View           | Useful for seeing Console while in other panels.                       |
| **DevTools** | `Command + K`          | Clear Console                    | I clear all messages in the Console panel.                                                         | Console        | I use this very frequently.                                            |
| **DevTools** | `F8`                   | Pause/Resume Script Execution    | I toggle breakpoints in the Sources panel debugger.                                                | Debugging      | Standard debugger control.                                             |
| **DevTools** | `F10`                  | Step Over (Debugger)             | I step over a function call in Sources.                                                            | Debugging      | Standard debugger control.                                             |
| **DevTools** | `F11`                  | Step Into (Debugger)             | I step into a function call in Sources.                                                            | Debugging      | Standard debugger control.                                             |
| **DevTools** | `Shift + F11`          | Step Out (Debugger)              | I step out of the current function in Sources.                                                     | Debugging      | Standard debugger control.                                             |
| **DevTools** | `Command + .` (period) | Next Console Message             | I navigate to the next error, warning, or message in the Console.                                  | Console        | Useful for reviewing logs.                                             |
| **DevTools** | `Command + ,` (comma)  | Previous Console Message         | I navigate to the previous error, warning, or message in the Console.                              | Console        | Useful for reviewing logs.                                             |

### Warp Terminal Shortcuts

These are the shortcuts I use within the Warp terminal application for efficient command-line work.

| Type     | Shortcut                          | Action                         | Description                                                      | Focus          | Notes                                     |
| :------- | :-------------------------------- | :----------------------------- | :--------------------------------------------------------------- | :------------- | :---------------------------------------- |
| **Warp** | `Command + T`                     | New Tab                        | I open a new tab within the Warp window.                         | Panes/Tabs     | Standard terminal binding.                |
| **Warp** | `Command + W`                     | Close Tab                      | I close the current tab.                                         | Panes/Tabs     | Standard terminal binding.                |
| **Warp** | `Command + D`                     | New Pane (Vertical Split)      | I split the current pane vertically.                             | Panes/Tabs     | Warp specific split.                      |
| **Warp** | `Shift + Command + D`             | New Pane (Horizontal Split)    | I split the current pane horizontally.                           | Panes/Tabs     | Warp specific split.                      |
| **Warp** | `Shift + Command + W`             | Close Pane                     | I close the current pane.                                        | Panes/Tabs     | Warp specific.                            |
| **Warp** | `Command + Option + Arrow Keys`   | Navigate Panes                 | I move focus between my panes (Left, Right, Up, Down).           | Panes/Tabs     | Efficient for my split terminal layouts.  |
| **Warp** | `Control + R`                     | Search History (Standard)      | I use this for standard shell history search (like in Bash/Zsh). | Search         | Works like standard shell history search. |
| **Warp** | `Command + F`                     | Toggle Warp Search             | I access Warp's built-in search for blocks/commands.             | Search         | Warp specific, visually distinct.         |
| **Warp** | `Command + K`                     | Clear Screen                   | I clear the current pane's output (like typing `clear`).         | General        | Standard terminal clear.                  |
| **Warp** | `Command + Shift + Click`         | Toggle Block Output Visibility | I collapse or expand specific command blocks.                    | Blocks/View    | Warp specific feature.                    |
| **Warp** | `Command + Shift + Up/Down Arrow` | Select Output Block            | I select the entire input/output block above or below.           | Blocks/Editing | Useful for copying results easily.        |
| **Warp** | `Control + Space` (Default)       | Toggle Warp AI Command Search  | I access Warp's AI command assistance.                           | AI Integration | Hotkey customizable in Warp settings.     |

## 5. My Specific Raycast Productivity Extensions

These are the specific Raycast extensions I currently use. They enable various powerful workflows that I can trigger via the Raycast bar (using my Hyperkey hotkey or aliases) or sometimes assign dedicated hotkeys to actions within their settings. I install these from the Raycast Extension Store (`Install Extensions`).

- **Apple Notes:** I integrate with my Apple Notes.
- **Apple Reminders:** I manage my Apple Reminders directly from Raycast.
- **Brew:** I search and manage Homebrew packages.
- **Can I use:** I quickly check browser compatibility for web features.
- **Coffee:** I use this to keep my Mac awake when needed.
- **Color Picker:** I pick colors from anywhere on my screen and get various formats.
- **Github:** I interact with my GitHub repositories, issues, and pull requests.
- **Google Chrome:** I control Chrome, access bookmarks, history, and switch tabs.
- **Google Workspace:** I interact with my Google services (Drive, Calendar, Gmail, etc.).
- **Kill Process:** I quickly find and terminate misbehaving processes.
- **Linear:** I interact with my Linear issues and projects.
- **Lock Keyboard:** I use this to lock my keyboard (useful when cleaning or away briefly).
- **Lorem Ipsum:** I generate placeholder text for mockups.
- **System Monitor:** I view system stats like CPU, memory, and network usage.
- **Vercel:** I manage my Vercel deployments.
- **Visual Studio Code:** This extension helps me open projects or files directly in VS Code.

## Conclusion

This document outlines my personal framework for an efficient, conflict-minimizing workflow on my new MacBook Pro, built around Raycast and its Hyperkey feature.

1.  **My Foundation is the Hyperkey:** I start by setting up the Hyperkey directly in Raycast Settings > Advanced using my `Caps Lock` key. This builds the essential foundation for avoiding many conflicts.
2.  **I Configure Raycast Core:** I assign Hyperkey combinations (`Hyper + V`, `Hyper + S`, `Hyper + A`, `Hyper + W`, `Hyper + F`, etc.) to my most-used Raycast features. I also set up Aliases for my frequent apps and URLs and create essential Code Snippets.
3.  **I Install and Configure Extensions:** I add the specific extensions I use (like Window Management, GitHub, Linear, etc.) from the Raycast store. I pay special attention to the Window Management extension and map its specific actions (like snapping windows) to dedicated Hyperkey combinations.
4.  **I Learn My App Shortcuts:** I make sure I'm familiar with the core shortcuts in VS Code, Chrome DevTools, and Warp Terminal. These are optimized for tasks _within_ those specific tools.
5.  **I Personalize and Iterate:** This setup is a strong starting point for me. As I work, I pay attention to repetitive actions or keybindings that feel awkward or conflict. I use Raycast's "Show Keyboard Shortcuts" command (often `Command + K Command + S` in VS Code) and the Raycast Settings to adjust hotkeys, add new aliases, snippets, or custom commands to perfectly match my evolving workflow.

By strategically layering my shortcuts – system basics, Hyperkey for global tools like Raycast, and standard bindings within specific applications – I achieve a highly productive and smooth multitasking experience on my Mac.
