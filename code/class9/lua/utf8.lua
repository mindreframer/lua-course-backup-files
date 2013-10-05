function 提出反()
  local n = 0
  return function ()
           n = n + 1
           return n
         end
end

计数器 = 提出反()
print(计数器())   -- 1
print(计数器())   -- 2
print(计数器())   -- 3
