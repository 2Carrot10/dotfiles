local beautiful = require("beautiful")
local awful = require("awful")
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))
require("setup")
require("keymaps")

os.execute(string.format("feh --bg-fill %s", beautiful.wallpaper))
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)
