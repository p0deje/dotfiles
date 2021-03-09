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
bindToLaunchOrFocus("v", "VimR")
bindToLaunchOrFocus("m", "Messages")
bindToLaunchOrFocus("b", "Slack")
bindToLaunchOrFocus("z", "zoom.us")

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

window = {}

function window:center()
  local screenFrame = hs.screen.mainScreen():frame()
  local windowFrame = hs.window.focusedWindow():frame()
  windowFrame.x = ((screenFrame.w - windowFrame.w) / 2) + screenFrame.x
  windowFrame.y = ((screenFrame.h - windowFrame.h) / 2) + screenFrame.y
  hs.window.focusedWindow():setFrame(windowFrame)
end

hs.hotkey.bind({"alt", "shift"}, "m", function()
  undo:push()
  window:center()
end)

hs.hotkey.bind({"alt", "shift"}, "-", function()
  undo:push()
  local windowFrame = hs.window.focusedWindow():frame()
  windowFrame.w = windowFrame.w - windowFrame.w * 0.05
  windowFrame.h = windowFrame.h - windowFrame.h * 0.05
  hs.window.focusedWindow():setFrame(windowFrame)
  window:center()
end)

hs.hotkey.bind({"alt", "shift"}, "=", function()
  undo:push()
  local windowFrame = hs.window.focusedWindow():frame()
  windowFrame.w = windowFrame.w + windowFrame.w * 0.05
  windowFrame.h = windowFrame.h + windowFrame.h * 0.05
  hs.window.focusedWindow():setFrame(windowFrame)
  window:center()
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

-- Layouts

hs.hotkey.bind({"alt", "shift"}, "n", function()
  hs.application.launchOrFocus("iTerm")
  hs.application.launchOrFocus("Slack")
  hs.application.launchOrFocus("VimR")

  local windowLayout = {
    {"VimR",   nil, nil, hs.geometry.rect(0.0, 0.0, 0.6, 1.0), nil, nil},
    {"iTerm2", nil, nil, hs.geometry.rect(0.6, 0.5, 0.4, 0.5), nil, nil},
    {"Slack",  nil, nil, hs.geometry.rect(0.6, 0.0, 0.4, 0.5), nil, nil},
  }
  hs.layout.apply(windowLayout)
end)

-- Monitors

hs.hotkey.bind({"alt", "shift"}, "[", function()
  hs.window.focusedWindow():moveOneScreenWest(false, true)
end)

hs.hotkey.bind({"alt", "shift"}, "]", function()
  hs.window.focusedWindow():moveOneScreenEast(false, true)
end)
