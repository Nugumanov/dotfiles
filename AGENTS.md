# Repository Guidelines

## Project Structure & Module Organization
This is a Stow-managed dotfiles repo. Most canonical configs live under `.config/<tool>/` such as `.config/kitty`, `.config/starship`, `.config/karabiner`, and `.config/nix-darwin`. macOS automation lives in `.hammerspoon/`. Neovim is a Git submodule at `.config/nvim`, so treat submodule pointer updates as separate changes. Files in `~/.config` or `~/.hammerspoon` are synced targets; the repo is the source of truth unless a file is explicitly runtime state.

## Build, Test, and Development Commands
- `just stow`: sync repo files into `$HOME` with GNU Stow, then restore adopted files in Git.
- `git status`: verify only intended config edits are pending.
- `zsh -n .zshrc`: validate shell changes.
- `luac -p .hammerspoon/init.lua`: validate Hammerspoon Lua before reload.
- `git -C .config/nvim status` and `git -C .config/nvim log --oneline`: inspect the Neovim submodule state.

## Coding Style & Naming Conventions
Follow the native style of each config format. Keep Lua simple and local-variable based, shell scripts Zsh-friendly, and TOML/INI keys grouped logically. Prefer small, tool-scoped commits. Existing history favors conventional prefixes such as `fix(...)`, `feat(...)`, `chore(...)`, and `refactor(...)`.

## Testing Guidelines
There is no global test suite; use targeted verification:
- shell changes: `zsh -n .zshrc`
- Hammerspoon changes: `luac -p .hammerspoon/init.lua`, then reload Hammerspoon
- theme changes: open a new Kitty tab and test both manual and automatic switching
- nix-darwin changes: run the usual local rebuild/apply flow before merging

For app behavior, verify the real synced file under `~/.config`, not only the repo copy.

## Runtime State, Sync, and Safety
Some files are generated runtime state and should not be treated as canonical config. Important examples are `~/.config/kitty/current-theme.conf`, `~/.config/kitty/.theme`, and `~/.config/starship/current-theme.toml`. Keep tracked Starship files in `.config/starship/` as templates/defaults, not live mutable state. When debugging sync issues, first confirm whether the live file is a Stow symlink or an unsynced local file.

## Hotkey Workflow
Application launch hotkeys are split across Karabiner and Hammerspoon. The current Hyper key is `Right Shift` in `.config/karabiner/karabiner.json`; held down, it enables `hyper_mode`, and specific letters map to F-keys. `.hammerspoon/init.lua` then binds those F-keys to app bundle IDs. To add a new shortcut like `Hyper+X`, add the Karabiner manipulator first, then add the matching F-key binding in Hammerspoon, validate with `luac -p`, and reload Hammerspoon.

## Theme Switching
Manual Kitty/Starship switching is driven by `~/.config/kitty/toggle-theme.sh` and the `swth` alias. macOS Light/Dark sync is handled in `.hammerspoon/init.lua`, which compares the system appearance to `~/.config/kitty/.theme` and only runs the toggle script on mismatch. When changing theme logic, test manual toggle, live runtime-file updates, and macOS-triggered switching in both directions.
