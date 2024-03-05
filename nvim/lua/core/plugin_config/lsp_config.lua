require("mason").setup()

-- install language servers
require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls", "clangd", "tsserver"}
})

local on_attach = function ( )
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.codeaction, {})
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- init language servers
require("lspconfig").lua_ls.setup {
	capabilities = capabilities,
	on_attach = on_attach
}
require("lspconfig").clangd.setup  {
	capabilities = capabilities,
	on_attach = on_attach
}

require("lspconfig").tsserver.setup  {
	capabilities = capabilities,
	on_attach = on_attach
}



