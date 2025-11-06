return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	main = "nvim-silicon",
	opts = {
		font = "Myna=18;SauceCodePro NFM=18",
		theme = "Monokai Extended",
		background = "#009eec",
		to_clipboard = true,
		window_title = function()
			return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
		end,
		line_offset = function(args)
			return args.line1
		end,
		language = function()
			local lang = nil
			if vim.bo.filetype == nil or vim.bo.filetype == "" then
				-- if we cannot determine the filetype supply no default argument
				lang = vim.fn.input("Language: ", "")
			else
				-- otherwise have the filetype as preset for most cases
				lang = vim.fn.input("Language: ", vim.bo.filetype)
			end

			if lang == "php" then
				-- use PHP Source instead of php so we don't have to start the snippet with <?php to have syntax
				lang = "PHP Source"
			end

			if lang and lang ~= "" then
				return lang
			else
				-- dialog was cancelled
				return "md"
			end
		end,
	},
}
