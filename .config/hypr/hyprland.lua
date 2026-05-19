-- Converted from hyprland.conf for Hyprland 0.55+ Lua config.
-- See https://wiki.hypr.land/Configuring/Start/

------------------
---- MONITORS ----
------------------

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "auto",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local fileManager = "kitty ranger"
local emacsClient = "emacsclient -c"
local menu = "wofi --show drun"
local browser = "firefox"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
  hl.exec_cmd(terminal)
  hl.exec_cmd(emacsClient)
  hl.exec_cmd(browser)
  hl.exec_cmd("Telegram")
  hl.exec_cmd("discord")
  hl.exec_cmd("slack")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("hyprsunset")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("waybar")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 20,
    border_size = 2,
    col = {
      active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },
    resize_on_border = false,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding = 10,
    rounding_power = 2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true,
  },

  master = {
    new_status = "master",
  },

  misc = {
    force_default_wallpaper = -1,
    disable_hyprland_logo = false,
  },
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout = "jp,us,us,rs",
    kb_variant = ",,dvp,",
    kb_model = "",
    kb_options = "grp:win_space_toggle,compose:ralt",
    kb_rules = "",
    follow_mouse = 1,
    sensitivity = -0.5,
    touchpad = {
      natural_scroll = false,
    },
  },
})

hl.device({
  name = "pfu-limited--hhkb-professional-jp",
  kb_options = "grp:win_space_toggle,compose:ralt",
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(emacsClient))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
  name = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
  no_focus = true,
})

hl.window_rule({
  name = "messaging-workspace",
  match = { class = "^(org.telegram.desktop|discord|Slack)$" },
  workspace = "1",
})

hl.window_rule({
  name = "terminal-workspace",
  match = { class = "^(kitty)$" },
  workspace = "2",
})

hl.window_rule({
  name = "emacs-workspace",
  match = { class = "^(emacs)$" },
  workspace = "3",
})

hl.window_rule({
  name = "browser-workspace",
  match = { class = "^(firefox)$" },
  workspace = "4",
})

hl.window_rule({
  name = "finity-mascot",
  match = { class = "com-group_finity-mascot-Main" },
  float = true,
  no_blur = true,
  no_focus = true,
  no_shadow = true,
  decorate = false,
})
