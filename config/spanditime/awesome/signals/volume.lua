local gears = require("gears")
local awful = require("awful")
local gfs = require("gears.filesystem")

local volume
local updates = false

if not volume then
	volume = {
		emit = function()
			if not updates then
				updates = true
				awful.spawn.easy_async_with_shell(
					gfs.get_configuration_dir() .. "scripts/getvolume.sh",
					function(stdout)
						local level     = stdout:sub(2)
						local level_int = tonumber(level)
						local muted     = stdout:sub(1,1) == "*"
						awesome.emit_signal('signal::volume', level_int, muted)
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
			volume.emit()
		end
	}
end
return volume
