local name = ...

local modules = {
  notexists = {
    hello = function () print("hello!") end
  },
  foo = {
    x = 5,
	y = 2
  }
}

return modules[name]