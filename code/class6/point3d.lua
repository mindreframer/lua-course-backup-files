local Point = require "point"
local Point3D = setmetatable({}, Point)
Point3D.__index = Point3D

function Point3D:new(x, y, z)
  local p = Point.new(self, x, y)
  p.z = z
  return p
end

function Point3D:move(dx, dy, dz)
  Point.move(self, dx, dy)
  self.z = self.z + dz
  return self
end

function Point3D:tostring()
  return Point.tostring(self) .. ", z: " .. tostring(self.z)
end

return Point3D






