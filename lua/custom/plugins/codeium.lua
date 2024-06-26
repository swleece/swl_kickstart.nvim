vim.g.codeium_no_tab = 1
-- disable codeium by default
vim.g.codeium_enabled = false

return {
  'Exafunction/codeium.vim',
  -- event = 'BufEnter',
  config = function()
    vim.keymap.set('i', '<C-g>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })

    vim.keymap.set('i', '<C-;>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true, silent = true })

    vim.keymap.set('i', '<C-,>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true, silent = true })

    vim.keymap.set('i', '<C-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true })

    vim.keymap.set('i', '<C-o>', function()
      return vim.fn['codeium#Complete']()
    end, { expr = true, silent = true })

    -- configure codeium#Chat() in insert or normal mode
    vim.keymap.set('n', '<C-c>', function()
      return vim.fn['codeium#Chat']()
    end, { expr = true, silent = true })
  end,
}
