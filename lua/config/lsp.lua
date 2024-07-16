local lspconfig = require 'lspconfig'
lspconfig.rust_analyzer.setup {
	-- Server-specific settings. See `:help lspconfig-setup`
	--  settings = {
	--    ['rust-analyzer'] = {},
	--  },
}


lspconfig.eslint.setup {}
lspconfig.pyright.setup {}
-- lspconfig.black.setup {}
lspconfig['lua_ls'].setup {}

require("conform").setup({
	formatters_by_ft = {
		-- lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort","black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "eslint_d" } },
	},

	format_after_save = {
    lsp_format = "fallback",
  },
})
