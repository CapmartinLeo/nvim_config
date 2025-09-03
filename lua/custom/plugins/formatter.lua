local utils = require 'formatter.util'
local formatterGroup = vim.api.nvim_create_augroup('FormatAutogrop', { clear = false })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   command = 'FormatWrite',
--   group = formatterGroup,
--   pattern = '*',
-- })

return {
  filetype = {
    lua = {
      require('formatter.filetypes.lua').stylua,

      function()
        if utils.get_current_buffer_file_name() == 'special.lua' then
          return nil
        end

        return {
          exe = 'stylua',
          args = {
            '--search-parent-directories',
            '--stdin-filepath',
            utils.escape_path(utils.get_current_buffer_file_path()),
            '--',
            '-',
          },
          stdin = true,
        }
      end,
    },
    vue = {
      require('formatter.filetypes.vue').prettier,
    },
    javascript = {
      require('formatter.filetypes.javascript').prettier,
    },
    typescript = {
      require('formatter.filetypes.typescript').prettier,
    },
    json = {
      require('formatter.filetypes.json').prettier,
    },
    css = {
      require('formatter.filetypes.css').prettier,
    },
    scss = {
      require('formatter.filetypes.css').prettier,
    },
    html = {
      require('formatter.filetypes.html').prettier,
    },
    c = {
      require('formatter.filetypes.c').clangformat,
    },
    cpp = {
      require('formatter.filetypes.cpp').clangformat,
    },
    cs = {
      require('formatter.filetypes.cs').dotnetformat,
    },
    yaml = {
      require('formatter.filetypes.yaml').prettier,
    },
    sql = {
      require('formatter.filetypes.sql').sqlfluff,
    },
    ['*'] = {
      require('formatter.filetypes.any').remove_trailing_whitespace,
    },
  },
}
