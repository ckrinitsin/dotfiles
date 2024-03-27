return {

    {
        "neanias/everforest-nvim",
        lazy = false, -- load during startup
        priority = 1000, -- load before all the other start plugins
        config = function()
  local everforest = require("everforest")
  everforest.setup({
    background = "medium",
    transparent_background_level = 0,
    italics = true,
    disable_italic_comments = false,
    on_highlights = function(hl, _)
      hl["@string.special.symbol.ruby"] = { link = "@field" }
    end,
  })
  everforest.load()
        end,
    }

}
