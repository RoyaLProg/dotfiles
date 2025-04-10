local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
			'nvim-lualine/lualine.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
			'nvim-telescope/telescope.nvim', tag = '0.1.5',
			dependencies = { 'nvim-lua/plenary.nvim' }
	},
	'drewtempelmeyer/palenight.vim',
	'nvim-treesitter/nvim-treesitter',
	{
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
	},
	'voldikss/vim-floaterm',
	--'nvim-tree/nvim-tree.lua',
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
	"williamboman/mason.nvim",
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	{
		'crnvl96/lazydocker.nvim',
		dependencies = {
		   "MunifTanjim/nui.nvim",
		}
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				-- follow latest release.
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!).
				build = "make install_jsregexp",
				dependencies = {
					'saadparwaiz1/cmp_luasnip',
					'rafamadriz/friendly-snippets'
				}
			},
			'hrsh7th/cmp-nvim-lsp'
		},
	},
	{
		"michaelrommel/nvim-silicon",
		lazy = true,
		cmd = "Silicon",
	},
	'folke/todo-comments.nvim',
	{"echasnovski/mini.nvim", version = false},
	{
	  "folke/noice.nvim",
	  event = "VeryLazy",
	  opts = {
	    -- add any options here
	  },
	  dependencies = {
	    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	    "MunifTanjim/nui.nvim",
	    -- OPTIONAL:
	    --   `nvim-notify` is only needed, if you want to use the notification view.
	    --   If not available, we use `mini` as the fallback
		{ "rcarriga/nvim-notify", opts = {stages = 'static'}}
	    }
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false;
	},
	-- {
	-- 	"sphamba/smear-cursor.nvim",
	-- 	opts = {
	-- 		smear_between_buffers = true,
	-- 		smear_insert_mode = true,
	-- 		swiftness = 0.8,
	-- 		trailing_stiffness = 0.5,
	-- 		distance_stop_animating = 0.5
	-- 	},
	-- },
	{
		"karb94/neoscroll.nvim",
		opts = {
			hide_cursor = false
		},
	}
})
