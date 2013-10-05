local c = (function ()
             local n = 0
             return function ()
                      n = n + 1
                      return n
                    end
           end)()

local print = print
           
print(c())
print(c())
print(c())
print(c())
print(c())
print(c())
