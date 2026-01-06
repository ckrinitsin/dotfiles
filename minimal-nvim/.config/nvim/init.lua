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

vim.lsp.completion.enable()
vim.cmd('colorscheme everforest')

vim.keymap.set("n", "<space>c", function() vim.ui.input({}, function(c) if c and c~="" then
  vim.cmd("noswapfile vnew") vim.bo.buftype = "nofile" vim.bo.bufhidden = "wipe"
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c)) end end) end)

vim.lsp.config['rust_ls'] = {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
}
vim.lsp.enable('rust_ls')
vim.lsp.config['c_cpp_ls'] = {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp' },
}
vim.lsp.enable('c_cpp_ls')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
      vim.cmd[[set completeopt=noinsert,menuone,fuzzy]]
    end
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

