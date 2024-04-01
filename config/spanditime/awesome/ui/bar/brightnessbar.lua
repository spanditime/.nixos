local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local brbar
local brbar_indicator
local container_brbar_widget

local update_brbar

if not brbar then
	brbar = wibox.widget{
		border_width=5,
		color = beautiful.s3,
		border_color = beautiful.bg2,
		max_value = 100,
		value = 40,
		forced_width = 20,
		widget = wibox.container.radialprogressbar,
	}
	brbar_indicator = wibox.widget {
		brbar,
		bg = beautiful.s3,
		shape = gears.shape.circle,
		widget = wibox.container.background,
	}
	container_brbar_widget = {
		brbar_indicator,
		margins = 4,
		widget = wibox.container.margin,
	}
	update_brbar = function (value)
		brbar.value = value
	end

	awesome.connect_signal("signal::brightness", function(value)
		update_brbar(value)
	end)
end
return container_brbar_widget
