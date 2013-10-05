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

function myprint(...)
  local args = table.pack(...)
  for i = 1, args.n do
    io.write(tostring(args[i]), "\t")
  end
  io.write("\n")
end

function rename(args)
  os.rename(args.old, args.new)
end







