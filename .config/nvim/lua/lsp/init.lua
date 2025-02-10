local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end
-- vim.lsp.set_log_level("debug")
require("lsp.mason")
require("lsp.handlers").setup()
require("lsp.null-ls")
