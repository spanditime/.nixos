local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local utils = require("utils")



local text_bl_icon
local text_wifi_icon
local text_pwr_icon

local container_bl_widget
local container_wifi_widget

local container_pws_menu_widget

local update_wifi_color


if not container_pws_menu_widget then
  local fg = beautiful.bg1
	text_wifi_icon = wibox.widget{
		font = beautiful.font,
		widget=wibox.widget.textbox,
		text = "󰖩",
	}
	text_bl_icon = wibox.widget{
		font = beautiful.font,
		widget=wibox.widget.textbox,
		text = "󰂯 ",
	}
	text_pwr_icon = wibox.widget{
    fg = fg,
		font = beautiful.font,
		widget=wibox.widget.textbox,
		text = "⏼",
	}
	container_wifi_widget=wibox.widget{
		text_wifi_icon,
		widget=wibox.container.background,
		fg = fg,
	}
	container_bl_widget=wibox.widget{
		text_bl_icon,
		widget=wibox.container.background,
    fg = fg,
	}
	update_wifi_color = function(status)
		if status == "" then
			container_wifi_widget.fg = beautiful.red
			text_wifi_icon.text = "󰖪 "
		else
			container_wifi_widget.fg = beautiful.cyan
			text_wifi_icon.text = "󰖩 "
		end
	end
	container_pws_menu_widget = wibox.widget {
		{
			{
				{
					{
						container_bl_widget,
						container_wifi_widget,
						text_pwr_icon,
						widget = wibox.layout.fixed.horizontal,
						spacing = 5
					},
					left = 6,
					right = 6,
					top = 0,
					bottom = 0,
					widget = wibox.container.margin,
				},
				shape = utils.roundedRectangle,
				fg = fg,
				bg = beautiful.s3,
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
	container_pws_menu_widget:buttons(gears.table.join(
		awful.button({}, 1, function()
		end)
	))
	awesome.connect_signal("signal::wifi", function(wifi)
		update_wifi_color(wifi)
	end)
end

return container_pws_menu_widget
