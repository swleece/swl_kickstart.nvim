-- Custom initialization module for swl_kickstart.nvim
-- Loaded once from init.lua via `require('custom').setup()`, after upstream
-- SECTIONS 1-2, so these override upstream defaults. Plugins are loaded
-- separately via `require 'custom.plugins'` near the bottom of init.lua.

local M = {}

function M.setup()
  require('custom.options').setup()
  require('custom.keymaps').setup()
end

return M
