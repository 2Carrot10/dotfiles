require("core/options")
require("core/lazy")
--[[
    vim.api.nvim_create_autocmd({'BufWritePost'}, {
      pattern = '*.latex',
      command = "silent !lualatex %"
    })
]]--

	vim.api.nvim_create_user_command("Pdf",":w | !lualatex %", {})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.mylang = {
	install_info = {
		url = "~/path/to/mylang-parser",
		files = { "src/parser.c" },
		branch = "main",
	},
	filetype = "mylang",
}
