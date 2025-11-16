local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('gruvbox-community/gruvbox')
Plug('vim-airline/vim-airline')
Plug('lervag/vimtex')
Plug('nvim-treesitter/nvim-treesitter')

-- LSP plugin
Plug('neovim/nvim-lspconfig')

vim.call('plug#end')

