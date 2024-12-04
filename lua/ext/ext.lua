return {
{
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "nu" }, -- Ensure the "nu" parser is installed
            highlight = {
                enable = true,            -- Enable syntax highlighting
            },
            -- OPTIONAL!! These enable ts-specific textobjects.
            -- So you can hit `yaf` to copy the closest function,
            -- `dif` to clear the contet of the closest function,
            -- or whatever keys you map to what query.
            textobjects = {
                select = {
                    enable = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        -- For example:
                        -- Nushell only
                        ["aP"] = "@pipeline.outer",
                        ["iP"] = "@pipeline.inner",

                        -- supported in other languages as well
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["aC"] = "@conditional.outer",
                        ["iC"] = "@conditional.inner",
                        ["iS"] = "@statement.inner",
                        ["aS"] = "@statement.outer",
                    }, -- keymaps
                }, -- select
            }, -- textobjects
        }
    end,
    dependencies = {
        -- Additional Nushell parser
        { "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
    },
    build = ":TSUpdate",
},




	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	'NvChad/nvim-colorizer.lua',
  'stevearc/dressing.nvim',
  'lewis6991/gitsigns.nvim',
  'vxpm/ferris.nvim',
  'neovim/nvim-lspconfig',
  'stevearc/conform.nvim',
  'nvim-lualine/lualine.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  -- {'NvChad/nvim-colorizer.lua',opts = {},},
  -- {
  -- 'stevearc/aerial.nvim',opts = {},
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'nvim-tree/nvim-web-devicons',
  --   },
  -- },
  {
		'L3MON4D3/LuaSnip',
		version = 'v2.3.0',
		build = 'make install_jsregexp',
	},
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-telescope/telescope-symbols.nvim' },
  { 'nvim-tree/nvim-tree.lua' },
  {
    'hedyhli/outline.nvim',
    config = function()
      vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })
      require('outline').setup {
      }
    end,
  },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'stevearc/aerial.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
}
