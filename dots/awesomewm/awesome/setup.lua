pcall(require, "luarocks.loader")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local naughty = require("naughty")
local ruled = require("ruled")
local menubar = require("menubar")
local fancytaglist = require("fancy-taglist")
require("awful.hotkeys_popup.keys")
local lain = require("lain")

naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({ "urxvtd", "unclutter -root" })

Terminal = "wezterm"
Browser = "firefox"
Editor = os.getenv("EDITOR") or "nvim"
Editor_cmd = Terminal .. " -e " .. Editor

modkey = "Mod4"
altkey = "Mod1"

menubar.utils.Terminal = Terminal

tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.corner.nw,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.spiral,
      --[[ 
				awful.layout.suit.floating,
        awful.layout.suit.tile.left,
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.fair,
        awful.layout.suit.tile.top,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
        awful.layout.suit.magnifier,
				]]--
    })
end)

lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = 2
lain.layout.cascade.tile.offset_y      = 32
lain.layout.cascade.tile.extra_padding = 5
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2

mykeyboardlayout = awful.widget.keyboardlayout()

screen.connect_signal("request::desktop_decoration", function(s)

    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

	myTextLayout = wibox.widget{
			markup = "This <i>is</i> a <b>" .. awful.layout.getname (awful.layout.get(s)) .. "</b>!!!",
			halign = "center",
			valign = "center",
			widget = wibox.widget.textbox
	}

    s.mypromptbox = awful.widget.prompt()

    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }

		mytaglist = fancytaglist.new{}
	s.mytaglist = mytaglist
end)

awful.mouse.append_global_mousebindings(
	{
	--[[
    awful.button({ }, 3, function () wibox {
    width = 200,
    height = 50,
    ontop = true,
    visible = true,
    bg = beautiful.bg_normal,
    widget = fancytaglist
}
 end),
 ]]
		--awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),
})
ruled.client.connect_signal("request::rules", function()
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }

    -- Floating clients.
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class    = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
            },
            name    = {
                "Event Tester",  -- xev.
            },
            role    = {
                "AlarmWindow",    -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    }

    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
        id         = "titlebars",
        rule_any   = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = true      }
    }

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- ruled.client.append_rule {
    --     rule       = { class = "Firefox"     },
    --     properties = { screen = 1, tag = "2" }
    -- }
end)

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
ruled.notification.append_rule {
        rule       = { urgency = "critical" },
        properties = { bg = "#ff0000", fg = "#ffffff", timeout = 0 }
    }

    -- Or green background for normal ones.
    ruled.notification.append_rule {
        rule       = { urgency = "normal" },
        properties = { bg      = "#00ff00", fg = "#000000"}
    }


    ruled.notification.append_rule {
        rule       = { urgency = "low" },
        properties = { bg      = "#0000ff", fg = "#000000"}
    }
	--[[
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
	]]--
end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)
