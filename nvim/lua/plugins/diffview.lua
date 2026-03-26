return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = {
        layout = "diff2_horizontal",
      },
    },
  },
}
