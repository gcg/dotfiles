local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"lua",
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
		"markdown",
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
	}, -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	indent = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})
