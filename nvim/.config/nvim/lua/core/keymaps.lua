vim.keymap.set("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jk", "<Esc>", {})

vim.keymap.set('n', '<leader>ff', ':Telescope find_files theme=dropdown<CR>', {})
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', {})

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', {})

vim.keymap.set('n', '<C-x>', ':bd<CR>', {})
vim.keymap.set('n', '<C-j>', ':bp<CR>', {})
vim.keymap.set('n', '<C-k>', ':bn<CR>', {})

vim.keymap.set('n', '<leader>ma', ':w<CR>:make<CR>', {})
