
local buf = {}

local function out(x)
  buf[#buf+1] = tostring(x)
end

local function get()
  return table.concat(buf)
end

return { out = out, get = get }
