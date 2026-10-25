-- ~/.config/nvim/init.lua
-- Config mínima: opções básicas + tema próprio (sem plugins)

vim.g.mapleader = " "

-- Opções ---------------------------------------------------------------
local o = vim.opt
o.number = true
o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.ignorecase = true
o.smartcase = true
o.termguicolors = true
o.clipboard = "unnamedplus"
o.cursorline = true
o.scrolloff = 8
o.undofile = true
o.signcolumn = "yes"

-- Paleta ---------------------------------------------------------------
-- Troque os hex pelos do seu rice (polybar/i3/fastfetch).
-- bg = "NONE" deixa o fundo transparente: usa o fundo do terminal.
local c = {
  bg      = "NONE",
  fg      = "#CBCCC6",
  red     = "#F07178", -- destaque principal
  orange  = "#FFB454",
  yellow  = "#FFD580",
  green   = "#AAD94C",
  cyan    = "#95E6CB",
  blue    = "#73D0FF",
  purple  = "#D4BFFF",
  gray    = "#130007",
  surface = "#78383C", -- linha atual, popups
  select  = "#F07178", -- seleção visual
}

-- Tema -----------------------------------------------------------------
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.g.colors_name = "rice"

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Interface
hl("Normal",       { fg = c.fg, bg = c.bg })
hl("NormalFloat",  { fg = c.fg, bg = c.surface })
hl("CursorLine",   { bg = c.surface })
hl("CursorLineNr", { fg = c.red, bold = true })
hl("LineNr",       { fg = c.surface })
hl("SignColumn",   { bg = c.bg })
hl("Visual",       { bg = c.select })
hl("Search",       { fg = c.bg == "NONE" and "#F07178" or c.bg, bg = c.yellow })
hl("IncSearch",    { fg = "#1F2430", bg = c.surface })
hl("MatchParen",   { fg = c.red, bold = true, underline = true })
hl("NonText",      { fg = c.red })
hl("Folded",       { fg = c.gray, bg = c.surface })
hl("WinSeparator", { fg = c.gray })
hl("Title",        { fg = c.red, bold = true })
hl("Directory",    { fg = c.red })

-- Barras e menus
hl("StatusLine",   { fg = c.gray, bg = c.surface })
hl("StatusLineNC", { fg = c.gray, bg = c.surface })
hl("Pmenu",        { fg = c.red, bg = c.surface })
hl("PmenuSel",     { fg = "#1F2430", bg = c.red })

-- Mensagens
hl("ErrorMsg",     { fg = c.red, bold = true })
hl("WarningMsg",   { fg = c.red })

-- Sintaxe
hl("Comment",      { fg = c.gray, italic = true })
hl("Constant",     { fg = c.purple })
hl("String",       { fg = c.green })
hl("Number",       { fg = c.purple })
hl("Boolean",      { fg = c.purple })
hl("Identifier",   { fg = c.fg })
hl("Function",     { fg = c.yellow })
hl("Statement",    { fg = c.red })
hl("Keyword",      { fg = c.red })
hl("Operator",     { fg = c.orange })
hl("PreProc",      { fg = c.orange })
hl("Type",         { fg = c.blue })
hl("Special",      { fg = c.cyan })
hl("Delimiter",    { fg = c.gray })
hl("Error",        { fg = c.red, underline = true })
hl("Todo",         { fg = c.orange, bold = true })

-- Diagnósticos (úteis quando você adicionar LSP)
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn",  { fg = c.red })
hl("DiagnosticInfo",  { fg = c.red })
hl("DiagnosticHint",  { fg = c.red })

-- Atalhos --------------------------------------------------------------
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
