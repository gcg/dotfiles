return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main", -- Explicitly switch to the actively maintained branch
	build = ":TSUpdate",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		{
			"Wansmer/treesj",
			keys = { "<space>m", "<space>j", "<space>s" },
			dependencies = { "nvim-treesitter/nvim-treesitter" },
			config = function()
				require("treesj").setup({})
			end,
		},
	},
	config = function()
		-- The .configs module and ensure_installed list have been removed.
		-- Parsers are now installed via the native install() method.
		require("nvim-treesitter").install({
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
			"swift", -- Added so it installs successfully on startup without auto_install
		})

		-- Highlight and indent are now handled manually via Neovim autocommands
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				-- pcall safely falls back if a filetype lacks an installed parser
				pcall(vim.treesitter.start)
			end,
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
