local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font({ family = "SauceCodePro NF", weight = "Medium" })
config.font_size = 14
config.color_scheme = "Monokai (terminal.sexy)" -- yeah, we do be sexy <3
--config.color_scheme = "MonokaiPro (Gogh)" -- also as good as the other one, can be replaceable

config.use_fancy_tab_bar = true -- i mean, its not that fancy.
config.hide_tab_bar_if_only_one_tab = false -- dont hide the tab bar since we need it for window buttons
config.adjust_window_size_when_changing_font_size = false -- dont update window size when adjusting the font size
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE" -- merge window title bar with the tab bar so we save on space.

return config
