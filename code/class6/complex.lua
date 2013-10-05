local mt = {}   -- shared metatable for complex numbers

local function new(r, i)
  if i ~= 0 then
    return setmetatable({ real = r or 0, im = i or 0 }, mt)
  else
    return r
  end
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

mt.__eq = function (c1, c2)
  -- no need to check with is_complex
  return (c1.real == c2.real) and (c1.im == c2.im)
end

function mt.__len(c)
  -- modulus of c
  return math.sqrt(c.real * c.real + c.im * c.im)
end

local function tos(c)
  return tostring(c.real) .. "+" .. tostring(c.im) .. "i"
end

mt.__tostring = tos

mt.__le = function (c1, c2)
  if not is_complex(c2) then
    return c1.real <= c2 and c1.im <= 0
  elseif not is_complex(c1) then
    return c1 <= c2.real and c2.im >= 0
  else
    return c1.real <= c2.real and c1.im <= c2.im
  end
end

mt.__lt = function (c1, c2)
  return c1 <= c2 and (not (c2 <= c1))
end

return { new = new, add = add, tostring = tos, i = i,
 is_complex = is_complex }

 
 
 
 