vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'
vim.opt.shell='/bin/bash'
vim.opt.undofile = true

vim.opt.backup=false
vim.opt.writebackup=false
vim.opt.updatetime=300
vim.opt.signcolumn="yes"
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spacesin tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python
vim.opt.smartindent=true
vim.opt.autoindent=true
vim.opt.smarttab=true

vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI

vim.opt.incsearch = true            -- search as characters are entered
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

vim.o.laststatus    = 0             -- remove statusline

vim.cmd('set path+=**')             -- recursive search with find

vim.keymap.set('n', '<space>y', function() vim.fn.setreg('+', vim.fn.expand('%:p')) end)
vim.keymap.set("n", "<space>c", function() vim.ui.input({}, function(c) if c and c~="" then
  vim.cmd("noswapfile vnew") vim.bo.buftype = "nofile" vim.bo.bufhidden = "wipe"
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c)) end end) end)

local plugin_dir = vim.fn.stdpath('config') .. '/pack/vendor/start/everforest-nvim/'
local command = {'git', 'clone', 'https://github.com/neanias/everforest-nvim.git', plugin_dir}

local on_done = function()
  vim.cmd('packloadall! | helptags ALL')
  vim.cmd("colorscheme everforest")
end

vim.fn.jobstart(command, {on_exit = on_done})
