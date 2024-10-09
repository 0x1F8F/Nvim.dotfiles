return {
	{
		'vxpm/ferris.nvim'
	},
  'neovim/nvim-lspconfig',
  'stevearc/conform.nvim',
  {
    'NvChad/nvim-colorizer.lua',
    opts = {},
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
}
