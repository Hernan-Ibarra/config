local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
  automatically_reload_config = true,
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  default_cursor_style = "BlinkingBlock",
  color_scheme = "Gruvbox Dark (Gogh)",
  font_size = 30,
  font = wezterm.font("JetBrains Mono"),
  font_rules = {
    {
      intensity = "Bold",
      italic = false,
      font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal", style = "Normal" }),
    },
    {
      intensity = "Bold",
      italic = true,
      font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal", style = "Italic" }),
    },
  },
  send_composed_key_when_left_alt_is_pressed = true,
  send_composed_key_when_right_alt_is_pressed = true,
  max_fps = 120,
}

return config
