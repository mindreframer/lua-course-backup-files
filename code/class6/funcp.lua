local function map(f, l)
  local nl = {}
  for i = 1, #l do
    nl[i] = f(l[i])
  end
  return nl
end

local function curry1(f)
  return function (a)
           return function (...)
		            return f(a, ...)
		          end
         end
end

local function filter(p, l)
  local nl = {}
  for _, elem in ipairs(l) do
    if p(elem) then
	  nl[#nl+1] = elem
    end	  
  end
  return nl
end

-- Sequence:
-- e1 e2 e3 e4 e5 e6
-- left fold with op and seed:
-- ((((((seed op e1) op e2) op e3) op e4) op e5) op e6)
local function foldl(seed, op, l)
  for _, elem in ipairs(l) do
    seed = op(seed, elem)
  end
  return seed
end

-- Sequence:
-- e1 e2 e3 e4 e5 e6
-- right fold with op and seed:
-- (e1 op (e2 op (e3 op (e4 op (e5 op (e6 op seed))))))
local function foldr(seed, op, l)
  for i = #l, 1, -1 do
    seed = op(l[i], seed)
  end
  return seed
end

function named(f, names)
  return function (args)
           local l = map(function (name)
		                   return args[name]
    					 end, names)
           return f(table.unpack(l, 1, #names))
         end
end

return { map = map, cmap = curry1(map), filter = filter, 
         foldr = foldr, foldl = foldl, named = named }
