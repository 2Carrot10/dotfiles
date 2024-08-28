local beautiful = require("beautiful")
local awful = require("awful")
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))
require("rcTemp")
require("keymaps")
--local logout_popup = require("theme.layout")

os.execute(string.format("feh --bg-fill %s", beautiful.wallpaper))
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)


--[[
require("layout")
require("system-control")
require("system-info")
require("system-tray")
require("notifications")
]]--

--[[
screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
        screen = s,
        widget = {
            {
                image     = beautiful.wallpaper,
                upscale   = true,
                downscale = true,
                widget    = wibox.widget.imagebox,
            },
            valign = "center",
            halign = "center",
       --     tiled  = false,
            widget = wibox.container.tile,
        }
    }
end)

]]--

