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