mash = {"shift", "ctrl"}


-- Reloads hammerspoon config
hs.hotkey.bind(mash, "R", function()
  hs.reload()
  hs.alert.show("Config loaded")
end)


-- Opens a new application window in the current space
function bindNewWin(key, appName, menuItemName)
  hs.hotkey.bind(mash, key, function()
    local app = hs.appfinder.appFromName(appName)

    if app ~= nil then
      local currWin = app:mainWindow()
      app:selectMenuItem(menuItemName)

      -- Wait until the window opens
      local tries = 0
      repeat
        os.execute("sleep 0.1")
        tries = tries + 1
      until currWin ~= app:mainWindow() or tries > 5
    end

    hs.application.launchOrFocus(appName)
  end)
end

bindNewWin("f1", "Firefox", "New Window")
bindNewWin("f2", "Finder", "New Finder Window")
bindNewWin("f3", "Mail", "New Message")
bindNewWin("f4", "iTerm", "New Window")

bindNewWin("f5", "MacVim", "New Window")
bindNewWin("f6", "Soulver", "New")


-- Starts screensaver and locks the screen
local screensaver = "/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"
hs.hotkey.bind(mash, "escape", function()
  hs.application.launchOrFocus(screensaver)
end)
