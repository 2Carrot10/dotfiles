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

-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

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

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })


vim.keymap.set("n", "<leader>bt",
  function() opt.showtabline = (opt.showtabline:get() == 0) and 2 or 0 end,
  { desc = "toggle buffer" }
)

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

-- Pdf compilation
vim.api.nvim_create_user_command("P",":w | silent !lualatex % 1> /dev/null", {})
