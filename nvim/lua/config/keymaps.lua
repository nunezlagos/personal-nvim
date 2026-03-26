-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ToggleTerm maneja todo automáticamente con <leader>tt

-- ═══════════════════════════════════════════════════════════════════════════════
-- WORKFLOW: Keyboard-centric navigation and file management
-- ═══════════════════════════════════════════════════════════════════════════════

-- BUFFER NAVIGATION
vim.keymap.set("n", "<C-Left>", function() vim.cmd("bprevious") end, { desc = "Previous buffer" })
vim.keymap.set("n", "<C-Right>", function() vim.cmd("bnext") end, { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bb", function() vim.cmd("buffer #") end, { desc = "Switch to other buffer" })

-- CLOSE FILES (with save prompt for unsaved)
vim.keymap.set("n", "<leader>bd", function()
  local bufname = vim.fn.expand("%")
  local modified = vim.api.nvim_buf_get_option(0, "modified")
  if modified then
    vim.ui.select({ "Yes", "No", "Cancel" }, {
      prompt = "Save changes to '" .. (bufname == "" and "Untitled" or bufname) .. "'?",
    }, function(choice)
      if choice == "Yes" then vim.cmd("write") vim.cmd("bdelete!")
      elseif choice == "No" then vim.cmd("bdelete!") end
    end)
  else
    vim.cmd("bdelete!")
  end
end, { desc = "Close buffer (ask save if modified)" })

vim.keymap.set("n", "<leader>bo", function()
  vim.cmd("bufdo bdelete!")
  vim.cmd("edit #")
end, { desc = "Close other buffers" })

-- SAVE FILES
vim.keymap.set("n", "<leader>w", function() vim.cmd("write") end, { desc = "Save file" })
vim.keymap.set("n", "<leader>wa", function() vim.cmd("wall") end, { desc = "Save all files" })
vim.keymap.set("n", "<leader>wq", function() vim.cmd("write") vim.cmd("bdelete!") end, { desc = "Save and close" })

-- CLOSE
vim.keymap.set("n", "<leader>q", function() vim.cmd("bdelete!") end, { desc = "Close buffer" })

-- NEW FILES
vim.keymap.set("n", "<leader>bn", function() vim.cmd("enew") end, { desc = "New buffer" })

-- SPLITS / WINDOWS
vim.keymap.set("n", "<leader>sh", function() vim.cmd("split") end, { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>sv", function() vim.cmd("vsplit") end, { desc = "Split vertical" })

-- QUICKFIX LIST
vim.keymap.set("n", "<leader>xq", function() vim.cmd("cclose") end, { desc = "Close quickfix" })

-- DIFFVIEW: Accept/Reject changes (fallback if cursor plugin doesn't work)
-- vim.keymap.set("n", "<leader>da", function()
--   vim.cmd("diffgetodo")
-- end, { desc = "Accept change (obtain)" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- SSHFS: Mount/Umount servers
-- ═══════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<leader>sm", function()
  if _G.mount_sshfs_picker then _G.mount_sshfs_picker() end
end, { desc = "SSHFS Montar" })

vim.keymap.set("n", "<leader>su", function()
  if _G.unmount_sshfs_picker then _G.unmount_sshfs_picker() end
end, { desc = "SSHFS Desmontar" })
