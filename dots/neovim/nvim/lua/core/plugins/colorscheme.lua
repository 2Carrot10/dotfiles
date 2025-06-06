return {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()

        require("tokyonight").setup({
          -- use the night style
          style = "night",
          -- disable italic for functions
          styles = {
            functions = {}
          },
          on_colors = function(colors)
            -- colors.comment = colors.info -- "#bfcfff"
            colors.dim_inactive = "ff0000"
            colors.unused = "ff0000"
          end,
            --[[
          on_highlights = function(highlights, colors)
            highlights.unused = { bg = "#ff0000" }
            


          end,
            ]]--
        })

        vim.cmd("colorscheme tokyonight-night")
    end,
}
