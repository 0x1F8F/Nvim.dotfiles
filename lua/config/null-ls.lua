local null_ls = require 'null-ls'

null_ls.setup {
  sources = {
    -- null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.diagnostics.eslint_d,
    -- null_ls.builtins.diagnostics.pylint.with {
    --   diagnostics_postprocess = function(diagnostic)
    --     diagnostic.code = diagnostic.message_id
    --   end,
    -- },
    -- null_ls.builtins.diagnostics.typos,
    -- null_ls.builtins.diagnostics.stylelint,
    -- null_ls.builtins.formatting.isort,
    -- null_ls.builtins.formatting.rustfmt.with {
    --   extra_args = { '--edition=2021' },
    -- },
    -- null_ls.builtins.completion.spell,
    -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
    --
  },
}
