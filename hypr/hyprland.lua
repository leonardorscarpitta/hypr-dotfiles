local c = {
    ink     = "141318",
    mantle  = "0f0e12",
    surface = "1e1c23",
    overlay = "46414f",
    text    = "e9e2d4",
    gold    = "d6aa5c",
    gold2   = "f1d08f",
    clay    = "cf6a52",
    teal    = "73a7a3",
}

hl.monitor({ output = "DP-1", mode = "2560x1080@99.94", position = "0x0", scale = 1, supports_wide_color = -1, supports_hdr = -1 })

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

local terminal    = "kitty"
local fileManager = "kitty -e yazi"
local menu        = "rofi -show drun"
local scripts     = "~/.config/hypr/scripts/"

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprctl setcursor Kintsugi-Cursor 24")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset -i")
    hl.exec_cmd("mako")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

hl.env("XCURSOR_THEME", "Kintsugi-Cursor")
hl.env("XCURSOR_SIZE", "24")
hl.env("XDG_DATA_DIRS", os.getenv("HOME") .. "/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("GDK_BACKEND", "wayland,x11,*")

hl.config({
    general = {
        gaps_in     = 6,
        gaps_out    = 14,
        border_size = 2,
        col = {
            active_border   = "rgba(" .. c.gold .. "ff)",
            inactive_border = "rgba(" .. c.overlay .. "88)",
        },
        resize_on_border = true,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = 12,
        rounding_power = 2.4,

        active_opacity   = 1.0,
        inactive_opacity = 0.94,

        shadow = {
            enabled      = true,
            range        = 18,
            render_power = 3,
            color        = 0x99000000,
        },

        blur = {
            enabled  = true,
            size     = 6,
            passes   = 3,
            vibrancy = 0.18,
        },
    },

    animations = { enabled = true },

    dwindle = { preserve_split = true },
    master  = { new_status = "master" },

    cursor = {
        enable_hyprcursor = false,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
        background_color        = 0xff0f0e12,
    },

    input = {
        kb_layout    = "us",
        kb_variant   = "intl",
        follow_mouse = 1,
        sensitivity  = 0,
        touchpad     = { natural_scroll = true },
    },
})

hl.curve("pour",   { type = "bezier", points = { {0.22, 1},    {0.36, 1} } })
hl.curve("settle", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0},       {1, 1}    } })
hl.curve("soft",   { type = "spring", mass = 1, stiffness = 210, damping = 23 })

hl.animation({ leaf = "global",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border",      enabled = true, speed = 6,  bezier = "pour" })
hl.animation({ leaf = "borderangle", enabled = false })
hl.animation({ leaf = "windows",     enabled = true, speed = 5,  spring = "soft" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 4,  spring = "soft",   style = "popin 90%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 1.6, bezier = "linear", style = "popin 90%" })
hl.animation({ leaf = "fade",        enabled = true, speed = 3,  bezier = "pour" })

hl.animation({ leaf = "layersIn",      enabled = true, speed = 2.2, bezier = "pour",   style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.8, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 2.2, bezier = "pour" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.8, bezier = "linear" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 4,  bezier = "settle", style = "slidefade 12%" })

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

local mod = "SUPER"

hl.bind(mod .. " + Return",      hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + C",           hl.dsp.window.close())
hl.bind(mod .. " + E",           hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + D",           hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + V",           hl.dsp.exec_cmd(scripts .. "clipboard.sh"))
hl.bind(mod .. " + Escape",      hl.dsp.exec_cmd(scripts .. "powermenu.sh"))
hl.bind(mod .. " + L",           hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mod .. " + F",           hl.dsp.window.fullscreen())
hl.bind(mod .. " + SHIFT + F",   hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mod .. " + T",           hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + P",           hl.dsp.window.pseudo())
hl.bind(mod .. " + J",           hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + Q",           hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mod .. " + SHIFT + R",   hl.dsp.exec_cmd("killall waybar; waybar"))
hl.bind(mod .. " + SHIFT + M",   hl.dsp.exit())

hl.bind(mod .. " + SHIFT + S",   hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))
hl.bind("Print",                 hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))
hl.bind("SHIFT + Print",         hl.dsp.exec_cmd("hyprshot -m output -o ~/Pictures/Screenshots"))
hl.bind(mod .. " + Print",       hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots"))

local dirs = { left = "left", right = "right", up = "up", down = "down", h = "left", l = "right", k = "up", j = "down" }
for key, dir in pairs(dirs) do
    if key ~= "l" and key ~= "j" then
        hl.bind(mod .. " + " .. key,          hl.dsp.focus({ direction = dir }))
    end
    hl.bind(mod .. " + SHIFT + " .. key,      hl.dsp.window.swap({ direction = dir }))
end

hl.bind(mod .. " + CTRL + right", hl.dsp.exec_cmd(scripts .. "resize.sh right"), { repeating = true })
hl.bind(mod .. " + CTRL + left", hl.dsp.exec_cmd(scripts .. "resize.sh left"), { repeating = true })
hl.bind(mod .. " + CTRL + down", hl.dsp.exec_cmd(scripts .. "resize.sh down"), { repeating = true })
hl.bind(mod .. " + CTRL + up",   hl.dsp.exec_cmd(scripts .. "resize.sh up"), { repeating = true })

for i = 1, 10 do
    local key = i % 10
    hl.bind(mod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + S",         hl.dsp.workspace.toggle_special("scratch"))
hl.bind(mod .. " + ALT + S",   hl.dsp.window.move({ workspace = "special:scratch" }))
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("swayosd-client --output-volume raise"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("swayosd-client --output-volume lower"),   { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"),  { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("swayosd-client --brightness raise"),      { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"),      { locked = true, repeating = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

hl.window_rule({ name = "suppress-maximize", match = { class = ".*" }, suppress_event = "maximize" })

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
    no_focus = true,
})

hl.window_rule({
    name   = "floating-utilities",
    match  = { class = "^(org.pulseaudio.pavucontrol|nm-connection-editor|nwg-look|qt6ct|blueman-manager)$" },
    float  = true,
    size   = "900 600",
    center = true,
})

hl.window_rule({

    name   = "picture-in-picture",
    match  = { title = "^([Pp]icture[- ]in[- ][Pp]icture)$" },
    float  = true,
    pin    = true,
    size   = "480 270",
    move   = "monitor_w-500 monitor_h-290",
    keep_aspect_ratio = true,
    no_initial_focus  = true,
})

hl.window_rule({

    name   = "file-chooser",
    match  = { class = "^(xdg-desktop-portal-gtk)$" },
    float  = true,
    size   = "1100 680",
    center = true,
})

hl.window_rule({
    name   = "mpv-float",
    match  = { class = "^(mpv)$" },
    float  = true,
    center = true,
    keep_aspect_ratio = true,
})

hl.window_rule({ name = "kitty-glass", match = { class = "^(kitty)$" }, opacity = "0.92 0.86" })

hl.layer_rule({ name = "blur-waybar", match = { namespace = "^waybar$" },        blur = true, ignore_alpha = 0.2 })
hl.layer_rule({ name = "blur-rofi",   match = { namespace = "^rofi$" },          blur = true, ignore_alpha = 0.2 })
hl.layer_rule({ name = "blur-mako",   match = { namespace = "^notifications$" }, blur = true, ignore_alpha = 0.2 })
hl.layer_rule({ name = "blur-osd",    match = { namespace = "^swayosd$" },       blur = true, ignore_alpha = 0.2 })
