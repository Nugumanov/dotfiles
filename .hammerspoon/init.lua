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
}

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
