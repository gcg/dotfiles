local silicon_ok, silicon = pcall(require, "silicon")

if not silicon_ok then
	return
end

silicon.setup({
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
})
