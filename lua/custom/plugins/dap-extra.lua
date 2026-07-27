-- Extra DAP adapters + inline virtual text, layered on top of
-- `kickstart.plugins.debug` (which is required earlier in init.lua and installs
-- nvim-dap / dap-ui and sets up the core keymaps). Keeping these here means the
-- kickstart debug.lua stays byte-identical to upstream.
vim.pack.add {
  'https://github.com/suketa/nvim-dap-ruby',
  'https://github.com/mfussenegger/nvim-dap-python',
  'https://github.com/theHamsta/nvim-dap-virtual-text', -- shows variable values inline
}

require('nvim-dap-virtual-text').setup()
require('dap-ruby').setup()

-- Python: point dap-python at a debugpy-enabled interpreter. Per CLAUDE.md the
-- expected venv is created at ~/.virtualenvs/debugpy (see README for setup).
require('dap-python').setup(vim.fn.expand '~/.virtualenvs/debugpy/bin/python')
