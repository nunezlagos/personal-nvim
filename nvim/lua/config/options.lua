-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- UI minimalista
vim.opt.fillchars = {
  eob    = " ",   -- sin ~ al final del buffer
  fold   = " ",   -- sin relleno de folds
  diff   = "╱",   -- separador de diff sutil
  vert   = "│",   -- separador vertical fino
  horiz  = "─",   -- separador horizontal fino
}
vim.opt.winblend   = 0   -- sin blur en floats (más nítido para queratocono)
vim.opt.pumblend   = 0   -- sin blur en popup menu
vim.opt.laststatus = 3   -- status line global (una sola, menos ruido visual)

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
