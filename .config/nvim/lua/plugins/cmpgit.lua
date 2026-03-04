return {
	"petertriho/cmp-git",
	dependencies = { "hrsh7th/nvim-cmp" },
	opts = {
		filetypes = { "gitcommit", "octo", "NeogitCommitMessage", "markdown", "lua" },
	},
	init = function()
		table.insert(require("cmp").get_config().sources, { name = "git" })
	end,
}
