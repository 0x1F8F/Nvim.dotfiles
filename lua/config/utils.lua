require('ibl').setup()

require('nvim-autopairs').setup {
  disable_filetype = { 'TelescopePrompt' },
}

-- If you want insert `(` after select function or method item
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp = require 'cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

local npairs = require 'nvim-autopairs'
local Rule = require 'nvim-autopairs.rule'

npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { 'string' }, -- it will not add a pair on that treesitter node
    javascript = { 'template_string' },
    java = false, -- don't check treesitter on java
  },
}

local ts_conds = require 'nvim-autopairs.ts-conds'

-- press % => %% only while inside a comment or string
npairs.add_rules {
  Rule('%', '%', 'lua'):with_pair(ts_conds.is_ts_node { 'string', 'comment' }),
  Rule('$', '$', 'lua'):with_pair(ts_conds.is_not_ts_node { 'function' }),
}

local handlers = require 'nvim-autopairs.completion.handlers'

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done {
    filetypes = {
      -- "*" is a alias to all filetypes
      ['*'] = {
        ['('] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers['*'],
        },
      },
      lua = {
        ['('] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          ---@param char string
          ---@param item table item completion
          ---@param bufnr number buffer number
          ---@param rules table
          ---@param commit_character table<string>
          handler = function(char, item, bufnr, rules, commit_character)
            -- Your handler function. Inspect with print(vim.inspect{char, item, bufnr, rules, commit_character})
          end,
        },
      },
      -- Disable for tex
      tex = false,
    },
  }
)

local scope = "focus"
local indent = "passive"

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "focus", { fg = "#6f6f8f" })
	vim.api.nvim_set_hl(0, "passive", { fg = "#41425e" })
end)

require("ibl").setup({
	scope = { highlight = scope },
	indent = { highlight = indent }
})
