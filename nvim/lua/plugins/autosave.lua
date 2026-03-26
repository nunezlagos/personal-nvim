-- Fork mantenido de auto-save.nvim
-- El repo original (pocco81) tiene bugs sin corregir
return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    opts = {
      enabled = true,
      execution_message = {
        message = function()
          return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { "InsertLeave", "TextChanged" },
      condition = function(buf)
        local fn = vim.fn
        return fn.getbufvar(buf, "&modifiable") == 1
          and fn.getbufvar(buf, "&filetype") ~= ""
      end,
      write_all_buffers = false,
      debounce_delay = 135,
    },
  },
}
