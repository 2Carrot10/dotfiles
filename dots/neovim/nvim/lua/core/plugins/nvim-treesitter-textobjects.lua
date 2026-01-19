---@diagnostic disable: missing-fields
return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
						["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
						["lh"] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
						["rh"] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

						["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
						["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

						["an"] = { query = "@return.outer", desc = "Select outer part of a return" },
						["in"] = { query = "@return.inner", desc = "Select inner part of a return" },

						["ae"] = { query = "@comment.outer", desc = "Select outer part of a comment" },
						["ie"] = { query = "@comment.inner", desc = "Select inner part of a comment" },

						["au"] = { query = "@attribute.outer", desc = "Select outer part of a attribute" },
						["iu"] = { query = "@attribute.inner", desc = "Select inner part of a attribute" },

						["ar"] = { query = "@return.outer", desc = "Select outer part of a return" },
						["ir"] = { query = "@return.inner", desc = "Select inner part of a return" },

						["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
						["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

						["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
						["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

						["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
						["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

						["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
						["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

						["io"] = { query = "@scope.inner", desc = "Select inner part of a scope definition" },
						["ao"] = { query = "@scope.outer", desc = "Select outer part of a scope definition" },

						["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },

						["ab"] = { query = "@block.outer", desc = "Select outer part of a block" },
						["ib"] = { query = "@block.inner", desc = "Select inner part of a block" },


						["at"] = { query = "@statement.outer", desc = "Select outer part of a statement" },
						["it"] = { query = "@statement.inner", desc = "Select inner part of a statement" }, -- Use outer instead
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
						["<leader>nm"] = "@function.outer", -- swap function with next
						["<leader>nt"] = "@statement.outer", -- swap statement with next
					},
					swap_previous = {
						["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
						["<leader>pm"] = "@function.outer", -- swap function with previous
						["<leader>pt"] = "@statement.outer", -- swap statement with previous
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]f"] = { query = "@call.outer", desc = "Next function call start" },
						["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
						["]c"] = { query = "@class.outer", desc = "Next class start" },
						["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
						["]l"] = { query = "@loop.outer", desc = "Next loop start" },
						["]t"] = { query = "@statement.outer", desc = "Next statement start" },
						["]="] = { query = "@assignment.outer", desc = "Next assignment start" },

						-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
						-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
						["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
						["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
					},
					goto_next_end = {
						["]F"] = { query = "@call.outer", desc = "Next function call end" },
						["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
						["]C"] = { query = "@class.outer", desc = "Next class end" },
						["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
						["]L"] = { query = "@loop.outer", desc = "Next loop end" },
						["]T"] = { query = "@statement.outer", desc = "Next statement end" },
					},
					goto_previous_start = {
						["[f"] = { query = "@call.outer", desc = "Prev function call start" },
						["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
						["[c"] = { query = "@class.outer", desc = "Prev class start" },
						["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
						["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
						["[t"] = { query = "@statement.outer", desc = "Prev statement start" },
						["[="] = { query = "@assignment.outer", desc = "Prev assignment start" },
					},
					goto_previous_end = {
						["[F"] = { query = "@call.outer", desc = "Prev function call end" },
						["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
						["[C"] = { query = "@class.outer", desc = "Prev class end" },
						["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
						["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
						["[T"] = { query = "@statement.outer", desc = "Prev statement end" },

					},
				},
			},
		})

		local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

		-- Repeat movement with ; and ,
		-- ensure ; goes forward and , goes backward regardless of the last direction
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
	end,
}
