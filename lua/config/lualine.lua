local lualine = require 'lualine'

local colors = {
  blue = '#9090fb',
  cyan = '#79dac8',
  black = '#080808',
  white = '#c6c6f6',
  orange = '#ffa11f',
  red = '#ff5189',
  teal = '#15bfa1',
  violet = '#d11cb8',
  grey = '#404065',
  bg1 = '#333349',
}

local line_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.bg1 },
  },

  insert = { a = { fg = colors.black, bg = colors.teal } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  command = { a = { fg = colors.black, bg = colors.violet } },
  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.bg1 },
  },
}

local function get_active_lsp()
  local msg = 'no lsp'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    if client.config.filetypes and vim.fn.index(client.config.filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end

local config = {
  options = {
    icons_enabled = true,
    theme = line_theme,
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
  },

  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch', icon = '' },
      'diff',
      { 'diagnostics', sources = { 'nvim_diagnostic' }, symbols = { error = ' ', warn = ' ', info = '' } },
      -- diagnostics_color = {}
      -- error = { fg = colors.red },
      -- warn = { fg = colors.yellow },
      -- info = { fg = colors.cyan },
      { 'filetype', icon_only = true },
    },

    lualine_c = { { 'filename' }, { 'filesize', icon = '󰖡' } },
    lualine_x = {
      'encoding',
      {
        'fileformat',
        fmt = string.lower,
        icons_enabled = false,
      },
      { get_active_lsp, icon = '󱁤' },
    },

    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = { 'filetype' },
    lualine_c = { 'filename', 'filesize' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },

  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}

lualine.setup(config)
