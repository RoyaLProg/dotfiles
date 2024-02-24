require("mason").setup()

-- install language servers
require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls", "clangd", "tsserver"}
})

-- init language servers
require("lspconfig").lua_ls.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").tsserver.setup {}
