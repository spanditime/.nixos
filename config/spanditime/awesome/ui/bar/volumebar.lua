local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local volumebar
local volumebar_indicator
local container_volumebar_widget

local update_volumebar

if not container_volumebar_widget then
	volumebar = wibox.widget{
		border_width=5,
		color = beautiful.s3,
		border_color = beautiful.bg2,
		max_value = 100,
		value = 40,
		forced_width = 20,
		widget = wibox.container.radialprogressbar,
	}

	volumebar_indicator = wibox.widget {
		volumebar,
		bg = beautiful.bgred,
		shape = gears.shape.circle,
		widget = wibox.container.background,
	}
	container_volumebar_widget = wibox.widget{
		{
			volumebar_indicator,
			margins = 4,
			widget = wibox.container.margin,
		},
		reflection = {horizontal = true},
		widget = wibox.container.mirror
	}

	update_volumebar = function (value,muted)
		if muted then
			volumebar_indicator.bg = beautiful.bg1
		else
			volumebar_indicator.bg = beautiful.s3
		end
		volumebar.value = value
	end

	awesome.connect_signal("signal::volume", function(value,muted)
		update_volumebar(value,muted)
	end)
end
return container_volumebar_widget
