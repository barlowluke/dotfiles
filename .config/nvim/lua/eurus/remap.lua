local vim = vim

vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>pv", "<cmd>Ex<CR>")
vim.keymap.set("n", "<Leader>hc", "<cmd>let @/ = ''<CR>")
vim.keymap.set("n", "<Leader>n", "<cmd>bnext<CR>")
vim.keymap.set("n", "<Leader>p", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<Leader>d", "<cmd>bdelete<CR>")
vim.keymap.set("n", "<Leader>hlc", "<cmd>highlight Normal guibg=none<CR>")
vim.keymap.set("n", "<Leader>hlb", "<cmd>colorscheme gruvbox<CR>")
