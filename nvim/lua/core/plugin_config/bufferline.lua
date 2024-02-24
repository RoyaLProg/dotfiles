require("bufferline").setup({
	options = {
		themeable = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = ""
			}
		},
		diagnostics = "nvim_lsp",
		separator_style = "thin"
	}
})

vim.keymap.set('n', 'b1', ':BufferLineGoToBuffer 1<CR>')
vim.keymap.set('n', 'b2', ':BufferLineGoToBuffer 2<CR>')
vim.keymap.set('n', 'b3', ':BufferLineGoToBuffer 3<CR>')
vim.keymap.set('n', 'b4', ':BufferLineGoToBuffer 4<CR>')
vim.keymap.set('n', 'b5', ':BufferLineGoToBuffer 5<CR>')
vim.keymap.set('n', 'b6', ':BufferLineGoToBuffer 6<CR>')
vim.keymap.set('n', 'b7', ':BufferLineGoToBuffer 7<CR>')
vim.keymap.set('n', 'b8', ':BufferLineGoToBuffer 8<CR>')
vim.keymap.set('n', 'b9', ':BufferLineGoToBuffer 9<CR>')
vim.keymap.set('n', 'b0', ':BufferLineGoToBuffer 0<CR>')
