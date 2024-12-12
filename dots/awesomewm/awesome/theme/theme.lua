local theme_assets = require("beautiful.theme_assets")
local naughty = require("naughty")
local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local cr = require("lgi").cairo
local dpi   = require("beautiful.xresources").apply_dpi
local hotkeys_popup = require("awful.hotkeys_popup")
local launchbutton = require("super_key.super_key")
require("awful.hotkeys_popup.keys")

local os = os

local theme                                     = {}

local separators = lain.util.separators
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/theme"
theme.wallpaper                                 = theme.dir .. "/forestWall.jpg"
theme.font                                      = "JetBrains Mono 11"--"Terminus 9"
-- foreground is just text
theme.fg_normal                                 = "#FFFFFF"
theme.fg_focus                                  = "#FFFFFF"
theme.fg_urgent                                 = "#09090a"

theme.bg_normal                                 = "#1a1b26"--"#202129"
theme.bg_focus                                  = "#09090a"
theme.bg_urgent                                 = "#f7768e"
theme.accent									= "#7aa2f7"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#484755"
theme.border_focus                              = "#b1bcd7"
theme.border_marked                             = "#CC9393"
theme.tasklist_bg_focus                         = "#1A1A1A"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(5)
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
theme.awesome_icon = theme.dir .. "/icons/awesome_logo.png"
theme.gap_single_client = true

local keyboardlayout = awful.widget.keyboardlayout:new()

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
	"date +'%y-%m-%d %R'", 60,
	function(widget, stdout)
		widget:set_markup(" " .. markup.font(theme.font, stdout))
	end
)
--[[
local clock = awful.widget.watch(
		"acpi", 60,
		function(widget, stdout)
				widget:set_markup(" " .. markup.font(theme.font, stdout))
		end
)
]]-- power_time_left

-- Calendar


local separator =  wibox.widget {
	orientation = 'vertical',
	forced_height = dpi(10),
	forced_width = dpi(30),
	span_ratio = 0.55,
	widget = wibox.widget.separator
}

--[[
theme.cal = lain.widget.cal({
		attach_to = { clock },
		notification_preset = {
				font = "Terminus 10",
				fg   = theme.fg_normal,
				bg   = theme.bg_normal
		}
})
]]--

-- Mail IMAP check
local mailicon = wibox.widget.imagebox(theme.widget_mail)

--[[
-- MPD
local musicplr = awful.util.terminal .. " -title Music -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(my_table.join(
		awful.button({ "Mod4" }, 1, function () awful.spawn(musicplr) end),
		awful.button({ }, 1, function ()
				os.execute("mpc prev")
				theme.mpd.update()
		end),
		awful.button({ }, 2, function ()
				os.execute("mpc toggle")
				theme.mpd.update()
		end),
		awful.button({ }, 3, function ()
				os.execute("mpc next")
				theme.mpd.update()
		end)))
theme.mpd = lain.widget.mpd({
		settings = function()
				if mpd_now.state == "play" then
						artist = " " .. mpd_now.artist .. " "
						title  = mpd_now.title  .. " "
						mpdicon:set_image(theme.widget_music_on)
				elseif mpd_now.state == "pause" then
						artist = " mpd "
						title  = "paused "
				else
						artist = ""
						title  = ""
						mpdicon:set_image(theme.widget_music)
				end

				widget:set_markup(markup.font(theme.font, markup("#EA6F81", artist) .. title))
		end
})

]]--
-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
	settings = function()
		widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
	end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
	settings = function()
		widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
	end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
	settings = function()
		widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
	end
})

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
	settings = function()
		if bat_now.status and bat_now.status ~= "N/A" then
			if bat_now.ac_status == 1 then
				baticon:set_image(theme.widget_ac)
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
				baticon:set_image(theme.widget_battery_empty)
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
				baticon:set_image(theme.widget_battery_low)
			else
				baticon:set_image(theme.widget_battery)
			end
			widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
		else
			widget:set_markup(markup.font(theme.font, " AC "))
			baticon:set_image(theme.widget_ac)
		end
	end
})

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
	settings = function()
		if volume_now.status == "off" then
			volicon:set_image(theme.widget_vol_mute)
		elseif tonumber(volume_now.level) == 0 then
			volicon:set_image(theme.widget_vol_no)
		elseif tonumber(volume_now.level) <= 50 then
			volicon:set_image(theme.widget_vol_low)
		else
			volicon:set_image(theme.widget_vol)
		end

		widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
	end
})
theme.volume.widget:buttons(awful.util.table.join(
	awful.button({}, 4, function ()
		awful.util.spawn("amixer set Master 1%+")
		theme.volume.update()
	end),
	awful.button({}, 5, function ()
		awful.util.spawn("amixer set Master 1%-")
		theme.volume.update()
	end)
))

-- Net
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
	settings = function()
		widget:set_markup(markup.font(theme.font,
			markup("#7AC82E", " " .. string.format("%06.1f", net_now.received))
			.. " " ..
			markup("#46A8C3", " " .. string.format("%06.1f", net_now.sent) .. " ")))
	end
})

