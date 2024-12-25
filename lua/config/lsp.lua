require('mason').setup()
require('mason-lspconfig').setup()

local lspconfig = require 'lspconfig'

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities,
}

lspconfig.denols.setup {
	root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
}

lspconfig['ts_ls'].setup {
	root_dir = lspconfig.util.root_pattern 'package.json',
	single_file_support = false,
}

-- lspconfig.typos_lsp.setup {
-- 	init_options = {
-- 		config = "~/.config/typos-lsp/typos.toml",
-- 		diagnosticSeverity = "Hint"
-- 	}
-- }


lspconfig.svelte.setup {}
lspconfig.clangd.setup {}
lspconfig.tailwindcss.setup {}
lspconfig.astro.setup { filetypes = { 'astro' }, }
lspconfig.ruff.setup {}
lspconfig['lua_ls'].setup {}
-- lspconfig.rust_analyzer.setup {}
