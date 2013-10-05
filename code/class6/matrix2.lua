local function set(mt, i, j, x)
  mt[(i-1) * mt.columns + j] = x
end

local function get(mt, i, j)
  return mt[(i-1) * mt.columns + j]
end

local function printm(mt)
  for i = 1, mt.lines do
    for j = 1, mt.columns do
	  io.write(get(mt, i, j), "\t")
	end
    io.write("\n")
  end
end

local function new(lines, columns)
  local mt = { lines = lines, columns = columns }
  for i = 1, lines do -- line
    for j = 1, columns do -- column
      set(mt, i, j, 0)
	end
  end
  return mt
end

return { new = new, get = get, put = put, print = printm }
