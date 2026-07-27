-- Custom key mappings for swl_kickstart.nvim
local M = {}

function M.setup()
  -- Remap for dealing with word wrap
  vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

  -- Map for copy/yank to clipboard
  vim.keymap.set('v', '<leader>cp', '"+y')

  -- Diagnostic keymaps (vim.diagnostic.goto_prev/next are deprecated -> jump)
  vim.keymap.set('n', '[d', function()
    vim.diagnostic.jump { count = -1, float = true }
  end, { desc = 'Go to previous [D]iagnostic message' })
  vim.keymap.set('n', ']d', function()
    vim.diagnostic.jump { count = 1, float = true }
  end, { desc = 'Go to next [D]iagnostic message' })
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
  -- NOTE: <leader>q (setloclist) is defined by upstream init.lua, so not repeated here.

  -- Grep on the git root. Upstream removed the LiveGrepGitRoot command, so we
  -- re-define it here. The command body runs lazily, after telescope loads.
  local function find_git_root()
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_dir = current_file == '' and vim.fn.getcwd() or vim.fn.fnamemodify(current_file, ':h')
    local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
    if vim.v.shell_error ~= 0 then
      vim.notify('Not a git repository. Searching in cwd instead.', vim.log.levels.WARN)
      return vim.fn.getcwd()
    end
    return git_root
  end
  vim.api.nvim_create_user_command('LiveGrepGitRoot', function()
    require('telescope.builtin').live_grep { search_dirs = { find_git_root() } }
  end, { desc = 'Live grep on the git root' })
  vim.keymap.set('n', '<leader>sG', '<cmd>LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })

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

  -- CodeCompanion
  vim.api.nvim_set_keymap('n', '<C-a>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<C-a>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<LocalLeader>a', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<LocalLeader>a>', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true })

  -- Expand 'cc' into 'CodeCompanion' in the command line
  vim.cmd [[cab cc CodeCompanion]]
end

return M
