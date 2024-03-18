return {

    {
      "neanias/everforest-nvim",
      lazy = false, -- load during startup
      priority = 1000, -- load before all the other start plugins
      config = function()
        vim.cmd([[colorscheme everforest]]) -- set colortheme
      end,
    }

}
