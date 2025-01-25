local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('gruvbox-community/gruvbox')

Plug('vim-airline/vim-airline')

-- Package manager
Plug('williamboman/mason.nvim')

-- LSP plugins
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')

vim.call('plug#end')
