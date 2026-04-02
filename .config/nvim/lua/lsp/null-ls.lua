local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local h = require("null-ls.helpers")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	on_attach = function(client)
		require("lsp-format").on_attach(client)
	end,
	sources = {
		formatting.blade_formatter,
		diagnostics.golangci_lint,
		diagnostics.phpstan.with({
			command = "./vendor/bin/phpstan",
			args = { "analyze", "--error-format", "json", "--no-progress", "$FILENAME" },
		}),
		diagnostics.phpcs.with({
			generator_opts = {
				command = "./vendor/bin/phpcs",
				args = {
					"--report=json",
					-- silence status messages during processing as they are invalid JSON
					"-q",
					-- always report codes
					"-s",
					-- phpcs exits with a non-0 exit code when messages are reported but we only want to know if the command fails
					"--runtime-set",
					"ignore_warnings_on_exit",
					"1",
					"--runtime-set",
					"ignore_errors_on_exit",
					"1",
					-- process stdin
					"--stdin-path=$FILENAME",
					"-",
				},
				format = "json_raw",
				to_stdin = true,
				from_stderr = false,
				check_exit_code = function(code)
					return code <= 1
				end,
				on_output = function(params)
					local parser = h.diagnostics.from_json({
						attributes = {
							severity = "type",
							code = "source",
						},
						severities = {
							ERROR = h.diagnostics.severities["error"],
							WARNING = h.diagnostics.severities["warning"],
						},
					})
					params.messages = params.output
							and params.output.files
							and params.output.files[params.bufname]
							and params.output.files[params.bufname].messages
						or {}

					return parser({ output = params.messages })
				end,
			},
		}),
	},
})
