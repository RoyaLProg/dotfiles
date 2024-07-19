vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = {"*.cpp", "*.hpp", "*.h", "*.c", "*.tpp"},
        group = "AutoFormat",
        callback = function()
            vim.lsp.buf.format()
        end,
    }
)
