local appShortcuts = {
  f11 = 'com.google.Chrome', -- G
  --f12 = 'com.todesktop.230313mzl4w4u92', -- A
  f12 = 'com.google.antigravity', -- A
  f13 = 'com.brave.Browser', -- B
  f14 = 'com.apple.Safari', -- S
  f15 = 'net.kovidgoyal.kitty', -- K
  f16 = 'com.hnc.Discord', -- D
  f17 = 'com.spotify.client', -- M
  --f17 = 'com.apple.mail', -- M
  --f18 = 'com.toggl.daneel',
  f18 = 'ru.keepcoder.Telegram', -- T
  f19 = 'com.apple.finder', -- F
  f20 = 'com.clickup.desktop-app', -- C
  f10 = 'com.openai.chat', -- L
}

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'P', function()
  hs.application.launchOrFocusByBundleID('org.jkiss.dbeaver.core.product')
end)

for key, bundleID in pairs(appShortcuts) do
  hs.hotkey.bind({}, key, function()
    hs.application.launchOrFocusByBundleID(bundleID)
  end)
end

-- Hide MacOS title bar when kitty is open

local originalAutohide = nil
local kittyIsActive = false

local function getAutohide()
  local _, result = hs.osascript.applescript [[
    tell application "System Events" to get autohide menu bar of dock preferences
  ]]
  return result
end

local function setAutohide(autohide)
  hs.osascript.applescript(string.format('tell application "System Events" to set autohide menu bar of dock preferences to %s', autohide and 'true' or 'false'))
end

local function applicationChanged(appName, eventType, app)
  if eventType == hs.application.watcher.activated then
    if appName == 'kitty' then
      if not kittyIsActive then
        originalAutohide = getAutohide()
        setAutohide(true)
        kittyIsActive = true
      end
    else
      if kittyIsActive then
        setAutohide(originalAutohide)
        kittyIsActive = false
      end
    end
  end
end

local appWatcher = hs.application.watcher.new(applicationChanged)
appWatcher:start()

-- Sync kitty/starship theme with the current macOS appearance.
local themeStateFile = os.getenv('HOME') .. '/.config/kitty/.theme'
local toggleThemeScript = os.getenv('HOME') .. '/.config/kitty/toggle-theme.sh'
local appearanceNotificationName = 'AppleInterfaceThemeChangedNotification'

if themeWatcher then
  themeWatcher:stop()
  themeWatcher = nil
end

local function readThemeState()
  local file = io.open(themeStateFile, 'r')
  if not file then
    return 'dark'
  end

  local value = file:read('*l')
  file:close()
  return value or 'dark'
end

local function getSystemTheme()
  local output, success = hs.execute('/usr/bin/defaults read -g AppleInterfaceStyle 2>/dev/null', true)
  if success and output and output:match('Dark') then
    return 'dark'
  end

  return 'light'
end

local function syncThemeWithSystem()
  local currentTheme = readThemeState()
  local systemTheme = getSystemTheme()
  hs.printf('theme sync: system=%s current=%s', systemTheme, currentTheme)

  if currentTheme == systemTheme then
    hs.printf('theme sync: skip')
    return
  end

  hs.printf('theme sync: toggling via %s', toggleThemeScript)
  hs.task.new(toggleThemeScript, nil):start()
end

themeWatcher = hs.distributednotifications.new(function(name, object, userInfo)
  if name ~= appearanceNotificationName then
    return
  end

  hs.printf('theme sync: notification=%s', name)
  syncThemeWithSystem()
end)
themeWatcher:start()

-- Reconcile once on config load. Ongoing sync is notification-driven.
syncThemeWithSystem()
