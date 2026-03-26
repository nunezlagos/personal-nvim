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
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
  },
  opts = {
    floating_window = true,
    use_float = true,
    config = {
      theme = "kanagawa",
    },
  },
}
