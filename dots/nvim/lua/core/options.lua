vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt
opt.clipboard:append("unnamedplus")
vim.g.mapleader = " "
opt.relativenumber = true
opt.number = true

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

vim.opt.backupcopy = "yes"

--[[
vim.api.nvim_set_keymap('v','jk','<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v','kj','<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','jk','<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','kj','<Esc>', { noremap = true, silent = true })
]]--

vim.api.nvim_set_keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.api.nvim_set_keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

vim.api.nvim_set_keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.api.nvim_set_keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

vim.api.nvim_set_keymap("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Gives information about current function"})

vim.api.nvim_set_keymap("n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename function"})

vim.api.nvim_set_keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to decleration"})

vim.api.nvim_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to references"})

vim.api.nvim_set_keymap("n", "<leader>li", "<cmd>=vim.lsp.buf<CR>", { desc = "See all lsp commands"})

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })


vim.api.nvim_set_keymap("n", "<leader>bh", "<cmd>set showtabline=1<CR>", { desc = "hide buffer"})
vim.api.nvim_set_keymap("n", "<leader>bs", "<cmd>set showtabline=2<CR>", { desc = "show buffer"})

vim.api.nvim_set_keymap("n", "<leader>bn", "<cmd>set number!<CR><cmd> set relativenumber!<CR>", { desc = "toggle lines"})
