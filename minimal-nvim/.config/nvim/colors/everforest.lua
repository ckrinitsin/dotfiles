local colors = {
  bg0 = "#2d353b",
  bg1 = "#343f44",
  bg2 = "#3d484d",
  bg3 = "#475258",
  fg = "#d3c6aa",
  red = "#e67e80",
  orange = "#e69875",
  yellow = "#dbbc7f",
  green = "#a7c080",
  aqua = "#83c092",
  blue = "#7fbbb3",
  purple = "#d699b6",
  grey = "#7a8478",
}

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "everforest"

local function hi(group, opts)
  local cmd = "highlight " .. group
  if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
  if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
  if opts.style then cmd = cmd .. " gui=" .. opts.style end
  if opts.fg then cmd = cmd .. " ctermfg=NONE" end
  if opts.bg then cmd = cmd .. " ctermbg=NONE" end
  vim.cmd(cmd)
end

-- Editor highlights
hi("Normal", { fg = colors.fg, bg = colors.bg0 })
vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg0 })
hi("NormalFloat", { fg = colors.fg, bg = colors.bg1 })
hi("Comment", { fg = colors.grey, style = "italic" })
hi("Constant", { fg = colors.purple })
hi("String", { fg = colors.green })
hi("Character", { fg = colors.green })
hi("Number", { fg = colors.purple })
hi("Boolean", { fg = colors.purple })
hi("Float", { fg = colors.purple })
hi("Identifier", { fg = colors.blue })
hi("Function", { fg = colors.aqua })
hi("Statement", { fg = colors.red })
hi("Conditional", { fg = colors.red })
hi("Repeat", { fg = colors.red })
hi("Label", { fg = colors.red })
hi("Operator", { fg = colors.orange })
hi("Keyword", { fg = colors.red })
hi("Exception", { fg = colors.red })
hi("PreProc", { fg = colors.aqua })
hi("Include", { fg = colors.aqua })
hi("Define", { fg = colors.aqua })
hi("Macro", { fg = colors.aqua })
hi("Type", { fg = colors.yellow })
hi("StorageClass", { fg = colors.orange })
hi("Structure", { fg = colors.aqua })
hi("Special", { fg = colors.orange })
hi("Underlined", { fg = colors.blue, style = "underline" })
hi("Error", { fg = colors.red })
hi("Todo", { fg = colors.purple, style = "bold" })

-- UI elements
hi("CursorLine", { bg = colors.bg1 })
hi("CursorColumn", { bg = colors.bg1 })
hi("LineNr", { fg = colors.grey })
hi("CursorLineNr", { fg = colors.fg })
hi("Visual", { bg = colors.bg3 })
hi("VisualNOS", { bg = colors.bg3 })
hi("Search", { fg = colors.bg0, bg = colors.yellow })
hi("IncSearch", { fg = colors.bg0, bg = colors.orange })
hi("Pmenu", { fg = colors.fg, bg = colors.bg2 })
hi("PmenuSel", { fg = colors.aqua, bg = colors.bg })
hi("StatusLine", { fg = colors.fg, bg = colors.bg2 })
hi("StatusLineNC", { fg = colors.grey, bg = colors.bg1 })
hi("VertSplit", { fg = colors.bg3 })
hi("TabLine", { fg = colors.grey, bg = colors.bg1 })
hi("TabLineSel", { fg = colors.fg, bg = colors.bg2 })
hi("TabLineFill", { bg = colors.bg1 })

hi("@lsp.type.namespace", { fg = colors.aqua })
hi("@lsp.type.type", { fg = colors.yellow })
hi("@lsp.type.struct", { fg = colors.yellow })
hi("@lsp.type.enum", { fg = colors.yellow })
hi("@lsp.type.interface", { fg = colors.yellow })
hi("@lsp.type.parameter", { fg = colors.fg })
hi("@lsp.type.variable", { fg = colors.fg })
hi("@lsp.type.property", { fg = colors.fg })
hi("@lsp.type.function", { fg = colors.aqua })
hi("@lsp.type.method", { fg = colors.blue })
hi("@lsp.type.macro", { fg = colors.aqua })
hi("@lsp.type.keyword", { fg = colors.red })
hi("@lsp.type.comment", { fg = colors.grey, style = "italic" })
hi("@lsp.type.string", { fg = colors.green })
hi("@lsp.type.number", { fg = colors.purple })
hi("@lsp.type.operator", { fg = colors.orange })
hi("@lsp.mod.constant", { fg = colors.purple })

-- Treesitter highlights (for Lua)
hi("@variable", { fg = colors.fg })
hi("@variable.builtin", { fg = colors.blue })
hi("@property", { fg = colors.fg })
hi("@field", { fg = colors.fg })
hi("@parameter", { fg = colors.fg })
hi("@namespace", { fg = colors.aqua })
hi("@module", { fg = colors.aqua })
hi("@function.call", { fg = colors.aqua })
hi("@method.call", { fg = colors.aqua })
hi("@constructor", { fg = colors.yellow })
hi("@keyword", { fg = colors.red })
hi("@keyword.function", { fg = colors.red })
hi("@keyword.operator", { fg = colors.red })
hi("@conditional", { fg = colors.red })
hi("@repeat", { fg = colors.red })
hi("@string", { fg = colors.green })
hi("@number", { fg = colors.purple })
hi("@boolean", { fg = colors.purple })
hi("@operator", { fg = colors.orange })
hi("@punctuation.bracket", { fg = colors.fg })
hi("@punctuation.delimiter", { fg = colors.fg })
hi("@comment", { fg = colors.grey, style = "italic" })
