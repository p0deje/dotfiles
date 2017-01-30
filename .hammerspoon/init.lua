require "clipboard"

-- Configuration

hs.window.animationDuration = 0

-- Window hints

hs.hotkey.bind({"cmd"}, "e", function()
  hs.hints.windowHints()
end)

-- Application switching

local bindToLaunchOrFocus = function(key, application)
  hs.hotkey.bind({"alt"}, key, function()
    hs.application.launchOrFocus(application)
  end)
end

bindToLaunchOrFocus("s", "Safari")
bindToLaunchOrFocus("t", "iTerm")
bindToLaunchOrFocus("v", "MacVim")
bindToLaunchOrFocus("m", "Messages")
bindToLaunchOrFocus("b", "Slack")

-- Window moving

hs.hotkey.bind({"alt", "shift"}, "m", function()
  hs.window.focusedWindow():centerOnScreen()
end)

hs.hotkey.bind({"alt", "shift"}, "h", function()
  hs.window.focusedWindow():moveToUnit(hs.layout.left50)
end)

hs.hotkey.bind({"alt", "shift"}, "l", function()
  hs.window.focusedWindow():moveToUnit(hs.layout.right50)
end)
