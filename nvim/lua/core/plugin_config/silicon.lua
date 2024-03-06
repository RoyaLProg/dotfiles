require("silicon").setup({
	theme = "OneHalfDark",
	font = "JetBrainsMono=26",
	background = "#82aaff",
	no_window_controls = true,
	to_clipboard = true,
	window_title = function()
	 	return vim.fn.fnamemodify(
	 		vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
	 		":t"
 		)
	end,
	output = function()
		return "/home/royal/Pictures/Screenshots/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
	end,
})
