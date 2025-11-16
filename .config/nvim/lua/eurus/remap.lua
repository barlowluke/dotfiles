local vim = vim

vim.g.mapleader = " "
-- go back to netrw
vim.keymap.set("n", "<Leader>pv", "<cmd>Ex<CR>")
-- clear highlighting
vim.keymap.set("n", "<Leader>hc", "<cmd>let @/ = ''<CR>")
--
-- next, previous, and delete buffers
vim.keymap.set("n", "<Leader>n", "<cmd>bnext<CR>")
vim.keymap.set("n", "<Leader>p", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<Leader>d", "<cmd>bdelete<CR>")

-- clear background highlighting to show transparent background
vim.keymap.set("n", "<Leader>hlc", "<cmd>highlight Normal guibg=none<CR>")
-- make background opacity 100%
vim.keymap.set("n", "<Leader>hlb", "<cmd>colorscheme gruvbox<CR>")
