-- Codeium (Exafunction) — a vimscript plugin, configured via g: vars + keymaps.
vim.g.codeium_no_tab = 1
vim.g.codeium_enabled = false -- disabled by default; toggle with :CodeiumEnable

vim.pack.add { 'https://github.com/Exafunction/codeium.vim' }

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

-- Chat in insert or normal mode
vim.keymap.set('n', '<C-c>', function()
  return vim.fn['codeium#Chat']()
end, { expr = true, silent = true })
