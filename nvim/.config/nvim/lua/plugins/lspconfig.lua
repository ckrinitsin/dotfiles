local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

return {

    {
        "hrsh7th/cmp-nvim-lsp",
        config = function()
            require'cmp'.setup {
                sources = {
                  { name = 'nvim_lsp' }
                }
            }
        end
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require'lspconfig'.lua_ls.setup{
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                settings = {  Lua = {  diagnostics = {  globals = { 'vim', 'c2', 'love' }  }  }  }
            }

            require'lspconfig'.clangd.setup{
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            }

            require'lspconfig'.texlab.setup{
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                settings = { texlab = { diagnostics = { ignoredPatterns = { 'Unused label'} } } }
            }

            require'lspconfig'.bashls.setup{
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            }

            require'lspconfig'.pylsp.setup{
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            }

            require'lspconfig'.gopls.setup{
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            }

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                end,
            })

        end,
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer", -- source for text in buffer
            "hrsh7th/cmp-path", -- source for file system paths in commands
            "L3MON4D3/LuaSnip", -- snippet engine
            "saadparwaiz1/cmp_luasnip", -- for lua autocompletion
            "rafamadriz/friendly-snippets", -- useful snippets library
            "onsails/lspkind.nvim", -- vs-code like pictograms
        },

        config = function()

        local x = vim.diagnostic.severity

        vim.diagnostic.config {
          virtual_text = { prefix = "" },
          signs = { text = { [x.ERROR] = " ", [x.WARN] = " ", [x.INFO] = " ", [x.HINT] = "H "} },
          underline = true,
        }

        local cmp = require("cmp")

        local luasnip = require("luasnip")

        local lspkind = require("lspkind")

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
          completion = {
            completeopt = "menu,menuone,preview,noselect",
          },

          window = {
            completion = {
              border = border "CmpDocBorder",
              winhighlight = "Normal:CmpDoc",
            },
            documentation = {
              border = border "CmpDocBorder",
              winhighlight = "Normal:CmpDoc",
            },
          },

          snippet = { -- configure how nvim-cmp interacts with snippet engine
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },

          mapping = cmp.mapping.preset.insert({
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
              else
                fallback()
              end
            end, { "i", "s", }),
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
              else
                fallback()
              end
            end, { "i", "s", }),
            ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<C-e>"] = cmp.mapping.abort(), -- close completion window
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
          }),

          -- sources for autocompletion
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" }, -- snippets
            { name = "buffer" }, -- text within current buffer
            { name = "path" }, -- file system paths
          }),

          -- configure lspkind for vs-code like pictograms in completion menu
          formatting = {
            format = lspkind.cmp_format({
              maxwidth = 50,
              ellipsis_char = "...",
            }),
          },
        })

        vim.cmd(':set winhighlight=' .. cmp.config.window.bordered().winhighlight)
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
          border = border "CmpDocBorder",
        })
      end,
    },

    {
       "aznhe21/actions-preview.nvim",
       config = function()
         vim.keymap.set({ "v", "n" }, "<leader>an", require("actions-preview").code_actions)
       end,
    },

    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },

}
