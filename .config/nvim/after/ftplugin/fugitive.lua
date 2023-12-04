vim.bo.buflisted = false
vim.opt_local.number = false

vim.keymap.set("n", "q", "<CMD>q<CR>", { desc = "Quit", buffer = true, silent = true })
vim.keymap.set("n", "gP", "<CMD>Git push --force-with-lease<CR>", { desc = "Push (force-with-lease)", buffer = true })
vim.keymap.set("n", "gp", function()
  local branch = vim.api.nvim_call_function("FugitiveHead", {})
  vim.cmd("Git push --set-upstream origin " .. branch)
end, { desc = "Push", buffer = true })
