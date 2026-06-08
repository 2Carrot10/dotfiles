require("core/options")
require("core/lazy")
--[[
    vim.api.nvim_create_autocmd({'BufWritePost'}, {
      pattern = '*.latex',
      command = "silent !lualatex %"
    })
]]--
