-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1352
if vim.b.eruby_subtype == "yaml" then
  vim.bo.filetype = "yaml"
end
