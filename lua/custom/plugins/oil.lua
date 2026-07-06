-- Oil file explorer. Use `nvim .` to open a directory with Oil active.
-- Icons are provided by mini.icons (mocked as nvim-web-devicons in init.lua).
vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup {
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  },
}

vim.keymap.set('n', '<leader>oe', '<cmd>Oil<cr>', { desc = 'Open Oil file explorer', silent = true })
