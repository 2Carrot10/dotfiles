return {
	"nvim-lua/plenary.nvim",
	"nvim-neorg/lua-utils.nvim",
	--"2Carrot10/nvim-compile",
	"norcalli/nvim-colorizer.lua",
	-- {"luarocks/luarocks.nvim",
	-- priority = 1000,
	-- config = true
	-- },
  	"christoomey/vim-tmux-navigator",

{
  "teamtype/teamtype-nvim",
  keys = {
    { "<leader>ej", "<cmd>TeamtypeJumpToCursor<cr>" },
    { "<leader>ef", "<cmd>TeamtypeFollow<cr>" },
  },
  lazy = false,
}
}
