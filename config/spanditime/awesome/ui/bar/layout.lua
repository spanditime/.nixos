local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local function setup(s)
	local mylayoutbox = awful.widget.layoutbox(s)
	local layout_icon_widget = {
		mylayoutbox,
		left = 10,
		widget = wibox.container.margin
	}
	mylayoutbox:buttons(gears.table.join(
						   awful.button({ }, 1, function () awful.layout.inc( 1) end),
						   awful.button({ }, 3, function () awful.layout.inc(-1) end)
	))
	return layout_icon_widget
end
return setup
