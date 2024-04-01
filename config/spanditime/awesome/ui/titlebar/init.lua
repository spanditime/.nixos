local awful = require 'awful'
local wibox = require 'wibox'
local buttons = require("ui.titlebar.buttons")

client.connect_signal('request::titlebars', function (c)
	if c.requests_no_titlebar then
    	return
	end

    local titlebar = awful.titlebar(c, {
        position = 'left',
        size = 24,
    })

    local titlebars_buttons = {
        awful.button({}, 1, function ()
            c:activate {
                context = 'titlebar',
                action = 'mouse_move',
            }
        end),
        awful.button({}, 3, function ()
            c:activate {
                context = 'titlebar',
                action = 'mouse_resize',
            }
        end)
    }

    local buttons_loader = {
        layout = wibox.layout.fixed.vertical,
        buttons = titlebars_buttons,
    }

    titlebar:setup {
        {
            buttons.close(c),
            buttons.maximize(c),
            buttons.minimize(c),
            layout = wibox.layout.fixed.vertical,
        },
        buttons_loader,
        buttons_loader,
        layout = wibox.layout.align.vertical,
    }
end)
