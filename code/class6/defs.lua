function reload(m)
  package.loaded[m] = nil
  return require(m)
end

function maxmin(a, b)
  if a < b then
    return b, a
  else
    return a, b
  end
end

function printf(fmt, ...)
  io.write(string.format(fmt, ...))
end

function idiv1(a, b)
  if b == 0 then
    return nil, "division by zero"
  else
    return math.floor(a/b)
  end
end

function idiv2(a, b)
  if b == 0 then
    error("division by zero", 2) -- shift blame to caller
  else
    return math.floor(a/b)
  end
end

function instanceof(obj, class)
  local mt = getmetatable(obj)
  if mt ~= class then
    if mt ~= nil then
      return instanceof(mt, class)
	else
	  return false
	end
  end
  return true
end














