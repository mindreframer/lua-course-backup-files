
local function printa(arr)
  print("{" .. table.concat(arr, ", ") .. "}")
end

return { print = printa }
