-- Diffview: rich git diff / file-history views. plenary is already installed
-- by upstream init.lua.
vim.pack.add { 'https://github.com/sindrets/diffview.nvim' }

require('diffview').setup {}

local map = vim.keymap.set
map('n', '<leader>gd', '<cmd>DiffviewOpen<cr>', { desc = '[G]it [D]iffview open' })
map('n', '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', { desc = '[G]it file [H]istory (current)' })
map('n', '<leader>gH', '<cmd>DiffviewFileHistory<cr>', { desc = '[G]it repo [H]istory' })
map('n', '<leader>gx', '<cmd>DiffviewClose<cr>', { desc = '[G]it diffview close' })
