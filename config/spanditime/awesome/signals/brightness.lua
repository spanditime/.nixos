local gears = require("gears")
local awful = require("awful")

local brightness
local updates = false

if not brightness then
	brightness = {
		emit = function()
			if not updates then
				updates = true
				awful.spawn.easy_async_with_shell(
					"light",
					function(stdout)
						local level_int = tonumber(stdout)
						awesome.emit_signal('signal::brightness', level_int)
						updates = false
					end)
			end
		end,
	}
	gears.timer {
		timeout   = 100,
		call_now  = true,
		autostart = true,
		callback  = function()
			brightness.emit()
		end
	}
end
return brightness
