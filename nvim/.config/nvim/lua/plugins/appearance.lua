return {

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
          require("nvim-treesitter.configs").setup({
              ensure_installed = { "c", "lua", "vim", "rust", "toml", "latex" },
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },
            })
        end
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function ()
            require'colorizer'.setup()
        end
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },

}
