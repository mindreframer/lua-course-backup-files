local mt = {}

-- pt is the proxy table
function mt.__index(pt, key)
  pt.__READS = pt.__READS + 1
  return pt.__TABLE[key]
end

function mt.__newindex(pt, key, val)
  pt.__WRITES = pt.__WRITES + 1
  pt.__TABLE[key] = val
  -- proxy table is kept empty
end

local function track(t)
  return setmetatable({ __READS = 0, __WRITES = 0,
    __TABLE = t }, mt)
end

return { track = track }




