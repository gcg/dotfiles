-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{
			"tanvirtin/monokai.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				-- load the colorscheme here
				vim.cmd([[colorscheme monokai]])
			end,
		},
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		{ "nvim-treesitter/nvim-treesitter-context" },
		{ "jwalton512/vim-blade" },

		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
			-- use opts = {} for passing setup options
			-- this is equivalent to setup({}) function
		},

		{ "numToStr/Comment.nvim" },

		{
			"nvim-tree/nvim-tree.lua",
			version = "*",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("nvim-tree").setup({})
			end,
		},

		{ "JoosepAlviste/nvim-ts-context-commentstring" },

		{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

		{ "editorconfig/editorconfig-vim" },

		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			opts = {},
			dependencies = "echasnovski/mini.icons",
		},

		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-cmdline" },

		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },

		{ "neovim/nvim-lspconfig" },
		{ "nvimtools/none-ls.nvim" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "lukas-reineke/lsp-format.nvim" },

		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},

		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-github.nvim",
			},
		},

		{ "lewis6991/gitsigns.nvim" },
		{ "wakatime/vim-wakatime" },
		{ "f-person/git-blame.nvim" },
		{ "kevinhwang91/nvim-bqf" },
		{ "norcalli/nvim-colorizer.lua" },
		{ "vimsence/vimsence" },

		{
			"folke/trouble.nvim",
			opts = {}, -- for default options, refer to the configuration section for custom setup.
			cmd = "Trouble",
			dependencies = { "kyazdani42/nvim-web-devicons" },
			keys = {
				{
					"<leader>xx",
					"<cmd>Trouble diagnostics toggle<cr>",
					desc = "Diagnostics (Trouble)",
				},
				{
					"<leader>xX",
					"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
					desc = "Buffer Diagnostics (Trouble)",
				},
				{
					"<leader>cs",
					"<cmd>Trouble symbols toggle focus=false<cr>",
					desc = "Symbols (Trouble)",
				},
				{
					"<leader>cl",
					"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
					desc = "LSP Definitions / references / ... (Trouble)",
				},
				{
					"<leader>xL",
					"<cmd>Trouble loclist toggle<cr>",
					desc = "Location List (Trouble)",
				},
				{
					"<leader>xQ",
					"<cmd>Trouble qflist toggle<cr>",
					desc = "Quickfix List (Trouble)",
				},
			},
		},
		{
			"folke/todo-comments.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
		},
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			---@module "ibl"
			---@type ibl.config
			opts = {},
		},
		{
			"kylechui/nvim-surround",
			version = "*", -- Use for stability; omit to use `main` branch for the latest features
			event = "VeryLazy",
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
				})
			end,
		},
		{
			"Wansmer/treesj",
			keys = { "<space>m", "<space>j", "<space>s" },
			dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
			config = function()
				require("treesj").setup({--[[ your config ]]
				})
			end,
		},
		{ "themaxmarchuk/tailwindcss-colors.nvim" },
		{
			"kdheepak/lazygit.nvim",
			lazy = true,
			cmd = {
				"LazyGit",
				"LazyGitConfig",
				"LazyGitCurrentFile",
				"LazyGitFilter",
				"LazyGitFilterCurrentFile",
			},
			-- optional for floating window border decoration
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			-- setting the keybinding for LazyGit with 'keys' is recommended in
			-- order to load the plugin when the command is run for the first time
			keys = {
				{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
			},
		},
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {},
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
		},
		{
			"stevearc/aerial.nvim",
			opts = {},
			-- Optional dependencies
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
				"nvim-tree/nvim-web-devicons",
			},
		},
		{
			"zk-org/zk-nvim",
			config = function()
				require("zk").setup({
					-- See Setup section below
				})
			end,
		},
		{
			"michaelrommel/nvim-silicon",
			lazy = true,
			cmd = "Silicon",
			main = "nvim-silicon",
			opts = {
				font = "SauceCodePro NF=18;SauceCodePro NFM=18",
				theme = "Monokai Extended",
				background = "#009eec",
				to_clipboard = true,
				output = function()
					return "~/Desktop/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
				end,
				window_title = function()
					return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
				end,
				line_offset = function(args)
					return args.line1
				end,
			},
		},

		{
			"nvimdev/lspsaga.nvim",
			config = function()
				require("lspsaga").setup({})
			end,
			dependencies = {
				"nvim-treesitter/nvim-treesitter", -- optional
				"nvim-tree/nvim-web-devicons", -- optional
			},
		},
		{
			"christoomey/vim-tmux-navigator",
			cmd = {
				"TmuxNavigateLeft",
				"TmuxNavigateDown",
				"TmuxNavigateUp",
				"TmuxNavigateRight",
				"TmuxNavigatePrevious",
				"TmuxNavigatorProcessList",
			},
			keys = {
				{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
				{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
				{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
				{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
				{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
			},
		},
		{
			"karb94/neoscroll.nvim",
			opts = {
				mappings = { -- Keys to be mapped to their corresponding default scrolling animation
					"<C-u>",
					"<C-d>",
					"zt",
					"zz",
					"zb",
				},
			},
		},
		-- endof plugins
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
