return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		{
			"Wansmer/treesj",
			keys = { "<space>m", "<space>j", "<space>s" },
			dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
			config = function()
				require("treesj").setup({--[[ your config ]]
				})
			end,
		},
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			-- Standardize your list into ensure_installed
			ensure_installed = {
				"lua",
				"vimdoc",
				"markdown",
				"php",
				"javascript",
				"rust",
				"html",
				"bash",
				"cmake",
				"css",
				"dart",
				"dockerfile",
				"go",
				"graphql",
				"http",
				"json",
				"make",
				"python",
				"regex",
				"ruby",
				"sql",
				"typescript",
				"yaml",
				"vue",
				"tsx",
				"prisma",
				"markdown_inline",
			},

			-- Automatically install missing parsers when entering a buffer
			auto_install = true,

			highlight = {
				enable = true,
				-- Set to false so standard vim syntax doesn't clash with treesitter
				additional_vim_regex_highlighting = false,
			},

			indent = {
				enable = true, -- Safely enables Treesitter indentation
			},
		})
	end,
}
