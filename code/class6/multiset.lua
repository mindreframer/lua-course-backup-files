local function insert(set, elem)
  local count = set[elem] or 0
  set[elem] = count + 1
end

local function remove(set, elem)
  local count = set[elem] or 1
  count = count - 1
  if count == 0 then
    set[elem] = nil 
  else
    set[elem] = count
  end
end

local function exists(set, elem)
  return not not set[elem]
end

local function mprint(set)
  io.write("{")
  for elem, count in pairs(set) do
    for i = 1, count do
       io.write(tostring(elem), ", ")
	end
  end
  io.write("}\n")
end

return { insert = insert, remove = remove, exists = exists, print = mprint }
