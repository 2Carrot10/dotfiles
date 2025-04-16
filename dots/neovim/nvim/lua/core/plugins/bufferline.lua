return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "thin", --"slant",
      mode = "tabs", -- set to "tabs" to only show tabpages instead-- Alternative is buffer
      auto_toggle_bufferline = false
    },
  },
}
