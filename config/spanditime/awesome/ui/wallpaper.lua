local beautiful = require 'beautiful'
local awful = require 'awful'

screen.connect_signal('request::wallpaper', function (s)
  awful.wallpaper { bg = beautiful.bg1, screen = s}
end)
