local Shape = {}
Shape.__index = Shape

function Shape:new(x, y)
  return setmetatable({ x = x, y = y }, self)
end

function Shape:move(dx, dy)
  self.x = self.x + dx
  self.y = self.y + dy
  return self
end

function Shape:tostring()
  return "x: " .. tostring(self.x) .. 
         ", y: " .. tostring(self.y) .. ", area: " ..
         tostring(self:area())		 
end

return Shape