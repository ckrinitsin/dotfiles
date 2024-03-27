return {
    {
        "simrat39/rust-tools.nvim",
        config = function ()
            require("rust-tools").setup({
                tools = {
                    hover_actions = {
                        winhighlight = "NormalCmpDoc",
                        border = {
                            { "╭", "CmpDocBorder" },
                            { "─", "CmpDocBorder" },
                            { "╮", "CmpDocBorder" },
                            { "│", "CmpDocBorder" },
                            { "╯", "CmpDocBorder" },
                            { "─", "CmpDocBorder" },
                            { "╰", "CmpDocBorder" },
                            { "│", "CmpDocBorder" },
                        },
                        auto_focus = true,
                    },
                },
                server = {
                    on_attach = function(_, bufnr)
                        vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
                    end,
                },
            })
        end
    }
}
