return {
  'ThePrimeagen/harpoon', -- TODO: add harpoon keymaps with which-key documentation included
  -- Harpoon commands
  -- leader a | add file to harpoon marks
  -- C-e | toggle quick menu
  -- C-(zxcv) | nav to each marked file
  -- vim.keymap.set("n", "<Leader>m", function() require("harpoon.mark").add_file() end, { silent = true })
  -- vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, { silent = true })
  -- vim.keymap.set("n", "<C-z>", function() require("harpoon.ui").nav_file(1) end, { silent = true })
  -- vim.keymap.set("n", "<C-x>", function() require("harpoon.ui").nav_file(2) end, { silent = true })
  -- vim.keymap.set("n", "<C-c>", function() require("harpoon.ui").nav_file(3) end, { silent = true })
  -- vim.keymap.set("n", "<C-v>", function() require("harpoon.ui").nav_file(4) end, { silent = true })
}