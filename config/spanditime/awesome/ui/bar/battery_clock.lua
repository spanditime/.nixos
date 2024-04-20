local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local utils = require("utils")

local mytextclock

local battery_progress_bar

local container_clock_widget

local update_battery_bar = function(charge, power)
	local display_value = 100.0
	if charge then
		display_value = charge
	end
	if power then
		battery_progress_bar.color = beautiful.cyan
	else
		battery_progress_bar.color = utils.interpolate_colors(beautiful.orange,beautiful.red,display_value/100.0)
	end
	battery_progress_bar.value = display_value
end

if not container_clock_widget then
	mytextclock = wibox.widget.textclock()
  mytextclock:setup {
    fg = beautiful.bg1
  }

	battery_progress_bar = wibox.widget{
		shape = gears.shape.rounded_bar,
		bar_shape = gears.shape.rounded_bar,
		bg = beautiful.fg2,
		color = beautiful.green,
		max_value = 100,
		value = 100,
		forced_width = 10,
		border_width = 0,
		border_color = beautiful.fg2,
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
