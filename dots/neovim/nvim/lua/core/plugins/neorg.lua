return {
  {
      "vhyrro/luarocks.nvim",
      priority = 1000,
      config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    version = "v7.0.0", -- TODO: update this eventually ( https://vhyrro.github.io/posts/neorg-and-luarocks/#the-fix )
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
					-- ["core.summary"] = {},
          ["core.concealer"] = {},
          -- ["core.latex.renderer"] = {},
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  }
}
