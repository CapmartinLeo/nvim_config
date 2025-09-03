return {
  padding = true,
  sticky = true,
  ignore = nil,
  toggler = {
    line = '<leader>/',
    block = '<leader>//'
  },
  opleader = {
    line = '<leader>/',
    block = '<leader>//'
  },
  extra = {
    above = 'gcO',
    below = 'gco',
    eol = 'gcA',
  },
  mappings = {
    basic = true,
    extra = true,
  },
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  post_hook = nil,
}
