-- This plugin is a community maintained null-ls fork. none-ls gives the editor diagnostics and formatting features for non-lsp services

return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            suorces = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
            }
        })

        -- gf: Generate Formatting
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
