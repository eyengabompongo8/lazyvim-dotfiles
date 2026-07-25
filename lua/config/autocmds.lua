-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-save buffers on every edit and context switch
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave", "InsertLeave", "TextChanged" }, {
  desc = "Auto-save modified buffers instantly",
  pattern = "*",
  callback = function()
    -- Safety checks before saving:
    -- 1. vim.bo.modified: Only save if the buffer has unsaved changes.
    -- 2. vim.bo.buftype == "": Don't save special buffers (like help pages, terminals, or popups).
    -- 3. vim.fn.expand("%") ~= "": Don't save unnamed "No Name" new buffers that don't exist on disk yet.
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
})
