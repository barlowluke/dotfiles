local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('gruvbox-community/gruvbox')
Plug('vim-airline/vim-airline')
Plug('lervag/vimtex')
Plug('nvim-treesitter/nvim-treesitter')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = 'v0.1.9' })

-- LSP plugin
Plug('neovim/nvim-lspconfig')

vim.call('plug#end')

