vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.tex",
        callback = function()
            -- vim.cmd("silent make --silent")
        end,
    }
)
