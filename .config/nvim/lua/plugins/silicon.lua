return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	config = function()
		local silicon = require("nvim-silicon")

		-- Helper function to generate the config dynamically based on current mode
		local function get_silicon_config()
			local is_light = vim.o.background == "light"

			return {
				font = "Myna=18;SauceCodePro NFM=18",

				-- These evaluate strictly to strings right now, preventing the Funcref error
				theme = is_light and "Monokai Extended Light" or "Monokai Extended",
				background = is_light and "#e2e8f0" or "#009eec",

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
						lang = vim.fn.input("Language: ", "")
					else
						lang = vim.fn.input("Language: ", vim.bo.filetype)
					end

					if lang == "php" then
						lang = "PHP Source"
					end

					if lang and lang ~= "" then
						return lang
					else
						return "md"
					end
				end,
			}
		end

		-- 1. Run the initial setup when you first type `:Silicon`
		silicon.setup(get_silicon_config())

		-- 2. Watch for background switches mid-session and update Silicon silently
		vim.api.nvim_create_autocmd("OptionSet", {
			pattern = "background",
			callback = function()
				silicon.setup(get_silicon_config())
			end,
		})
	end,
}
