local wezterm = require("wezterm")
return {
	color_scheme = "Violet Light",
	font = wezterm.font("HackGenNerd Console", {weight="Regular", stretch="Normal", itaric=false}),
  pane_focus_follows_mouse = false,
  keys = {
    -- This will create a new split and run the `top` program inside it
    {key="LeftArrow", mods="CTRL|SHIFT|ALT", action=wezterm.action.SplitPane{
      direction="Left",
      command={args={"zsh"}},
      size={Percent=50},
    }},
    {key="RightArrow", mods="CTRL|SHIFT|ALT", action=wezterm.action.SplitPane{
      direction="Right",
      command={args={"zsh"}},
      size={Percent=50},
    }},
    {key="DownArrow", mods="CTRL|SHIFT|ALT", action=wezterm.action.SplitPane{
      direction="Down",
      command={args={"zsh"}},
      size={Percent=50},
    }},
    {key="UpArrow", mods="CTRL|SHIFT|ALT", action=wezterm.action.SplitPane{
      direction="Up",
      command={args={"zsh"}},
      size={Percent=50},
    }},


  },
  default_prog = {"zsh"},


}
