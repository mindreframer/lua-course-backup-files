#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

static int inc(lua_State *L) {
  int n = lua_tointeger(L, lua_upvalueindex(1)) + 1;
  lua_pushinteger(L, n);
  lua_replace(L, lua_upvalueindex(1));
  lua_pushinteger(L, n);
  return 1;
}

static int dec(lua_State *L) {
  int n = lua_tointeger(L, lua_upvalueindex(1)) - 1;
  lua_pushinteger(L, n);
  lua_replace(L, lua_upvalueindex(1));
  lua_pushinteger(L, n);
  return 1;
}

static const struct luaL_Reg counterw[] = {
  { "inc", inc },
  { "dec", dec },
  { NULL, NULL }
};

__declspec(dllexport) int luaopen_counterw(lua_State *L) {
  lua_newtable(L); /* module table */
  lua_pushinteger(L, 0);
  luaL_setfuncs(L, counterw, 1);
  return 1;
} 





