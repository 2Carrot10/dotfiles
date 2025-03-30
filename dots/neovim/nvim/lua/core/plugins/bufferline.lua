return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "thin", --"slant",
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      auto_toggle_bufferline = false
    },
  },
}
