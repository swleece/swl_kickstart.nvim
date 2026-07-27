-- Neo-tree file explorer.
-- plenary is already installed by upstream init.lua; we add neo-tree + nui here.
-- Icons come from mini.icons (mocked as nvim-web-devicons in init.lua).
vim.g.neo_tree_remove_legacy_commands = 1

vim.pack.add {
  'https://github.com/nvim-neo-tree/neo-tree.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

require('neo-tree').setup {
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}

vim.keymap.set('n', '\\', '<cmd>Neotree reveal<cr>', { desc = 'NeoTree reveal' })
