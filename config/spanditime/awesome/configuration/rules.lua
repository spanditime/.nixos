local awful = require "awful"
local ruled = require "ruled"
local beautiful = require "beautiful"
local gears = require "gears"

ruled.client.connect_signal("request::rules", function()
	ruled.client.append_rule {
		id         = "global",
		rule       = { },
		properties = {
			focus     = awful.client.focus.filter,
			raise     = true,
			screen    = awful.screen.preferred,
			placement = awful.placement.no_overlap+awful.placement.no_offscreen
		}
	}

	ruled.client.append_rule {
		id = "floating",
		rule_any = {
			instance = {
				"DTA",  -- Firefox addon DownThemAll.
				"copyq",  -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin",  -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer"
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester",  -- xev.
				"Picture in Picture", -- Opera pip
			},
			role = {
				"AlarmWindow",  -- Thunderbird's calendar.
				"ConfigManager",  -- Thunderbird's about:config.
				"pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
			}
    	},
		properties = {
			floating = true
		}
	}

	ruled.client.append_rule {
		id = "Pip",
		rule_any = {
			name = {
				"Picture in Picture", -- Opera pip
			},
    	},
		properties = {
			floating = true,
		},
		callback = function (c)
			gears.timer.delayed_call(function()
				awful.placement.bottom_right(c, {
					honor_padding = true,
					honor_workarea = true,
					margins = { bottom = beautiful.useless_gap * 2, right = beautiful.useless_gap * 2}
				})
			end)
        end,
	}
	-- ruled.client.append_rule {
	-- 	id         = "titlebars",
	-- 	rule_any   = { type = { "normal", "dialog" } },
	-- 	properties = { titlebars_enabled = true }
	-- }
end)
