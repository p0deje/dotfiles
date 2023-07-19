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

  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set({ "n", "v" }, "<D-v>", '"+P') -- Paste normal/visual mode
  vim.keymap.set({ "i", "c" }, "<D-v>", "<C-r>+") -- Paste command/insert mode
end

vim.keymap.set({ "n", "v" }, ";", ":", { desc = "Command mode", noremap = false })

-- Splits
vim.keymap.set("n", "_", "<CMD>split<CR>", { desc = "Horizontal split", silent = true })
vim.keymap.set("n", "|", "<CMD>vsplit<CR>", { desc = "Vertical split", silent = true })

-- macOS
vim.keymap.set({ "n", "i" }, "<D-s>", "<CMD>w!<CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<D-a>", "ggVG", { desc = "Select all", silent = true })
vim.keymap.set("n", "<D-t>", "<CMD>tabnew<CR>", { desc = "New tab", silent = true })
vim.keymap.set("n", "<D-S-w>", "<CMD>qa<CR>", { desc = "Close tab", silent = true })
vim.keymap.set("i", "<D-Left>", "<C-o>^", { desc = "Move to beginning of line" })
vim.keymap.set("i", "<D-Right>", "<C-o>$", { desc = "Move to end of line" })
vim.keymap.set("c", "<D-Left>", "<C-b>", { desc = "Move to beginning of line" })
vim.keymap.set("c", "<D-Right>", "<C-e>", { desc = "Move to end of line" })
vim.keymap.set({ "c", "i" }, "<A-Left>", "<A-S-Left>", { desc = "Move to previous word" })
vim.keymap.set({ "c", "i" }, "<A-Right>", "<A-S-Right>", { desc = "Move to next word" })
vim.keymap.set({ "c", "i" }, "<D-Backspace>", "<C-u>", { desc = "Remove to beginning of line" })
vim.keymap.set({ "c", "i" }, "<A-Backspace>", "<C-w>", { desc = "Remove to previous word" })

-- Tabufline
vim.keymap.set("n", "<D-w>", function()
  require("nvchad_ui.tabufline").close_buffer()
end, { desc = "Close buffer" })
vim.keymap.set("n", "<D-[>", function()
  require("nvchad_ui.tabufline").tabuflinePrev()
end, { desc = "Go to previous buffer" })
vim.keymap.set("n", "<D-]>", function()
  require("nvchad_ui.tabufline").tabuflineNext()
end, { desc = "Go to previous buffer" })

-- Window movements
vim.keymap.set({ "n", "t" }, "<A-h>", "<C-w>h", { desc = "Left window", silent = false })
vim.keymap.set({ "n", "t" }, "<A-j>", "<CMD>wincmd j<CR>", { desc = "Down window", silent = true })
vim.keymap.set({ "n", "t" }, "<A-k>", "<CMD>wincmd k<CR>", { desc = "Up window", silent = true })
vim.keymap.set({ "n", "t" }, "<A-l>", "<CMD>wincmd l<CR>", { desc = "Right window", silent = true })
