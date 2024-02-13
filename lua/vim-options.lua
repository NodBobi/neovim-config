vim.cmd("set number")
vim.cmd("color tokyonight-night")
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.g.mapleader = " "

-- Set custom commands to run on neovim startup
vim.cmd(":Neotree filesystem reveal left")

-- Set custom keymap bindings
-- Open this config directory
vim.keymap.set("n", "<leader>config", ":edit /home/luukas/.config/nvim/init.lua | :Neotree filesystem reveal left dir=~/.config/nvim<CR>", {})
-- Open a file finder in telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
-- Open a live grep on telescope
vim.keymap.set("n", "<leader>lg", ":Telescope live_grep<CR>")
-- Open a (horizontal) terminal in a new buffer
vim.keymap.set("n", "<leader>term", ":split | :terminal<CR>")
-- Open a (vertical) terminal in a new buffer
vim.keymap.set("n", "<leader>vsh", ":vsplit | :terminal<CR>")
-- Save all changed files and then open a shell in a new buffer
vim.keymap.set("n", "<leader>wsh", ":wa | :split | :terminal<CR>")
-- Open a neovim cheatsheet
vim.keymap.set("n", "<leader>csh", ":Cheatsheet<CR>")
-- Open the ChatGPT window
vim.keymap.set("n", "<leader>gpt", ":ChatGPT<CR>");

-- Custom functionality
vim.keymap.set("n", "<leader>raw", function()
	local word_under_cursor = vim.fn.expand("<cword>")
	local to_replace_with = vim.fn.input(string.format("Replace word '%s' with (q to cancel): ", word_under_cursor))

	if to_replace_with == "q" then
		vim.print("Operation cancelled...")
	else
		vim.cmd("%s/" .. string.format("%s/%s", word_under_cursor, to_replace_with))
		vim.print(string.format("All occurances of string '%s' has been changed to '%s'", word_under_cursor, to_replace_with))
	end
end)
