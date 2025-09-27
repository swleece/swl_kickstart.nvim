-- Custom options for swl_kickstart.nvim
-- This module contains all custom options that differ from or extend upstream kickstart

local M = {}

function M.setup()
  -- General options
  vim.opt.completeopt = 'menu,menuone,noselect'
  vim.opt.incsearch = true
  vim.opt.colorcolumn = '80'
  vim.opt.equalalways = true -- equal splits automatically
  vim.opt.wrap = true
  
  -- Custom additions/overrides to upstream kickstart
  vim.opt.relativenumber = true -- Enable relative line numbers (upstream has this disabled)
  vim.opt.signcolumn = 'yes:1'  -- Keep sign column with width of 1 (upstream uses 'yes')
  
  -- Decrease update time
  vim.opt.updatetime = 250 -- previously, 50
  
  -- NOTE: You should make sure your terminal supports this
  vim.opt.termguicolors = true
  
  -- Set highlight on search, but clear on pressing <Esc> in normal mode
  vim.opt.hlsearch = true
  
  -- Set Copilot related settings (commented out - enable if using Copilot)
  -- vim.g.copilot_no_tab_map = true
  -- vim.g.copilot_assume_mapped = true
  -- vim.g.copilot_tab_fallback = ''
  -- vim.api.nvim_set_keymap('i', '<C-g>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
end

-- Setup CodeCompanion (moved here from options to keep it organized)
-- This should be called from the plugin configuration, not from options
function M.setup_codecompanion()
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
end

return M
