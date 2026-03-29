return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  keys = {
    {
      "<leader>gg",
      function()
        local bufname = vim.api.nvim_buf_get_name(0)
        -- Si estamos en Oil, extraer el path real (oil:///ruta/ → /ruta/)
        local real_path = bufname:match("^oil://(.+)") or vim.fn.expand("%:p:h")
        if vim.fn.isdirectory(real_path) == 1 then
          vim.cmd("LazyGit " .. vim.fn.fnameescape(real_path))
        else
          vim.cmd("LazyGitCurrentFile")
        end
      end,
      desc = "Open LazyGit",
    },
  },
  opts = {
    floating_window = true,
    use_float = true,
    config = {
      theme = "kanagawa",
    },
  },
}
