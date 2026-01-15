local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- fonts.
-- config.font = wezterm.font({ family = "SauceCodePro NFM", weight = "Medium" })
config.font = wezterm.font_with_fallback({
	{ family = "Myna Nerd Font", weight = "Bold" },
	"SauceCodePro NFM",
	"Myna",
	"SF Pro Text",
})
config.font_size = 16
config.freetype_load_target = "HorizontalLcd"
-- this makes it very close to how native font rendering works on macos with ghostty
config.cell_width = 1.1

-- theme option.
-- config.color_scheme = "Monokai (terminal.sexy)" -- yeah, we do be sexy <3
--config.color_scheme = "MonokaiPro (Gogh)" -- also as good as the other one, can be replaceable
config.color_scheme = "Kanagawa Dragon (Gogh)"

-- i mean, its not that fancy.
config.use_fancy_tab_bar = true

-- dont hide the tab bar since we need it for window buttons
config.hide_tab_bar_if_only_one_tab = true

-- dont update window size when adjusting the font size
config.adjust_window_size_when_changing_font_size = false

-- merge window title bar with the tab bar so we save on space.
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- the 8th grader inside me really wants a transparent bg but it is not practical :/
config.window_background_opacity = 0.99
-- set padding from top especially so we have some nice layout
config.window_padding = {
	top = 60,
	right = 0,
	left = 0,
	bottom = 0,
}

-- don't bother asking when we quit.
config.config.window_close_confirmation = "NeverPrompt"

return config
