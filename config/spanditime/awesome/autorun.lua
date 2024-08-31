local awful = require("awful")

-- AUTORUN
-- This function will run once every time Awesome is started
autorun = {


	-- xidlehook - xautolock alternative - still some issues - screen black out even when audio 
	-- doesnt actually catches lock signals (loginctl lock-sessions does nothing)
	-- "xidlehook --not-when-fullscreen --not-when-audio --timer 30 'light -O; light -S 10' 'light -I' --timer 90 'light -I; " .. locker_cmd .. "' ''  --timer 3600 'systemctl suspend' ''",

	"xautolock -time 10 -locker slock -nowlocker slock",
	"playerctld daemon",

	-- "kmonad /home/spanditime/.config/kmonad/qwerty_ext.kbd",
}

for _,v in pairs(autorun) do
	awful.util.spawn(v)
end
