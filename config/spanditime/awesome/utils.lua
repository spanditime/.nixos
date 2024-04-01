local gears = require("gears")


local utils = {}
-- create custom shapes --
utils.cornerRadius = 10
function utils.roundedRectangle (cr, width, height)
    gears.shape.rounded_rect(cr, width, height, utils.cornerRadius)
end


function utils.interpolate_colors(first,second,fract)
	if fract > 1 then
		fract = 1
	elseif fract < 0 then
		fract = 0
	end
	local fr = tonumber(first:sub(2,3),16)
	local fg = tonumber(first:sub(4,5),16)
	local fb = tonumber(first:sub(6,7),16)

	local sr = tonumber(second:sub(2,3),16)
	local sg = tonumber(second:sub(4,5),16)
	local sb = tonumber(second:sub(6,7),16)

	local Or = math.floor((sr-fr)*fract+fr)
	local Og = math.floor((sg-fg)*fract+fg)
	local Ob = math.floor((sb-fb)*fract+fb)
	local output = string.format("#%02x%02x%02x",Or,Og,Ob)
	return output
end
return utils