function theme.at_screen_connect(s)
	myawesomemenu = {
		{ "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
		{ "manual", Terminal .. " -e man awesome" },
		{ "edit config", Editor_cmd .. " " .. awesome.conffile },
		{ "restart", awesome.restart },
		{ "quit", function() awesome.quit() end },
	}

	mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
		{ "open terminal", Terminal }
	}
	})

	editconfig = {
		{ "edit config", Editor_cmd .. " " .. awesome.conffile }
	}


	mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
		menu=mymainmenu--command = function() os.execute("kitty -e htop") end

	}
	)


	s.wibox =  awful.popup {

		-- One of the following will be used depending on popup and wibar
		position = "bottom",
		placement = function(c)
        awful.placement.bottom(c, { margins = { bottom = dpi(3)} })
    end,

		ontop = true,
		width = 200,
		border_width = 1,
		border_color = theme.border_focus,--theme.bg_normal,
		visible = true,
		type = 'dock',
		screen = s,
		minimum_height = 50,
		maximum_height = 50,

		shape = gears.shape.rectangle,
		bg = beautiful.normal,
widget = wibox.container.margin(
		 wibox.widget {
baticon, bat.widget, --[[launcher]]--
			separator, mytaglist, separator, clock,
			layout  = wibox.layout.fixed.horizontal,
		}
, 10, 10, 10, 10)
	}
-- Work in progress sysinfo widget
--[[
s.sysinfo = awful.wibox {

		border_width = 1,
		width = 200,

		border_color = theme.border_focus,
		position = "left",
 placement = function(c)
        awful.placement.left(c, { margins = { left = dpi(3)} })
    end,
		widget = wibox.container.margin( wibox.widget{
			clock,
			wibox.widget {
    date = os.date('*t'), -- Set the current date
    font = theme.font, -- Set the font directly here
    widget = wibox.widget.calendar.month
},
			layout  = wibox.layout.fixed.vertical
		}, 10, 10, 10, 10),
		 ontop = true
	}
	]]--

end

--s.mytasklist, -- Middle widget
--[[
				{ -- Right widgets
						layout = wibox.layout.fixed.horizontal,
						wibox.widget.systray(),
						keyboardlayout,
						--spr,
						--arrl_ld,
						--wibox.container.background(mpdicon, theme.bg_focus),
						--wibox.container.background(theme.mpd.widget, theme.bg_focus),
						--arrl_dl,
						volicon,
						power_time_left,
						theme.volume.widget,
						--arrl_ld,
						--wibox.container.background(mailicon, theme.bg_focus),
						--wibox.container.background(theme.mail.widget, theme.bg_focus),
						--arrl_dl,
						memicon,
						mem.widget,
						--arrl_ld,
						wibox.container.background(cpuicon, theme.bg_focus),
						wibox.container.background(cpu.widget, theme.bg_focus),
						--arrl_dl,
						tempicon,
						temp.widget,
						--arrl_ld,
						--wibox.container.background(fsicon, theme.bg_focus),
						--wibox.container.background(theme.fs.widget, theme.bg_focus),
						--arrl_dl,
						baticon,
						bat.widget,
						--arrl_ld,
						wibox.container.background(neticon, theme.bg_focus),
						wibox.container.background(net.widget, theme.bg_focus),
						--arrl_dl,
						clockicon,
						clock,
						spr,
						--arrl_ld,
						wibox.container.background(s.mylayoutbox, theme.bg_focus),
				},
	--]]


--[[
function theme.at_screen_connect(s)
		-- Quake application
		s.quake = lain.util.quake({ app = awful.util.terminal })

		-- If wallpaper is a function, call it with the screen
		local wallpaper = theme.wallpaper
		if type(wallpaper) == "function" then
				wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)

		-- Tags
		awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

		-- Create a promptbox for each screen
		s.mypromptbox = awful.widget.prompt()
		-- Create an imagebox widget which will contains an icon indicating which layout we're using.
		-- We need one layoutbox per screen.
		s.mylayoutbox = awful.widget.layoutbox(s)
		s.mylayoutbox:buttons(my_table.join(
													 awful.button({}, 1, function () awful.layout.inc( 1) end),
													 awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
													 awful.button({}, 3, function () awful.layout.inc(-1) end),
													 awful.button({}, 4, function () awful.layout.inc( 1) end),
													 awful.button({}, 5, function () awful.layout.inc(-1) end)))
		-- Create a taglist widget
		s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

		-- Create a tasklist widget
		s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

		-- Create the wibox
		s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(18), bg = theme.bg_normal, fg = theme.fg_normal })

		-- Add widgets to the wibox
		s.mywibox:setup {
				layout = wibox.layout.align.horizontal,
				{ -- Left widgets
						layout = wibox.layout.fixed.horizontal,
						--spr,
						s.mytaglist,
						s.mypromptbox,
						--spr,
				},
				s.mytasklist, -- Middle widget
				{ -- Right widgets
						layout = wibox.layout.fixed.horizontal,
						wibox.widget.systray(),
						--keyboardlayout,
						--spr,
						--arrl_ld,
						--wibox.container.background(mpdicon, theme.bg_focus),
						wibox.container.background(theme.mpd.widget, theme.bg_focus),
						--arrl_dl,
						--volicon,
						theme.volume.widget,
						--arrl_ld,
						--wibox.container.background(mailicon, theme.bg_focus),
						--wibox.container.background(theme.mail.widget, theme.bg_focus),
						--arrl_dl,
						--memicon,
						--mem.widget,
						--arrl_ld,
						--wibox.container.background(cpuicon, theme.bg_focus),
						--wibox.container.background(cpu.widget, theme.bg_focus),
						--arrl_dl,
						--tempicon,
						--temp.widget,
						--arrl_ld,
						--wibox.container.background(fsicon, theme.bg_focus),
						--wibox.container.background(theme.fs.widget, theme.bg_focus),
						--arrl_dl,
						--baticon,
						--bat.widget,
						--arrl_ld,
						--wibox.container.background(neticon, theme.bg_focus),
						--wibox.container.background(net.widget, theme.bg_focus),
						--arrl_dl,
						--clock,
						--spr,
						--arrl_ld,
						wibox.container.background(s.mylayoutbox, theme.bg_focus),
				},
		}
end
]]--

return theme
