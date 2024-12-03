local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
			{ out,                            'WarningMsg' },
			{ '\nPress any key to exit...' },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'


require('lazy').setup {
	spec = {
		{ import = 'ext' },
	},
	checker = { enabled = false },
}



require 'editor.map'
require 'config.mason'
require 'config.null-ls'
require 'config.lsp'
require 'config.cmp'
require 'config.aerial'
require 'config.telescope'
require 'config.treesitter'
require 'config.dressing'
require 'config.gitsigns'
require 'config.lualine'
require 'config.utils'



require("catppuccin").setup({
	flavour = "mocha",   -- latte, frappe, macchiato, mocha
	background = {       -- :h background
		dark = "mocha",
	},
	transparent_background = false,   -- disables setting the background color.
	show_end_of_buffer = true,        -- shows the '~' characters after the end of buffers
	term_colors = false,              -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false,                -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15,              -- percentage of the shade to apply to the inactive window
	},
	no_italic = false,                -- Force no italic
	no_bold = false,                  -- Force no bold
	no_underline = false,             -- Force no underline
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
		-- miscs = {}, -- Uncomment to turn off hard-coded styles
	},
	color_overrides = {},
	custom_highlights = {},
	default_integrations = true,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		telescope = {
			enabled = true,
		}
	},
})
vim.cmd.colorscheme "catppuccin"



local colors = require 'catppuccin.palettes.mocha'
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

local GitSignsColor = {
  GitSignsAdd = { fg=colors.teal },
  GitSignsChange = { fg=colors.peach },
}

for hl, col in pairs(GitSignsColor) do
  vim.api.nvim_set_hl(0, hl, col)
end
