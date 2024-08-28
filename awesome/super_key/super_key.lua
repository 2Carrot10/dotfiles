local naughty = require("naughty")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local smart_panel = require("smart_panel.smart_panel")

local launchbutton  = wibox.widget{
     --[[
		{
        image  = beautiful.awesome_icon,  -- Replace with your image path
        resize = true,  -- Resize the image to fit the container
        widget = wibox.widget.imagebox,
    },-- ]]--
		-- [[
	{
    text = "I'm a button!",
    widget = wibox.widget.textbox,
bg = '#4C566A',
		}, -- ]]--
		bg = '#4C566A',
    margins = 5,  -- Add margins around the image
    widget  = wibox.container.margin,
}


launchbutton:connect_signal("button::press", function(c, _, _, button)
    if button == 1 then naughty.notify{text = 'left'}--smart_panel.show_help(nil, awful.screen.focused())
		elseif button == 2 then naughty.notify{text = 'Wheel click'}
    elseif button == 3 then naughty.notify{text = 'Right click'}
    end
end)
return launchbutton
