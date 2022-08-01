local buff_ok, bufferline = pcall(require, "bufferline")
if not buff_ok then
	return
end

bufferline.setup {
	options = {
		max_name_length = 30,
		max_prefix_length = 30,
		tab_size = 22,
		diagnostics = false,
		offsets = { { filetype = "NvimTree", text = "Files", padding = 1 } },
		separator_style = "thin",
		indicator_icon = '',

	}
}
