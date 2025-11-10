local vim = vim

vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.lsp.config('clangd', {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'h', 'hpp' },
  on_attach = function(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub('%b()', '') }
      end,
    })
  end,
})

vim.lsp.enable('clangd')

vim.diagnostic.config({ virtual_text = true })
-- prevent the built-in vim.lsp.completion autotrigger from selecting the first item
