vim.o.exrc = true
vim.o.swapfile = false
vim.o.sessionoptions = "curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Automatically read/write files from/to disk.
vim.o.autoread = true
vim.o.autowrite = true
vim.o.autowriteall = true
vim.api.nvim_create_autocmd("FocusGained", { command = ":checktime" })

if vim.g.neovide then
  -- vim.o.background = "auto"
  vim.o.guifont = "FiraCode Nerd Font:h16"

  vim.g.neovide_confirm_quit = true
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.g.neovide_input_use_logo = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_theme = "auto"
  vim.g.neovide_underline_automatic_scaling = true

  vim.keymap.set("v", "<D-c>", '"+y', { desc = "Copy" })
  vim.keymap.set({ "n", "v" }, "<D-v>", '"+P', { desc = "Paste", noremap = true })
  vim.keymap.set({ "i", "c" }, "<D-v>", "<C-r>+", { desc = "Paste", noremap = true })
end

vim.keymap.set({ "n", "v" }, ";", ":", { desc = "Command mode", noremap = false })
vim.keymap.set({ "n", "x", "o" }, "H", "^", { desc = "Go to beginning of line" })
vim.keymap.set({ "n", "x", "o" }, "L", "$", { desc = "Go to end of line" })

-- Don't leave visual mode when changing indent
vim.keymap.set("x", ">", ">gv", { desc = "Indent selection", noremap = true })
vim.keymap.set("x", "<", "<gv", { desc = "De-indent selection", noremap = true })

-- Splits
vim.keymap.set("n", "_", "<CMD>split<CR>", { desc = "Horizontal split", silent = true })
vim.keymap.set("n", "|", "<CMD>vsplit<CR>", { desc = "Vertical split", silent = true })

-- macOS
vim.keymap.set({ "n", "i" }, "<D-s>", "<CMD>w!<CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<D-a>", "ggVG", { desc = "Select all", silent = true })
vim.keymap.set("n", "<D-t>", "<CMD>enew<CR>", { desc = "New buffer", silent = true })
vim.keymap.set("n", "<D-S-w>", "<CMD>qall<CR>", { desc = "Close tab", silent = true })
vim.keymap.set("i", "<D-Left>", "<C-o>^", { desc = "Move to beginning of line" })
vim.keymap.set("i", "<D-Right>", "<C-o>$", { desc = "Move to end of line" })
vim.keymap.set("c", "<D-Left>", "<C-b>", { desc = "Move to beginning of line" })
vim.keymap.set("c", "<D-Right>", "<C-e>", { desc = "Move to end of line" })
vim.keymap.set("n", "<D-Left>", "^", { desc = "Move to beginning of line" })
vim.keymap.set("n", "<D-Right>", "$", { desc = "Move to end of line" })
vim.keymap.set({ "c", "i", "n" }, "<A-Left>", "<A-S-Left>", { desc = "Move to previous word" })
vim.keymap.set({ "c", "i", "n" }, "<A-Right>", "<A-S-Right>", { desc = "Move to next word" })
vim.keymap.set({ "c", "i" }, "<D-Backspace>", "<C-u>", { desc = "Remove to beginning of line" })
vim.keymap.set({ "c", "i" }, "<A-Backspace>", "<C-w>", { desc = "Remove to previous word" })
vim.keymap.set("n", "<D-z>", "u", { desc = "Undo", silent = true })
vim.keymap.set("n", "<S-D-z>", "<C-r>", { desc = "Redo", silent = true })
vim.keymap.set("n", "<D-n>", "<CMD>silent !open -na Neovide<CR>", { desc = "New window", silent = true })
vim.keymap.set({ "n", "t" }, "<D-w>", function()
  local ft = vim.bo[vim.api.nvim_win_get_buf(0)].ft
  if ft == "fugitive" or ft == "terminal" or ft == "qf" then
    vim.cmd("q")
  else
    require("nvchad.tabufline").close_buffer()
  end
end, { desc = "Close buffer" })

-- Tabufline
vim.keymap.set("n", "<D-[>", function()
  require("nvchad.tabufline").tabuflinePrev()
end, { desc = "Go to previous buffer" })
vim.keymap.set("n", "<D-]>", function()
  require("nvchad.tabufline").tabuflineNext()
end, { desc = "Go to previous buffer" })

-- Window movements
vim.keymap.set({ "n", "t" }, "<A-h>", "<CMD>wincmd h<CR>", { desc = "Left window", silent = true })
vim.keymap.set({ "n", "t" }, "<A-j>", "<CMD>wincmd j<CR>", { desc = "Down window", silent = true })
vim.keymap.set({ "n", "t" }, "<A-k>", "<CMD>wincmd k<CR>", { desc = "Up window", silent = true })
vim.keymap.set({ "n", "t" }, "<A-l>", "<CMD>wincmd l<CR>", { desc = "Right window", silent = true })

-- Quickfix improvements
vim.keymap.set("n", "[oq", "<CMD>cwindow<CR>", { desc = "Open quickfix", silent = true })
vim.keymap.set("n", "]oq", "<CMD>cclose<CR>", { desc = "Close quickfix", silent = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "q", "<CMD>q<CR>", { desc = "Quit", buffer = true, silent = true })
  end,
})

-- Text objects for custom characters.
-- https://thevaluable.dev/vim-create-text-objects
local chars = { "_", " ", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" }
for _, char in ipairs(chars) do
  for _, mode in ipairs({ "x", "o" }) do
    vim.api.nvim_set_keymap(
      mode,
      "i" .. char,
      string.format(":<C-u>silent! normal! f%sF%slvt%s<CR>", char, char, char),
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      mode,
      "a" .. char,
      string.format(":<C-u>silent! normal! f%sF%svf%s<CR>", char, char, char),
      { noremap = true, silent = true }
    )
  end
end
