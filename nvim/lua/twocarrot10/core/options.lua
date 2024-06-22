vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt
opt.clipboard:append("unnamedplus")

opt.relativenumber = true
opt.number = true

--opt.cursorline = true

opt.signcolumn = "yes"

opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.ignorecase = true
opt.smartcase = true

opt.iskeyword:append("-")

opt.cursorline = true

opt.spelllang = 'en_us'
opt.spell = true

--[[
vim.api.nvim_set_keymap('v','jk','<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v','kj','<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','jk','<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','kj','<Esc>', { noremap = true, silent = true })
]]--
