-- Override LazyVim colorscheme y deshabilitar themes default
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        vim.cmd("colorscheme dark-custom")
      end,
    },
  },
  { "catppuccin", enabled = false },
  { "tokyonight", enabled = false },
}
