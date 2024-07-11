vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n' , '<leader>ts' , ':Telescope<CR>')
vim.keymap.set('n' , '<leader>ff' , ':Telescope find_files<CR>')
vim.keymap.set('n' , '<leader>gf' , ':Telescope git_files<CR>')
vim.keymap.set('n' , '<leader>gs' , ':Telescope git_status<CR>')
