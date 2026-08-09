require('map')
require('lazy_nvim')
require('plugins')
require('set')

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "*.ts", "*.rs", "*.js" },
  callback = function() vim.treesitter.start() end,
})
