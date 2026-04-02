return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			yaml = { "yq" },
			go = { "goimports", "gofumpt" },
			typescript = { "prettierd" },
			javascript = { "prettierd" },
		},
		default_format_opts = {
			-- Allow formatting from LSP server if no dedicated formatter is available
			lsp_format = "fallback",
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		formatters = {
			phpcbf = {
				command = function()
					local local_bin = vim.fn.getcwd() .. "/vendor/bin/phpcbf"
					if vim.fn.executable(local_bin) == 1 then
						return local_bin
					end
					return "phpcbf"
				end,
			},
		},
	},
}
