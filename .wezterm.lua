-- __        __       _
-- \ \      / /__ ___| |_ ___ _ __ _ __ ___
--  \ \ /\ / / _ \_  / __/ _ \ '__| '_ ` _ \
--   \ V  V /  __// /| ||  __/ |  | | | | | |
--    \_/\_/ \___/___|\__\___|_|  |_| |_| |_|

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"

config.default_prog = { "powershell.exe", "-NoLogo" }
-- wayland not supported yet
config.enable_wayland = false

config.default_cursor_style = "SteadyUnderline"

config.enable_tab_bar = false

config.window_background_opacity = 0.8

config.warn_about_missing_glyphs = false

config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 20,
}

config.automatically_reload_config = true

config.window_close_confirmation = "NeverPrompt"

config.font_size = 14

config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"Font Awesome 6 Brands",
	"Font Awesome 6 Brands",
	"Font Awesome 6 Free",
	"Font Awesome v4 Compatability",
	"Noto Color Emoji",
})

-- and finally, return the configuration to wezterm
return config
