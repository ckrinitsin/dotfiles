local map = vim.keymap.set

map("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("i", "jk", "<Esc>", {})

vim.keymap.set('n', '<leader>ff', ':Telescope find_files theme=dropdown<CR>', {})
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', {})
