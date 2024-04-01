local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")


local function get_taglist(s)
    return awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        layout = {
            layout = wibox.layout.fixed.horizontal,
            spacing = 0,
        },
        style = {
            shape = gears.shape.circle,
        },
        buttons = {
            awful.button({}, 1, function (t)
                t:view_only()
            end),
            awful.button({}, 4, function (t)
                awful.tag.viewprev(t.screen)
            end),
            awful.button({}, 5, function (t)
                awful.tag.viewnext(t.screen)
            end)
        },
        widget_template = {
			{
				{
					halign = "center",
					id = "text_role",
					widget = wibox.widget.textbox,
				},
				forced_height = 28,
				forced_width = 28,
				shape_clip = true,
				id = 'background_role',
				widget = wibox.container.background,
				shape = gears.shape.circle,
			},
			bottom = 4,
			top = 4,
			left = 2,
			right = 2,
			widget = wibox.container.margin
        },
    }
end

return get_taglist
