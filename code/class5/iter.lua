local M = {}

function M.fromto(f, t)  -- iterator maker
  return function () -- iterator
           if f > t then
		     return nil
		   else
		     local x = f
			 f = f + 1
			 return x
		   end
         end
end

function M.sfromto(from, to)  -- stateless iterator maker
  local function sfromto_iter(state, seed)
    -- state is the end of our sequence
    -- seed the previous point in the sequence
    if seed >= state then
      return nil -- no more items!
    else
      return seed + 1
    end
  end
  return sfromto_iter, to, from-1
end

function M.ssfromto(from, to)  -- seedless iterator maker
  return function (state) -- iterator
           if state.from > state.to then
		     return nil
		   else
		     local x = state.from
			 state.from = state.from + 1
			 return x
		   end
         end, { from = from, to = to }
end

function M.values(t)
  local i = 0
  return function ()
           i = i + 1
		   return t[i]
		 end
end

-- cannot have stateless version of values!
-- this is the seedless version:
function M.ssvalues(t)
  return function (state)
           state.index = state.index + 1
		   return state.array[state.index]
		 end, { array = t, index = 0 }
end

return M
