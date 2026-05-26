vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "  "
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 400
opt.completeopt = "menu,menuone,noselect"
opt.inccommand = "split"

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

vim.filetype.add({
  extension = {
    env = "sh",
    mdx = "mdx",
  },
  filename = {
    [".env"] = "sh",
    ["justfile"] = "just",
    ["Justfile"] = "just",
  },
})
