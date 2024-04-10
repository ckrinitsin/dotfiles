return {

    {
        "simrat39/rust-tools.nvim",
        config = function ()
            require("rust-tools").setup()
            vim.keymap.set("n", '<leader>rr', ':lua require("rust-tools").runnables.runnables()<CR>', {})
            vim.keymap.set("n", '<leader>rt', ':lua require("rust-tools").open_cargo_toml.open_cargo_toml()<CR>', {})
            vim.keymap.set("n", '<leader>rd', ':!cargo doc --open <CR>', {})
        end
    }

}
