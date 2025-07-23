local util = require("lspconfig.util")
return {
	root_dir = util.root_pattern("psalm.xml"),
	cmd = { "psalm", "--language-server" },
	filetypes = { "php" },
}
