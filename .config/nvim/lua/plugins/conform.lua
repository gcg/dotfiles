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
			php = { "php_cs_fixer" },
			json = { "jq" },
			blade = { "blade-formatter" },
			-- ios
			swift = { "swiftformat" },
			-- android
			kotlin = { "ktlint" },
			java = { "google-java-format" },
			xml = { "xmllint" },
			toml = { "taplo" },
			groovy = { "npm-groovy-lint" },
		},
		default_format_opts = {
			-- Allow formatting from LSP server if no dedicated formatter is available
			lsp_format = "fallback",
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
	},
}
