-- NOTE:
-- This plugin requires you to install gcc-c++ tool. With dnf you can just do "dnf install gcc-c++". 
-- You also need to install norg syntax highlighting via treesitter ":TSInstall norg"

return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
	-- tag = "*",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		vim.keymap.set("n", "<localleader>toc", ":Neorg toc <CR>")
		require("neorg").setup {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = { -- Adds pretty icons to your Documents
					config = {
						init_open_folds = "never"
					}
				},
				["core.syntax"] = {}, -- Adds syntax highlighting on @code blocks
				["core.itero"] = {}, -- Adds feature where you can press Alt + Enter and it will make the same list/title item on the next row as well.
				["core.esupports.indent"] = {
					config = {
						format_on_escape = true,
						indents = {
							indent = 4
						}
					}
				},
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/Documents/neorg-notes",
						},
						default_workspace = "notes"
					},
				},
				["core.qol.toc"] = {
					config = {
						close_after_use = true,
					}
				},
			},
		}
	end,
}
