function window()
  return vim.api.nvim_win_get_number(0)
end

require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = palenight,
	},
	sections = {
		lualine_a = { window }
	}
})
