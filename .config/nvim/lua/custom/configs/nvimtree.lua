vim.g.nvim_tree_disable_netrw = 0 -- for rhubarb.vim

local timer = vim.uv.new_timer()
timer:start(2000, 1, function()
  require("nvim-tree.api").tree.reload()
end)

-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   callback = function(data)
--     -- buffer is a directory or file
--     local directory = vim.fn.isdirectory(data.file) == 1
--     -- -- buffer is a real file on the disk
--     local real_file = vim.fn.filereadable(data.file) == 1
--     -- buffer is a [No Name]
--     local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
--
--     if not directory and not real_file and not no_name then
--       return
--     end
--
--     -- change to the directory
--     vim.cmd.cd(data.file)
--
--     -- open the tree
--     -- require("nvim-tree.api").tree.open()
--     require("nvim-tree.api").tree.toggle { focus = false, find_file = true }
--
--     -- -- buffer is a real file on the disk
--     -- local real_file = vim.fn.filereadable(data.file) == 1
--     --
--     -- -- buffer is a [No Name]
--     -- local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
--     --
--     -- if not real_file and not no_name then
--     --   return
--     -- end
--     --
--     -- -- open the tree, find the file but don't focus it
--     -- require("nvim-tree.api").tree.toggle { focus = false, find_file = true }
--   end,
-- })
