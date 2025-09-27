-- Custom initialization module for swl_kickstart.nvim
-- This module consolidates all custom configurations and overrides

local M = {}

function M.setup()
  -- Load custom options
  require('custom.options').setup()
  
  -- Load custom keymaps
  require('custom.keymaps').setup()
  
  -- Any additional custom initialization can go here
end

-- Setup custom options that differ from upstream kickstart
function M.setup_option_overrides()
  -- These override the upstream defaults
  vim.opt.relativenumber = true  -- Enable relative line numbers
  vim.opt.signcolumn = 'yes:1'   -- Keep sign column with width of 1
end

return M