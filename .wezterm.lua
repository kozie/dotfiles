local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Load the theme
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').moon
config.colors = theme.colors()

config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.font = wezterm.font("FantasqueSansM Nerd Font Mono")
config.font_size = 13

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

return config
