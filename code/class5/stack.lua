
local function push(stack, elem)
  stack[#stack+1] = elem
end

local function pop(stack)
  local elem = stack[#stack]
  stack[#stack] = nil
  return elem
end

local function empty(stack)
  return #stack == 0
end

return { push = push, pop = pop, empty = empty }

