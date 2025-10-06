-- Custom lint configuration to override upstream
-- This disables problematic linters like markdownlint
return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    
    -- Start with empty linters to avoid ENOENT errors
    lint.linters_by_ft = {}
    
    -- Only enable linters that are known to be available
    -- Add more as needed when tools are properly installed
    
    -- Create autocommand for linting
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        if vim.bo.modifiable then
          lint.try_lint()
        end
      end,
    })
  end,
}