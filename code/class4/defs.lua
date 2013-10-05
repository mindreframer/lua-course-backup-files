function maxmin(a, b)
  if a < b then
    return b, a
  else
    return a, b
  end
end

function id(...)
  return ...
end

function dummy1(...)
  local a, b = ...
  return maxmin(a, b)
end

function dummy2(...)
  return maxmin(...)
end

function drop1(...)
  local _, a, b = ...
  return maxmin(a, b)
end

function printf(fmt, ...)
  io.write(string.format(fmt, ...))
end

function range(a, b, c)
  if a > b then
    return
  else
    return a, range(a+c, b, c)
  end
end

--[[
function print_array(arr)
  io.write("{")
  if arr[1] ~= nil then
    io.write(" ", tostring(arr[1]))
    for i = 2, #arr do
      io.write(", ", tostring(arr[i]))
    end
  end
  io.write(" }\n");
end
--]]

function print_array(arr)
  print("{" .. table.concat(arr, ", ") .. "}")
end

function stack_push(stack, elem)
  stack[#stack+1] = elem
end

function stack_pop(stack)
  local elem = stack[#stack]
  stack[#stack] = nil
  return elem
end

function stack_empty(stack)
  return #stack == 0
end

function queue_insert(queue, elem)
  queue[#queue+1] = elem
end

function queue_remove(queue)
  local elem = queue[1]
  table.remove(queue, 1)
  return elem
end

function queue_empty(queue)
  return #queue == 0
end

local buf = {}

function outbuf(x)
  buf[#buf+1] = tostring(x)
end

function getbuf()
  return table.concat(buf)
end

function sum(arr)
  local sum = 0
  for i, x in ipairs(arr) do
    print("adding element " .. tostring(i))
	sum = sum + x
  end
  return sum
end

function sum2(arr)
  local sum = 0
  for _, x in ipairs(arr) do
	sum = sum + x
  end
  return sum
end

function matrix2_set(mt, i, j, x)
  mt[(i-1) * mt.columns + j] = x
end

function matrix2_get(mt, i, j)
  return mt[(i-1) * mt.columns + j]
end

function matrix2_print(mt)
  for i = 1, mt.lines do
    for j = 1, mt.columns do
	  io.write(matrix2_get(mt, i, j), "\t")
	end
    io.write("\n")
  end
end

function matrix2(lines, columns)
  local mt = { lines = lines, columns = columns }
  for i = 1, lines do -- line
    for j = 1, columns do -- column
      matrix2_set(mt, i, j, 0)
	end
  end
  return mt
end

function set_insert(set, elem)
  set[elem] = true
end

function set_remove(set, elem)
  set[elem] = nil
end

function set_exists(set, elem)
  return not not set[elem]
end

function multiset_insert(set, elem)
  local count = set[elem] or 0
  set[elem] = count + 1
end

function multiset_remove(set, elem)
  local count = set[elem] or 1
  count = count - 1
  if count == 0 then
    set[elem] = nil 
  else
    set[elem] = count
  end
end

function multiset_exists(set, elem)
  return not not set[elem]
end

function multiset_print(set)
  io.write("{")
  for elem, count in pairs(set) do
    for i = 1, count do
       io.write(tostring(elem), ", ")
	end
  end
  io.write("}\n")
end

myprint = function (...)
  local args = table.pack(...)
  for i = 1, args.n do
    io.write(tostring(args[i]), "\t")
  end
  io.write("\n")
end

-- rename{ new = "new.txt", old = "old.txt" }
function rename(args)
  os.rename(args.old, args.new)
end

-- f is a function of number to number
-- dx is an optional delta
function derivative(f, dx)
  dx = dx or 1e-6
  return function (x)
           return (f(x+dx) - f(x)) / dx
		 end
end

function counter()
  local n = 0
  return function ()
           n = n + 1
		   return n
		 end,
		 function ()
		   n = n - 1
		   return n
		 end
end

function map(f, l)
  local nl = {}
  for i = 1, #l do
    nl[i] = f(l[i])
  end
  return nl
end

--[[
function cmap(f)
  return function (l)
           local nl = {}
           for i = 1, #l do
             nl[i] = f(l[i])
           end
           return nl
		 end
end
--]]

function curry1(f)
  return function (a)
           return function (...)
		            return f(a, ...)
		          end
         end
end

cmap = curry1(map)

function filter(p, l)
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
function foldl(seed, op, l)
  for _, elem in ipairs(l) do
    seed = op(seed, elem)
  end
  return seed
end

-- Sequence:
-- e1 e2 e3 e4 e5 e6
-- right fold with op and seed:
-- (e1 op (e2 op (e3 op (e4 op (e5 op (e6 op seed))))))
function foldr(seed, op, l)
  for i = #l, 1, -1 do
    seed = op(l[i], seed)
  end
  return seed
end

function func(a, b, c)
  b = b or 0
  c = c or 0
  return a + b + c
end

function named(f, names)
  return function (args)
           local l = map(function (name)
		                   return args[name]
    					 end, names)
           return f(table.unpack(l, 1, #names))
         end
end

nfunc = named(func, { "a", "b", "c" })

function fromto(f, t)  -- iterator maker
  return function () -- iterator
           if f > t then
		     return nil
		   else
		     local x = f
			 f = f + 1
			 return x
		   end
         end
end

function sfromto(from, to)  -- stateless iterator maker
  local function sfromto_iter(state, seed)
    -- state is the end of our sequence
    -- seed the previous point in the sequence
    if seed >= state then
      return nil -- no more items!
    else
      return seed + 1
    end
  end
  return sfromto_iter, to, from-1
end

function ssfromto(from, to)  -- seedless iterator maker
  return function (state) -- iterator
           if state.from > state.to then
		     return nil
		   else
		     local x = state.from
			 state.from = state.from + 1
			 return x
		   end
         end, { from = from, to = to }
end

function values(t)
  local i = 0
  return function ()
           i = i + 1
		   return t[i]
		 end
end

-- cannot have stateless version of values!
-- this is the seedless version:
function ssvalues(t)
  return function (state)
           state.index = state.index + 1
		   return state.array[state.index]
		 end, { array = t, index = 0 }
end

















