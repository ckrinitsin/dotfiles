vim.keymap.set("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jk", "<Esc>", {})

vim.keymap.set('n', '<leader>ff', ':Telescope find_files theme=dropdown<CR>', {})
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', {})

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', {})
