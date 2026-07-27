-- Lint override.
-- Upstream's `kickstart.plugins.lint` (enabled in init.lua) installs nvim-lint
-- and sets linters_by_ft = { markdown = { 'markdownlint' } }. That errors with
-- ENOENT unless markdownlint is installed, so we clear the markdown entry here.
-- This file runs AFTER kickstart.plugins.lint (custom.plugins is required last
-- in init.lua), so the plugin and its autocmd are already set up.
local ok, lint = pcall(require, 'lint')
if ok then
  lint.linters_by_ft.markdown = nil
end
