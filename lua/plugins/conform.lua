-- conform is a plugin which provides formatting support for various of different
-- programming languages.

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			-- Rules to different formatters.
			formatters = {
				["prettier"] = {
					prepend_args = { "--tab-width", "4", "--use-tabs" },
				},
				["clang-format"] = {
					inherit = false,
					command = "clang-format",
					args = { "-style", "WebKit" },
				},
			},

			-- Specify different formatters for different filetypes
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				sh = { "beautysh" },
				c = { "clang-format" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
				async = false,
			},
		})

		vim.keymap.set("n", "<leader>gf", function()
			require("conform").format({
				lsp_fallback = true,
				timeout_ms = 500,
				async = false,
			})
		end)
	end,
	opts = {},
}
