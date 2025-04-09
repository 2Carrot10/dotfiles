vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt
opt.clipboard:append("unnamedplus")
vim.g.mapleader = " "
opt.relativenumber = true
opt.number = true

opt.signcolumn = "yes"

vim.opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
-- opt.autoindent = true

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

vim.wo.fillchars="eob: "

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Gives information about current function"})

vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Rename function"})

vim.keymap.set("n", "<leader>ld", vim.lsp.buf.declaration, { desc = "Go to decleration"})

vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "Go to references"})

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })


vim.keymap.set("n", "<leader>bh", "<cmd>set showtabline=0<CR>", { desc = "hide buffer"})
vim.keymap.set("n", "<leader>bs", "<cmd>set showtabline=2<CR>", { desc = "show buffer"})

vim.keymap.set("n", "<leader>bn", "<cmd>set number!<CR><cmd> set relativenumber!<CR>", { desc = "toggle lines"})

vim.opt.cmdheight = 0
vim.opt.laststatus = 0
opt.showtabline = 0


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    opt.conceallevel = 0
  end
})
