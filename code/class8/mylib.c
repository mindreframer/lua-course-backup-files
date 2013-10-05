#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

static int idiv(lua_State *L) {
  int a = luaL_checkinteger(L, 1);
  int b = luaL_checkinteger(L, 2);
  int q, r;
  q = a / b;
  r = a % b;
  lua_pushinteger(L, q);
  lua_pushinteger(L, r);
  return 2;
}

static int map(lua_State *L) {
  int i;
  luaL_checktype(L, 1, LUA_TFUNCTION);
  luaL_checktype(L, 2, LUA_TTABLE);
  lua_newtable(L);
  for(i = 1; i <= lua_rawlen(L, 2); i++) {
    lua_pushvalue(L, 1);
    lua_rawgeti(L, 2, i);
    lua_call(L, 1, 1);
    lua_rawseti(L, -2, i);	
  }
  return 1;
}

static int counter(lua_State *L) {
  int n = lua_tointeger(L, lua_upvalueindex(1));
  n = n + 1;
  lua_pushinteger(L, n);
  lua_replace(L, lua_upvalueindex(1));
  lua_pushinteger(L, n);
  return 1;
}

static const struct luaL_Reg mylib[] = {
  { "idiv", idiv },
  { "map", map },
  { NULL, NULL }
};

__declspec(dllexport) int luaopen_mylib(lua_State *L) {
  luaL_newlib(L, mylib);
  lua_pushinteger(L, 0);
  lua_pushcclosure(L, counter, 1);
  lua_setfield(L, -2, "counter");
  /*lua_newtable(L);
  lua_pushcfunction(L, idiv);
  lua_setfield(L, -2, "idiv");*/
  return 1;
} 


/* lua_pushlstring(L, s, 10); */


