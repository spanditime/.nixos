local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

screen.connect_signal('request::desktop_decoration', function (s)
    awful.tag({ "1", "2", "3", "4", "5"}, s, awful.layout.layouts[1])

    s.w_prompt = awful.widget.prompt()
    s.w_taglist = require("ui.bar.taglist")(s)
	s.w_layout = require("ui.bar.layout")(s)

    s.mywibox = awful.wibar({ position = "top", screen = s })
    s.mywibox:setup {
		layout = wibox.layout.ratio.horizontal,
    bg = beautiful.bg1,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			s.w_taglist,
			s.w_prompt,
		},
		{
			{ widget = wibox.container.margin },
			-- Center widgets
			{
				require("ui.bar.volumebar"),
				require("ui.bar.battery_clock"),
				require("ui.bar.brightnessbar"),
				layout = wibox.layout.fixed.horizontal,
			},
			{ widget = wibox.container.margin },
			expand = "outside",
			layout = wibox.layout.align.horizontal,
		},
		{
			layout = wibox.layout.align.horizontal,
			{ widget = wibox.container.margin },
			{ widget = wibox.container.margin },
			{ -- Right widgets
				layout = wibox.layout.fixed.horizontal,
        require("ui.bar.systray"),
				require("ui.bar.keyboard"),
				require("ui.bar.pwr_indicators"),
				s.w_layout,
				spacing = 5,
			},
		}
    }

end)
