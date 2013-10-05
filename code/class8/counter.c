#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

static int inc(lua_State *L) {
  int n;
  lua_getfield(L, lua_upvalueindex(1), "n");
  n = lua_tointeger(L, -1) + 1;
  lua_pushinteger(L, n);
  lua_setfield(L, lua_upvalueindex(1), "n");
  lua_pushinteger(L, n);
  return 1;
}

static int dec(lua_State *L) {
  int n;
  lua_getfield(L, lua_upvalueindex(1), "n");
  n = lua_tointeger(L, -1) - 1;
  lua_pushinteger(L, n);
  lua_setfield(L, lua_upvalueindex(1), "n");
  lua_pushinteger(L, n);
  return 1;
}

static const struct luaL_Reg counter[] = {
  { "inc", inc },
  { "dec", dec },
  { NULL, NULL }
};

__declspec(dllexport) int luaopen_counter(lua_State *L) {
  lua_newtable(L); /* module table */
  lua_newtable(L); /* shared table */
  lua_pushinteger(L, 0);
  lua_setfield(L, -2, "n");
  luaL_setfuncs(L, counter, 1);
  return 1;
} 





