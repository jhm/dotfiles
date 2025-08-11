local wezterm = require 'wezterm'

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Jellybeans'
-- config.color_scheme = 'Everblush (Gogh)'

-- config.font = wezterm.font 'Consolas'
-- config.font = wezterm.font 'Source Code Pro'
config.font = wezterm.font 'JetBrains Mono'
-- config.font = wezterm.font 'Fira Mono'
-- config.font = wezterm.font 'Monaspace Neon'
-- config.font = wezterm.font 'Iosevka'
-- config.font = wezterm.font 'Droid Sans Mono'
config.font_size = 14

-- Tabs
config.enable_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true
-- config.use_fancy_tab_bar = false

config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}

-- Similar to my tmux bindings
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
  {
    mods = "LEADER",
    key = "[" ,
    action = wezterm.action.ActivateCopyMode,
  },
  {
    mods = "LEADER",
    key = "c",
    action = wezterm.action.SpawnTab "CurrentPaneDomain",
  },
  {
    mods = "LEADER",
    key = "x",
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    mods = "LEADER",
    key = "v",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    mods = "LEADER",
    key = "s",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    mods = "LEADER",
    key = "p",
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    mods = "LEADER",
    key = "n",
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    mods = "LEADER",
    key = "h",
    action = wezterm.action.ActivatePaneDirection "Left",
  },
  {
    mods = "LEADER",
    key = "j",
    action = wezterm.action.ActivatePaneDirection "Down",
  },
  {
    mods = "LEADER",
    key = "k",
    action = wezterm.action.ActivatePaneDirection "Up",
  },
  {
    mods = "LEADER",
    key = "l",
    action = wezterm.action.ActivatePaneDirection "Right",
  },
  {
    mods = "LEADER",
    key = "H",
    action = wezterm.action.AdjustPaneSize {"Left", 5},
  },
  {
    mods = "LEADER",
    key = "J",
    action = wezterm.action.AdjustPaneSize {"Down", 5},
  },
  {
    mods = "LEADER",
    key = "K",
    action = wezterm.action.AdjustPaneSize {"Up", 5},
  },
  {
    mods = "LEADER",
    key = "L",
    action = wezterm.action.AdjustPaneSize {"Right", 5},
  },
  {
    mods = "LEADER",
    key = "b",
    action = wezterm.action.ShowTabNavigator,
  },
  {
    mods = "LEADER",
    key = "f",
    action = wezterm.action.ShowTabNavigator,
  },
}

for i = 1, 9 do
  table.insert(config.keys, {
    mods = "LEADER",
    key = tostring(i),
    action = wezterm.action.ActivateTab(i - 1),
  })
end

-- function tab_title(tab_info)
--   local title = tab_info.tab_title
--   if title and #title > 0 then
--     return title
--   end
--   return tab_info.active_pane.title
-- end

-- wezterm.on(
--   'format-tab-title',
--   function(tab, tabs, panes, config, hover, max_width)
--     local title = wezterm.truncate_right(tab_title(tab), max_width - 2)
--     if tab.is_active then 
--       return {
--         { Background = { Color = '#1F2430' } },
--         { Text = ' ' .. title .. ' ' },
--       }
--     end
--     return {
--         { Background = { Color = '#171B24' } },
--         { Text = ' ' .. title .. ' ' },
--     }
--   end
-- )

-- and finally, return the configuration to wezterm
return config
