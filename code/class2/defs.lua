--[[
int fact(int n) {
  if (n < 2)
    return 1;
  else
    return n * fact(n-1);
}
]]

local max = 10

local fact 
fact = function (n)
  n = n or 100
  if n < 2 then
    return 1
  else
	return n * fact(n - 1)
  end
end
--[[
local function fact(n) ... end
--]]

f5 = fact(5)

function max(a, b)
  -- in C/Java: (a < b) ? b : a
  return a < b and b or a
end
--[[
This is the same thing as
max = function (a, b)
         return a < b and b or a
      end		 
--]]
m32 = max(3, 2)

--[[
print("hello")
--]]
utf8 = "你 '好'"
utf8s = '你 "好"'

function isbool(x)
  return (not not x) == x
end

function toboolean(x)
  return not not x
end

local print = print

y = 5
local x, y, z = 3, 4, 5
print((x * x + y * y) == z * z) 

do
  local sum = 0
  for i = 1, 5 do
    local z = 2*i-1
    sum = sum + z
    print("z in the loop = " .. tostring(z))
  end
  print(sum, z)
end

local sum = 100
print(sum)

function maxmin(a, b)
  if a < b then
    return b, a
  else
    return a, b
  end
end










