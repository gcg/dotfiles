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
		local languages = {
			-- These are already pre-installed with Neovim. Used as an example.
			"lua",
			"vimdoc",
			"markdown",
			-- Add here more languages with which you want to use tree-sitter
			-- To see available languages:
			-- - Execute `:=require('nvim-treesitter').get_available()`
			-- - Visit 'SUPPORTED_LANGUAGES.md' file at
			--   https://github.com/nvim-treesitter/nvim-treesitter/blob/main
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
		}
		local isnt_installed = function(lang)
			return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
		end
		local to_install = vim.tbl_filter(isnt_installed, languages)
		if #to_install > 0 then
			require("nvim-treesitter").install(to_install)
		end

		-- Enable tree-sitter after opening a file for a target language
		local filetypes = {}
		for _, lang in ipairs(languages) do
			for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
				table.insert(filetypes, ft)
			end
		end

		local ts_indent_langs = { "php" }

		local ts_start = function(ev)
			vim.treesitter.start(ev.buf)
			if vim.tbl_contains(ts_indent_langs, vim.bo[ev.buf].filetype) then
				vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		end
		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,
			callback = ts_start,
		})
	end,
}
