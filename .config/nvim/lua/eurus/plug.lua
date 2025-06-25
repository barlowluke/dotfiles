local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- colorschemes
Plug('gruvbox-community/gruvbox')
Plug('bluz71/vim-moonfly-colors')

Plug('vim-airline/vim-airline')

-- Package manager
Plug('williamboman/mason.nvim')

vim.call('plug#end')
