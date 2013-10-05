local function insert(set, elem)
  set[elem] = true
end

local function remove(set, elem)
  set[elem] = nil
end

local function exists(set, elem)
  return not not set[elem]
end

return { insert = insert, remove = remove, exists = exists }
