local utils = require("utils")

client.connect_signal("request::manage", function(c)
	c.shape = utils.roundedRectangle
end)
