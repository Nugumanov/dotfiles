#!/usr/bin/env zsh
# toggle-theme.sh — toggles kitty between dark (Catppuccin Macchiato) and light (Catppuccin Latte)
# Also syncs starship prompt colors live.

KITTY_DIR="${HOME}/.config/kitty"
STARSHIP_DIR="${HOME}/dotfiles/.config/starship"
STATE_FILE="${KITTY_DIR}/.theme"
CURRENT_THEME="${KITTY_DIR}/current-theme.conf"
CURRENT_STARSHIP_THEME="${STARSHIP_DIR}/current-theme.toml"

# Read current state (default: dark)
current=$(cat "${STATE_FILE}" 2>/dev/null || echo "dark")

if [[ "$current" == "dark" ]]; then
  cp "${KITTY_DIR}/catppuccin-latte.conf" "${CURRENT_THEME}"
  cp "${STARSHIP_DIR}/starship-latte.toml" "${CURRENT_STARSHIP_THEME}"
  echo "light" > "${STATE_FILE}"
  echo "Switched to light (Catppuccin Latte)"
else
  cp "${KITTY_DIR}/catppuccin-macchiato.conf" "${CURRENT_THEME}"
  cp "${STARSHIP_DIR}/starship-macchiato.toml" "${CURRENT_STARSHIP_THEME}"
  echo "dark" > "${STATE_FILE}"
  echo "Switched to dark (Catppuccin Macchiato)"
fi

# Live-reload kitty colors natively (works instantly if run inside kitty)
KITTEN="/Applications/kitty.app/Contents/MacOS/kitten"
if [ -x "$KITTEN" ]; then
  "$KITTEN" @ set-colors --all "${CURRENT_THEME}" 2>/dev/null
fi

# Fallback to reloading kitty config via signal
killall -USR1 kitty 2>/dev/null || true
