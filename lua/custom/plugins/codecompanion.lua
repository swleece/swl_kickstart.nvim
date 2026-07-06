-- CodeCompanion (AI chat / inline).
-- plenary, nvim-treesitter and telescope are already installed by upstream
-- init.lua, so we only add codecompanion + dressing here. nvim-cmp is skipped
-- (this config uses blink.cmp).
vim.pack.add {
  'https://github.com/olimorris/codecompanion.nvim',
  'https://github.com/stevearc/dressing.nvim',
}

require('dressing').setup {}
require('custom.options').setup_codecompanion()
