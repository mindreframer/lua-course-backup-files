local Shape = require "shape"
-- class Point : Shape
local Point = setmetatable({}, Shape)
Point.__index = Point

function Point:area()
  return 0
end

return Point