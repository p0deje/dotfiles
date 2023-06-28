-- Configuration

hs.window.animationDuration = 0

-- Application switching

local bindToLaunchOrFocus = function(key, application)
  hs.hotkey.bind({ "alt" }, key, function()
    hs.application.launchOrFocus(application)
  end)
end

bindToLaunchOrFocus("s", "Safari")
bindToLaunchOrFocus("t", "iTerm")
bindToLaunchOrFocus("v", "Neovide")
bindToLaunchOrFocus("m", "Messages")
bindToLaunchOrFocus("b", "Slack")
bindToLaunchOrFocus("z", "zoom.us")

-- Window moving

local undo = {}

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

local window = {}

function window:center()
  local screenFrame = hs.screen.mainScreen():frame()
  local windowFrame = hs.window.focusedWindow():frame()
  windowFrame.x = ((screenFrame.w - windowFrame.w) / 2) + screenFrame.x
  windowFrame.y = ((screenFrame.h - windowFrame.h) / 2) + screenFrame.y
  hs.window.focusedWindow():setFrame(windowFrame)
end

hs.hotkey.bind({ "alt", "shift" }, "m", function()
  undo:push()
  window:center()
end)

hs.hotkey.bind({ "alt", "shift" }, "-", function()
  undo:push()
  local windowFrame = hs.window.focusedWindow():frame()
  windowFrame.w = windowFrame.w - windowFrame.w * 0.05
  windowFrame.h = windowFrame.h - windowFrame.h * 0.05
  hs.window.focusedWindow():setFrame(windowFrame)
  hs.timer.usleep(0.4 * 1000 * 1000)
  window:center()
end)

hs.hotkey.bind({ "alt", "shift" }, "=", function()
  undo:push()
  local windowFrame = hs.window.focusedWindow():frame()
  windowFrame.w = windowFrame.w + windowFrame.w * 0.05
  windowFrame.h = windowFrame.h + windowFrame.h * 0.05
  hs.window.focusedWindow():setFrame(windowFrame)
  hs.timer.usleep(0.4 * 1000 * 1000)
  window:center()
end)

hs.hotkey.bind({ "alt", "shift" }, "f", function()
  undo:push()
  local stageManager = hs.execute("defaults read com.apple.WindowManager GloballyEnabled")
  if stageManager == "1\n" then
    local screenFrame = hs.screen.mainScreen():frame()
    screenFrame.w = screenFrame.w * 0.85
    hs.window.focusedWindow():setFrame(screenFrame)
    hs.timer.usleep(0.4 * 1000 * 1000)
    window:center()
  else
    hs.window.focusedWindow():maximize(0)
  end
end)

hs.hotkey.bind({ "alt", "shift" }, "h", function()
  undo:push()
  hs.window.focusedWindow():moveToUnit(hs.layout.left50)
end)

hs.hotkey.bind({ "alt", "shift" }, "l", function()
  undo:push()
  hs.window.focusedWindow():moveToUnit(hs.layout.right50)
end)

hs.hotkey.bind({ "alt", "shift" }, "z", function()
  undo:pop()
end)

-- Layouts

hs.hotkey.bind({ "alt", "shift" }, "n", function()
  hs.application.launchOrFocus("iTerm")
  hs.application.launchOrFocus("Slack")
  hs.application.launchOrFocus("Neovide")

  local windowLayout = {
    { "Neovide", nil, nil, hs.geometry.rect(0.0, 0.0, 0.6, 1.0), nil, nil },
    { "iTerm2", nil, nil, hs.geometry.rect(0.6, 0.5, 0.4, 0.5), nil, nil },
    { "Slack", nil, nil, hs.geometry.rect(0.6, 0.0, 0.4, 0.5), nil, nil },
  }
  hs.layout.apply(windowLayout)
end)

-- Monitors

hs.hotkey.bind({ "alt", "shift" }, "[", function()
  hs.window.focusedWindow():moveOneScreenWest(true, true)
  hs.window.focusedWindow():focus()
end)

hs.hotkey.bind({ "alt", "shift" }, "]", function()
  hs.window.focusedWindow():moveOneScreenEast(true, true)
  hs.window.focusedWindow():focus()
end)

-- Mouse

hs.hotkey.bind({ "alt", "shift" }, "j", function()
  hs.eventtap.leftClick(hs.mouse.absolutePosition())
end)

hs.eventtap
  .new({ hs.eventtap.event.types.otherMouseUp }, function(event)
    local buttonNumber = event:getProperty(hs.eventtap.event.properties.mouseEventButtonNumber)
    local currentApp = hs.application.frontmostApplication()

    print(buttonNumber)

    if currentApp == hs.application.find("Spark") then
      hs.eventtap.leftClick(hs.mouse.getAbsolutePosition(), 1000)
      hs.eventtap.keyStroke({}, "return")
      return
    end

    if buttonNumber == 4 then
      hs.eventtap.keyStroke({ "cmd" }, "[")
    elseif buttonNumber == 3 then
      hs.eventtap.keyStroke({ "cmd" }, "]")
    end
  end)
  :start()
