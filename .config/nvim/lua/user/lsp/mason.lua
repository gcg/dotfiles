local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local config_ok, mason_lsp_config = pcall(require, "mason-lspconfig")
if not config_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = {
	"intelephense",
	"jsonls",
	"lua_ls",
	"psalm",
	"eslint",
	"dockerls",
	"gopls",
	"html",
	"pyright",
	"rust_analyzer",
	"tailwindcss",
	"zk",
	"prismals",
}

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end

mason.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lsp_config.setup({
	ensure_installed = servers,
})
