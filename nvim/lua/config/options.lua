-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Auto-reload files when they change on disk
vim.opt.autoread = true
vim.opt.updatetime = 500 -- Check for changes every 500ms (instead of 4s)

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "FocusGained" }, {
  command = "checktime",
})

-- Check for file changes frequently (using faster updatetime)
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  command = "checktime",
})
