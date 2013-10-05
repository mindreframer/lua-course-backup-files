local Shape = require "shape"
-- class Circle : Shape
local Circle = setmetatable({}, Shape)
Circle.__index = Circle

function Circle:new(x, y, radius)
  -- c = super(x, y)
  local c = Shape.new(self, x, y)
  c.radius = radius
  return c
end

function Circle:area()
  return math.pi * self.radius * self.radius
end

function Circle:tostring()
  -- super() + ", radius: " + this.radius
  return Shape.tostring(self) .. ", radius: " ..
    tostring(self.radius)
end

return Circle






