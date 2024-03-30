-- conform is a plugin which provides formatting support for various of different
-- programming languages.

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			-- Rules to different formatters.
			formatters = {
				prettier = {
					prepend_args = { "--tab-width", "4", "--use-tabs" },
				},
				clang_format = {
					prepend_args = { "-style=", "{UseTabs: Always, IndentWidth: 4, TabWidth: 4}" },
				},
			},

			-- Specify different formatters for different filetypes
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				c = { "clang-format" },
			},
		})

		vim.keymap.set("n", "<leader>gf", function()
			require("conform").format({
				lsp_fallback = true,
			})
		end)
	end,
	opts = {},
}
