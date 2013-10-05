function fact(n)
  n = n or 100
  if n < 2 then
    return 1
  else
	return n * fact(n - 1)
  end
end

function max(a, b)
  -- in C/Java: (a < b) ? b : a
  return a < b and b or a
end

--[[
print("hello")
--]]
utf8 = "你好"

