local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- colorschemes
Plug('gruvbox-community/gruvbox')

Plug('vim-airline/vim-airline')

-- Package manager
Plug('williamboman/mason.nvim')

Plug('lervag/vimtex')

-- LSP plugins
Plug('neovim/nvim-lspconfig')

vim.call('plug#end')

