-- the Square class
local Square = { color = "blue" }
Square.__index = Square

-- Square:new(...) makes a new square
function Square:new(x, y, side)
  -- self is the Square class
  return setmetatable({ x = x, y = y, side = side },
    self)
end

-- s1:move(5, 10)
function Square:move(dx, dy)
  -- self is a Square object
  self.x = self.x + dx
  self.y = self.y + dy
  return self
end

function Square:area()
  return self.side * self.side
end

return Square



