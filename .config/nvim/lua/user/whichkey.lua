local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
	return
end

local setup = {
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	win = {
		border = "rounded",
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		wo = {
			winblend = 0,
		},
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	show_help = true, -- show help message on the command line when the popup is visible
}

wk.setup(setup)

wk.add({
	{
		-- file operations
		"<leader>f",
		desc = "File Operations",
		group = "file",
		{
			"<leader>ff",
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			desc = "Locate files via file names",
		},
		{
			"<leader>fF",
			"<cmd>Telescope live_grep theme=ivy<cr>",
			desc = "Locate files via contents",
		},
		{
			"<leader>fe",
			"<cmd>NvimTreeToggle<cr>",
			desc = "File explorer",
		},
	},
	{
		-- buffers
		"<leader>b",
		group = "buffers",
		expand = function()
			return require("which-key.extras").expand.buf()
		end,
	},
	{
		mode = { "n", "v" }, -- NORMAL and VISUAL mode
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
		{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
	},
	{
		-- git
		"<leader>g",
		group = "git",
		desc = "Version Control Operations",
		mode = { "n" },
		{
			"<leader>gg",
			"<cmd>LazyGit<cr>",
			desc = "LazyGit",
		},
		{
			"<leader>gb",
			"<cmd>lua require 'gitsigns'.blame_line()<cr>",
			desc = "Git blame",
		},
	},
	{
		-- lsp
		"<leader>l",
		desc = "LSP",
	},
	{
		-- search
		"<leader>s",
		desc = "Search",
		{
			"<leader>sb",
			"<cmd>Telescope git_branches<cr>",
			desc = "Search git branches",
		},
		{
			"<leader>st",
			"<cmd>Telescope colorscheme<cr>",
			desc = "Search themes",
		},
		{
			"<leader>sh",
			"<cmd>Telescope help_tags<cr>",
			desc = "Search help tags",
		},
		{
			"<leader>sm",
			"<cmd>Telescope man_pages<cr>",
			desc = "Search man pages",
		},
		{
			"<leader>sf",
			"<cmd>Telescope oldfiles<cr>",
			desc = "Search recently opened files",
		},
		{
			"<leader>sr",
			"<cmd>Telescope registers<cr>",
			desc = "Search in registers",
		},
		{
			"<leader>sk",
			"<cmd>Telescope keymaps<cr>",
			desc = "Search in keymaps",
		},
		{
			"<leader>sc",
			"<cmd>Telescope commands<cr>",
			desc = "Search in commands",
		},
	},
})
