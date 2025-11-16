local vim = vim

vim.opt.completeopt = { "menuone", "noselect", "popup" }
--
-- prevent the built-in vim.lsp.completion autotrigger from selecting the first item
vim.diagnostic.config({ virtual_text = true })

vim.lsp.config['luals'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      }
    }
  }
}

vim.lsp.config('clangd', {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'h', 'hpp' },
  root_markers = { '.clangd', '.git' },
  on_attach = function(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub('%b()', '') }
      end,
    })
  end,
})

vim.lsp.enable('luals')
vim.lsp.enable('clangd')

