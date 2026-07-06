-- Colorscheme override: catppuccin (mocha). Upstream ships tokyonight; this
-- file is loaded last (via custom.plugins), so this colorscheme wins.
-- A named spec is used so the plugin isn't installed under the bare name "nvim".
vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }

require('catppuccin').setup {
  flavour = 'mocha',
}

vim.cmd.colorscheme 'catppuccin'
