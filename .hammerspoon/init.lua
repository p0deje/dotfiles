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

undo = {}

function undo:push()
  local win = hs.window.focusedWindow()
  if win and not undo[win:id()] then
    self[win:id()] = win:frame()
  end
end

function undo:pop()
  local win = hs.window.focusedWindow()
  if win and self[win:id()] then
    win:setFrame(self[win:id()])
    self[win:id()] = nil
  end
end

hs.hotkey.bind({"alt", "shift"}, "m", function()
  undo:push()
  hs.window.focusedWindow():centerOnScreen()
end)

hs.hotkey.bind({"alt", "shift"}, "f", function()
  undo:push()
  hs.window.focusedWindow():moveToUnit(hs.layout.maximized)
end)

hs.hotkey.bind({"alt", "shift"}, "h", function()
  undo:push()
  hs.window.focusedWindow():moveToUnit(hs.layout.left50)
end)

hs.hotkey.bind({"alt", "shift"}, "l", function()
  undo:push()
  hs.window.focusedWindow():moveToUnit(hs.layout.right50)
end)

hs.hotkey.bind({"alt", "shift"}, "z", function()
  undo:pop()
end)
