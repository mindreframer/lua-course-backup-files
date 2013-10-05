local mt = {}   -- shared metatable for complex numbers

local function new(r, i)
  return setmetatable({ real = r or 0, im = i or 0 }, mt)
end

local function is_complex(v)
  return getmetatable(v) == mt
end

local i = new(0, 1)

local function add(c1, c2)
  if not is_complex(c2) then
    return new(c1.real + c2, c1.im)
  elseif not is_complex(c1) then
    return new(c1 + c2.real, c2.im)
  else
    return new(c1.real + c2.real, c1.im + c2.im)
  end
end

mt.__add = add

local function tos(c)
  return tostring(c.real) .. "+" .. tostring(c.im) .. "i"
end

return { new = new, add = add, tostring = tos, i = i,
 is_complex = is_complex }
