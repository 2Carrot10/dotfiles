vim.cmd("let g:netrw_liststyle = 3")
vim.opt.clipboard:append("unnamedplus")
vim.g.mapleader = " "
vim.opt.number = true
vim.o.cursorline = false

vim.opt.signcolumn = "yes"

vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.iskeyword:append("-")

vim.opt.cursorline = true

vim.opt.spelllang = 'en_us'
vim.opt.spell = true

vim.opt.backupcopy = "yes"

vim.wo.fillchars = "eob: "

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

vim.keymap.set("n", "<leader>kt",
    function() vim.opt.showtabline = (vim.opt.showtabline:get() == 0) and 2 or 0 end,
    { desc = "Toggle buffer" }
)

vim.keymap.set("n", "<leader>kn",
    function()
        vim.o.number = not vim.o.number
        vim.o.relativenumber = vim.o.number
    end,
    { desc = "Toggle lines" }
)

vim.keymap.set("n", "<leader>ka", function() vim.o.relativenumber = not vim.o.relativenumber end)


vim.keymap.set("n", "<leader>kw",
    function() vim.o.wrap = not vim.wo.wrap end,
    { desc = "Toggle wrap" }
)

vim.keymap.set("n", "<leader>kc", "<cmd>TSContextToggle<CR>", { desc = "Toggle context" })

vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.showtabline = 0


vim.api.nvim_create_autocmd("FileType", {
    pattern = { "json", "jsonc" },
    callback = function()
        vim.opt.conceallevel = 0
    end
})

-- Pdf compilation
vim.api.nvim_create_user_command("P", ":w | silent !lualatex % 1> /dev/null", {})

-- In part for bacon-ls
-- vim.diagnostics.opts.update_in_insert = true
