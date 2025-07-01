vim.lsp.enable('clangd')
vim.lsp.enable('haskell-language-server')
vim.lsp.enable('lua-language-server')

vim.lsp.config('haskell-language-server', {
  cmd = { 'haskell-language-server' },
  filetypes = { 'haskell' },
})

vim.lsp.config('lua-language-server', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
})

vim.diagnostic.config({ virtual_text = true })
