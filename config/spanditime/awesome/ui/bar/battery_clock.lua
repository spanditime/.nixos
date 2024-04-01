local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local utils = require("utils")

local mytextclock

local battery_progress_bar

local container_clock_widget

local update_battery_bar = function(charge, power)
	if power then
		battery_progress_bar.color = beautiful.bggreen
	else
		battery_progress_bar.color = utils.interpolate_colors(beautiful.fgred,beautiful.bgred,charge/100.0)
	end
	battery_progress_bar.value = charge
end

if not container_clock_widget then
	mytextclock = wibox.widget.textclock()

	battery_progress_bar = wibox.widget{
		shape = gears.shape.rounded_bar,
		bar_shape = gears.shape.rounded_bar,
		background_color = beautiful.bg3,
		color = beautiful.bgred,
		max_value = 100,
		value = 100,
		forced_width = 10,
		border_width = 0,
		border_color = beautiful.bg3,
		widget = wibox.widget.progressbar,
	}
	container_clock_widget = {
		{
			{
				battery_progress_bar,
				{
					mytextclock,
					left = 10,
					right = 10,
					widget = wibox.container.margin
				},
				widget = wibox.layout.stack,
			},
			left = 8,
			right = 8,
			top = 4,
			bottom = 4,
			halign = "center",
			align = "center",
			widget = wibox.container.margin,
		},
		layout = wibox.layout.fixed.horizontal,
	},

	awesome.connect_signal("signal::battery", function(value,power)
		update_battery_bar(value,power)
	end)
end

return container_clock_widget
