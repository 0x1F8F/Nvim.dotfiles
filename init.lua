-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Setup lazy.nvim
require('lazy').setup {
  spec = {
    {
      'catppuccin/nvim',
      name = 'catppuccin',
      priority = 1000,
      opts = {
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
        },
      },
    },
    { import = 'ext' },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { 'macchiato' } },
    -- automatically check for plugin updates
    checker = { enabled = false },
  },
}

require 'editor.map'
require 'config.mason'
require 'config.null-ls'
require 'config.lsp'
require 'config.cmp'
require 'config.telescope'
require 'config.treesitter'
require 'config.dressing'
require 'config.gitsigns'
require 'config.lualine'

local colors = require 'catppuccin.palettes.macchiato'
local TelescopePrompt = {
  TelescopePreviewTitle = { fg = colors.crust, bg = colors.red },
  TelescopePromptTitle = { fg = colors.crust, bg = colors.red },
  TelescopeResultsTitle = { fg = colors.crust, bg = colors.red },
  TelescopeBorder = { fg = colors.crust, bg = colors.crust },
  TelescopeNormal = { bg = colors.crust },

  TelescopePromptBorder = { fg = colors.mantle, bg = colors.mantle },
  TelescopePromptNormal = { fg = colors.text, bg = colors.mantle },
  TelescopePromptPrefix = { fg = colors.red, bg = colors.mantle },
}
for hl, col in pairs(TelescopePrompt) do
  vim.api.nvim_set_hl(0, hl, col)
end
