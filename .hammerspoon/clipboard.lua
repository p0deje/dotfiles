-- Clipboard History Manager
--
-- Attempt to implement something similar to Parcellite for macOS.
-- Based on https://github.com/VFS/.hammerspoon/blob/master/tools/clipboard.lua
--
-- Shows menubar item which holds history of clipboard.
-- Menu can also be opened using <Cmd-Shift-c>.

require("hs.pasteboard")
require("hs.settings")

-- Configuration
local frequency = 0.8
local historySize = 100
local labelLength = 80
local settingsPath = "so.hs.macellite"
local clipboardHistory = hs.settings.get(settingsPath) or {}

-- displays how many times the pasteboard owner has changed
-- indicates a new copy has been made
local lastChange = hs.pasteboard.changeCount()

function putOnPaste(string, key)
  hs.pasteboard.setContents(string)
  -- prevent item duplication when putting on paste
  lastChange = hs.pasteboard.changeCount()
end

function clearAll()
  hs.pasteboard.clearContents()
  clipboardHistory = {}
  hs.settings.set(settingsPath, clipboardHistory)
  hs.pasteboard.changeCount()
end

function clearLastItem()
  table.remove(clipboardHistory, #clipboardHistory)
  hs.settings.set(settingsPath, clipboardHistory)
  hs.pasteboard.changeCount()
end

function pasteboardToClipboard(item)
  -- remove old history elements
  while (#clipboardHistory >= historySize) do
    table.remove(clipboardHistory, 1)
  end
  table.insert(clipboardHistory, item)
  hs.settings.set(settingsPath, clipboardHistory)
end

function storeCopy()
  now = hs.pasteboard.changeCount()
  if (now > lastChange) then
    currentClipboard = hs.pasteboard.getContents()

    -- prevent keeping items removed by applications (e.g. password managers)
    if (currentClipboard == nil) then
      clearLastItem()
    else
      pasteboardToClipboard(currentClipboard)
    end

    lastChange = now
  end
end

populateMenu = function(key)
  menuData = {}

  if (#clipboardHistory == 0) then
    table.insert(menuData, {title = "None", disabled = true})
  else
    for _, value in pairs(clipboardHistory) do
      -- trim title
      title = value:gsub("^%s*", "")

        -- truncate long strings
      if (string.len(title) > labelLength) then
        title = string.sub(title, 0, labelLength) .. "…"
      end

      table.insert(menuData, 1, { title = title, fn = function() putOnPaste(value, key) end })
    end
  end

  table.insert(menuData, {title = "-"})
  table.insert(menuData, {title = "Clear All", fn = function() clearAll() end })

  return menuData
end

-- start menubar application
local macellite = hs.menubar.new()
macellite:setTooltip("Parcellite for macOS")
macellite:setTitle("✂")
macellite:setMenu(populateMenu)

-- open popup on hotkey
hs.hotkey.bind({"cmd", "shift"}, "c", function()
  macellite:popupMenu(hs.mouse.getAbsolutePosition())
end)

-- checks for changes on the pasteboard
timer = hs.timer.new(frequency, storeCopy)
timer:start()
