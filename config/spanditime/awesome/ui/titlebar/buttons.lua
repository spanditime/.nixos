local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local buttons = {}

function buttons.default(c,fallback)
	return wibox.widget {
		buttons = {
			awful.button({}, 1, function() fallback(c) end),
		},
		shape = gears.shape.circle,
		forced_height = 16,
		bg = beautiful.bg3,
		widget = wibox.container.background,
	}
end

function buttons.close(c)
	local btn = buttons.default(c,function ()
		c:kill()
	end)
	btn.bg = beautiful.fgred
	return {
		btn,
		margins = 4,
		widget = wibox.container.margin,
	}
end

function buttons.maximize(c)
	local btn = buttons.default(c,function ()
		c.maximized = not c.maximized
		c:raise()
	end)
	btn.bg = beautiful.bgred
	return {
		btn,
		margins = 4,
		widget = wibox.container.margin,
	}
end

function buttons.minimize(c)
	local btn = buttons.default(c,function ()
		c.minimized = true
	end)
	btn.bg = beautiful.fggreen
	return {
		btn,
		margins = 4,
		widget = wibox.container.margin,
	}
end

return buttons




