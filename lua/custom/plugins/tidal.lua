-- TidalCycles live-coding support.
-- The Haskell and SuperCollider treesitter parsers it wants are installed
-- automatically by upstream's treesitter auto-install when a .hs / .scd (or
-- tidal) buffer is opened, so no explicit ensure_installed is needed here.
vim.pack.add { 'https://github.com/thgrund/tidal.nvim' }

require('tidal').setup {}
