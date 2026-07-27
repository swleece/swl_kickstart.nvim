-- Custom options for swl_kickstart.nvim
-- This module contains all custom options that differ from or extend upstream kickstart

local M = {}

function M.setup()
  -- NOTE: Only genuine overrides/additions to upstream live here. Options that
  -- merely duplicate upstream defaults (updatetime=250, termguicolors, hlsearch,
  -- incsearch) were dropped since upstream (init.lua SECTION 1) already sets them.

  -- Additions upstream does not set
  vim.opt.completeopt = 'menu,menuone,noselect'
  vim.opt.colorcolumn = '80'
  vim.opt.equalalways = true -- equal splits automatically
  vim.opt.wrap = true -- paired with the j/k wrap-aware motions in keymaps
  vim.opt.autoread = true
  vim.opt.autowriteall = true

  -- Overrides of upstream defaults
  vim.opt.relativenumber = true -- upstream leaves this disabled
  vim.opt.signcolumn = 'yes:1' -- upstream uses 'yes'
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
      http = {
        anthropic = function()
          return require('codecompanion.adapters').extend('anthropic', {
            env = {
              api_key = vim.fn.environ()['ANTHROPIC_API_KEY'],
            },
          })
        end,
      },
    },
  }
end

return M
