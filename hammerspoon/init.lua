hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

function newWindow(appName, menuItemName)
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

end

function bindNewWin(key, appName, menuItemName)
  hs.hotkey.bind({"cmd", "alt", "ctrl"}, key, function()
    newWindow(appName, menuItemName)
  end)
end

bindNewWin("f1", "Safari", "New Window")
bindNewWin("f2", "Finder", "New Finder Window")
bindNewWin("f3", "Mail", "New Message")
bindNewWin("f4", "iTerm", "New Window")

bindNewWin("f5", "Code", "New Window")
bindNewWin("f6", "Soulver", "New")
