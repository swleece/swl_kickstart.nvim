-- Enable the pyright Python LSP WITHOUT editing upstream's server table in
-- init.lua (keeps init.lua byte-identical to upstream, per the fork strategy).
--
-- This runs after SECTION 6 (mason + nvim-lspconfig are set up), so we:
--   1) ensure the pyright binary is installed via mason (idempotent), and
--   2) enable it through the native vim.lsp API (nvim-lspconfig ships the config).
local ok, registry = pcall(require, 'mason-registry')
if ok then
  registry.refresh(function()
    if registry.has_package 'pyright' and not registry.is_installed 'pyright' then
      registry.get_package('pyright'):install()
    end
  end)
end

vim.lsp.enable 'pyright'
