local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")

local wifi


if not wifi then
	wifi = {
		emit = function()
			awful.spawn.easy_async_with_shell(
				gfs.get_configuration_dir() .. "scripts/getwifi.sh",
				function (stdout)
					awesome.emit_signal('signal::wifi',stdout)
				end)
		end,
	}
	gears.timer {
		timeout = 8,
		call_now = true,
		autostart = true,
		callback = function ()
			wifi.emit()
		end
	}
end
return wifi
