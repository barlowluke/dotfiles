local vim = vim

require("eurus.set")
require("eurus.remap")
require("eurus.plug")
require("eurus.lsp")

vim.cmd("colorscheme gruvbox")
vim.cmd([[highlight Normal guibg=none]])
