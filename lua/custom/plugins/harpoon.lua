-- Harpoon (v1). TODO: add harpoon keymaps with which-key documentation included.
--   <Leader>m  | add file to harpoon marks   -> require('harpoon.mark').add_file()
--   <C-e>      | toggle quick menu           -> require('harpoon.ui').toggle_quick_menu()
--   <C-(zxcv)> | nav to marked file 1..4     -> require('harpoon.ui').nav_file(n)
vim.pack.add { 'https://github.com/ThePrimeagen/harpoon' }
