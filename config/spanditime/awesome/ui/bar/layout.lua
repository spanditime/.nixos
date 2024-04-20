local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require('beautiful');

local function setup(s)
  local mylayoutbox = awful.widget.layoutbox(s)
  local layout_icon_widget = {
    {
      mylayoutbox,
      fg = beautiful.fg1,
      widget = wibox.widget.background,
    },
    left = 10,
    widget = wibox.container.margin
  }
  mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end)
  ))
  return layout_icon_widget
end
return setup
