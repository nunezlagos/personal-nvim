-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ─────────────────────────────────────────────────────────────────────────────
-- Volver al dashboard cuando no quedan buffers de archivo abiertos
-- ─────────────────────────────────────────────────────────────────────────────
vim.api.nvim_create_autocmd("BufDelete", {
  group = vim.api.nvim_create_augroup("dashboard_on_empty", { clear = true }),
  callback = function()
    vim.schedule(function()
      -- Contar buffers reales (archivos, no terminales ni especiales)
      local bufs = vim.tbl_filter(function(b)
        return vim.api.nvim_buf_is_valid(b)
          and vim.bo[b].buflisted
          and vim.bo[b].buftype == ""
          and vim.api.nvim_buf_get_name(b) ~= ""
      end, vim.api.nvim_list_bufs())

      if #bufs == 0 then
        Snacks.dashboard()
      end
    end)
  end,
})
