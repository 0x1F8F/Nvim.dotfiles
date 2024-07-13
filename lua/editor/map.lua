
local home = os.getenv("HOME")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- -- 
vim.opt.termguicolors = true
vim.opt.rnu = true
vim.opt.nu = true
vim.opt.numberwidth= 2
vim.opt.cul = true
vim.opt.ic = false
vim.opt.shiftwidth = 2
vim.opt.showbreak = "> "
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = -1
vim.opt.undofile = true
vim.opt.undolevels = 50
vim.opt.undodir = home .. "/.cache/nvim/undo/"
vim.opt.backup = true
vim.opt.backupdir = home .. "/.cache/nvim/backups/"
vim.opt.wrap = false

vim.cmd.colorscheme("catppuccin-macchiato")

vim.keymap.set("n", "<leader>ts", ":Telescope<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("i", "<C-f>", "<Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>gf", ":Telescope git_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope git_files<CR>")
vim.keymap.set("n", "<leader>gs", ":Telescope git_status<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")

vim.keymap.set("n", "<leader>cf", "<Cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
