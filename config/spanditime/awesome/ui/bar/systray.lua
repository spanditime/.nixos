local wibox = require("wibox")
local beautiful = require("beautiful")
local utils = require("utils")

local systray

if not systray then
  systray = {
    {
      wibox.widget.systray(),
      shape = utils.roundedRectangle,
      bg = beautiful.s3,
      widget = wibox.container.background
    },
    top = 4,
    bottom = 4,
    halign = "center",
    widget = wibox.container.margin,
  }
end

return systray
