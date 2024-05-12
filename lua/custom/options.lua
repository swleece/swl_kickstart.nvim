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

-- Set Copilot related settings
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ''
vim.api.nvim_set_keymap('i', '<C-g>', 'copilot#Accept("<CR>")', { silent = true, expr = true })




-- Key mappings
-- SL - Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- SL - Map for copy/yank to clipboard
vim.keymap.set('v', '<leader>cp', '"+y')

-- TODO: consider this?
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })


-- General Keymaps
-- paste and keep current paste text after pasting over a selection
vim.keymap.set('x', '<Leader>p', '"_dP')
-- Normal Mode
-- select all text
vim.keymap.set('n', '<Leader>sa', 'ggVG')
-- open file explorer netrw
vim.keymap.set('n', '<Leader>pv', ':Ex<CR>')
vim.keymap.set('n', '<Leader>ex', ':Ex<CR>')
-- when using J, append subsequent line to current line keeping cursor in place
vim.keymap.set('n', 'J', 'mzJ`z')
-- center cursor with certain commands
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
-- Visual Mode
-- yank to clipboard
vim.keymap.set('v', '<Leader>yc', '"+y')
-- Move selected lines up or down one line at a time
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
