
local M = {}

function M.insert(queue, elem)
  queue[#queue+1] = elem
end

function M.remove(queue)
  local elem = queue[1]
  table.remove(queue, 1)
  return elem
end

function M.empty(queue)
  return #queue == 0
end

return M