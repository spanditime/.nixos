local gears = require("gears")
local awful = require("awful")
local gfs = require("gears.filesystem")

local battery

if not battery then
	battery = {
		emit = function()
			awful.spawn.easy_async_with_shell(
				gfs.get_configuration_dir() .. "scripts/getbat.sh",
				function(stdout)
					local level     = stdout:sub(2)
					local level_int = tonumber(level)
					local power     = stdout:sub(1,1) == "*"
					awesome.emit_signal('signal::battery', level_int, power)
				end)
		end,
	}
	gears.timer {
		timeout   = 8,
		call_now  = true,
		autostart = true,
		callback  = function()
			battery.emit()
		end
	}
end
return battery
