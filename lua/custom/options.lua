-- General options
-- Completion (cmp)
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.incsearch = true
vim.opt.colorcolumn = '80'
vim.opt.equalalways = true -- equal splits automatically
vim.opt.wrap = true

vim.opt.relativenumber = true

-- Decrease update time
vim.opt.updatetime = 250 -- previously, 50

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- Set Copilot related settings
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ''
-- vim.api.nvim_set_keymap('i', '<C-g>', 'copilot#Accept("<CR>")', { silent = true, expr = true })

require('codecompanion').setup {
  strategies = {
    chat = {
      adapter = 'anthropic',
    },
    inline = {
      adapter = 'anthropic',
    },
    agent = {
      adapter = 'anthropic',
    },
  },
}

require('codecompanion').setup {
  adapters = {
    anthropic = function()
      return require('codecompanion.adapters').extend('anthropic', {
        env = {
          api_key = vim.fn.environ()['ANTHROPIC_API_KEY'],
        },
      })
    end,
  },
}
