local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.actionlint,
    null_ls.builtins.diagnostics.buildifier,
    null_ls.builtins.formatting.buildifier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.swift_format,
    null_ls.builtins.formatting.terraform_fmt,
  },

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
})
