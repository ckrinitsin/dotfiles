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
                settings = {  Lua = {  diagnostics = {  globals = { 'vim', 'c2' }  }  }  }
           }

           require'lspconfig'.clangd.setup{
                capabilities = require('cmp_nvim_lsp').default_capabilities()
           }
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
      end,
    },

    {
       "aznhe21/actions-preview.nvim",
       config = function()
         vim.keymap.set({ "v", "n" }, "<leader>an", require("actions-preview").code_actions)
       end,
    },

}
