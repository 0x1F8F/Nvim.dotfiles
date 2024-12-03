require('mason').setup()
require('mason-lspconfig').setup()

local lspconfig = require 'lspconfig'

-- lspconfig.rust_analyzer.setup {
-- 	-- Server-specific settings. See `:help lspconfig-setup`
-- 	--  settings = {
-- 	--    ['rust-analyzer'] = {},
-- 	--  },
-- }
-- empty line

-- lspconfig.ast_grep.setup {
-- 	filetypes = { "c", "cpp", "html", "bash", "java", "ruby", "css" }
-- }
--
-- lspconfig.eslint.setup {
-- 	filetypes = { "javascript", "typescript", "jsx", "tsx" , "json" }
-- }
--

-- local lspconfig = require('lspconfig')
lspconfig.denols.setup {
	root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
}
lspconfig['ts_ls'].setup {
	root_dir = lspconfig.util.root_pattern 'package.json',
	single_file_support = false,
}
lspconfig.typos_lsp.setup {
	init_options = {
		config = "~/.config/typos-lsp/typos.toml",
		diagnosticSeverity = "Hint"
	}
}
lspconfig.svelte.setup {}
lspconfig.clangd.setup {}
lspconfig.tailwindcss.setup {}
lspconfig.astro.setup { filetypes = { 'astro' }, }
lspconfig.ruff.setup {}
lspconfig['lua_ls'].setup {}
lspconfig.rust_analyzer.setup {}
-- require('ferris').setup()
-- require("ferris.methods.view_hir")
-- require("conform").setup({
-- 	formatters_by_ft = {
-- 		-- lua = { "stylua" },
-- 		-- Conform will run multiple formatters sequentially
-- 		python = { "isort", "black" },
-- 		-- Use a sub-list to run only the first available formatter
-- 		javascript = { { "eslint_d" } },
-- 	},
--
-- 	format_after_save = {
-- 		lsp_format = "fallback",
-- 	},
-- })
