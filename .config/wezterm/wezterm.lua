local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.font = wezterm.font({ family = "SauceCodePro NFM", weight = "Medium" })
config.font = wezterm.font_with_fallback({
	{ family = "Myna Nerd Font", weight = "Bold" },
	"SauceCodePro NFM",
	"Myna",
	"SF Pro Text",
})
config.font_size = 16
config.freetype_load_target = "HorizontalLcd"
config.cell_width = 1.1
-- config.color_scheme = "Monokai (terminal.sexy)" -- yeah, we do be sexy <3
--config.color_scheme = "MonokaiPro (Gogh)" -- also as good as the other one, can be replaceable
config.color_scheme = "Kanagawa Dragon (Gogh)"
config.use_fancy_tab_bar = true -- i mean, its not that fancy.
config.hide_tab_bar_if_only_one_tab = true -- dont hide the tab bar since we need it for window buttons
config.adjust_window_size_when_changing_font_size = false -- dont update window size when adjusting the font size
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE" -- merge window title bar with the tab bar so we save on space.

config.window_background_opacity = 0.99 -- the 8th grader inside me really wants a transparent bg but it is not practical :/

config.window_padding = {
	top = 60,
	right = 0,
	left = 0,
	bottom = 0,
}

return config
