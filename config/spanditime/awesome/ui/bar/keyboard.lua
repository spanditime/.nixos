local awful = require("awful")
local utils = require("utils")
local wibox = require("wibox")
local beautiful = require("beautiful")

local mykeyboardlayout
local container_kbl_widget

if not container_kbl_widget then
	mykeyboardlayout = awful.widget.keyboardlayout()
	container_kbl_widget = {
		{
			{
				{
					{
						widget = mykeyboardlayout,
					},
					left = 6,
					right = 6,
					top = 0,
					bottom = 0,
					widget = wibox.container.margin,
				},
				shape = utils.roundedRectangle,
				fg = beautiful.fg1,
				bg = beautiful.bg3,
				widget = wibox.container.background
			},
			top = 4,
			bottom = 4,
			halign = "center",
			widget = wibox.container.margin,
		},
		spacing = 2,
		layout = wibox.layout.fixed.horizontal,
	}
end
return container_kbl_widget
