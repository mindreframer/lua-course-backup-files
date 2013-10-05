#include "bv.h"
#include "lua.h"
#include "lauxlib.h"

static int new(lua_State *L) {
  BitVector **ud;
  int n = luaL_checkinteger(L, 1);
  luaL_argcheck(L, n >= 1, 1, "length must be positive");
  ud = (BitVector**)lua_newuserdata(L, sizeof(BitVector*));
  *ud = bv_new(n);
  if(*ud == NULL)
    luaL_error(L, "bit vector library out of memory");
  luaL_getmetatable(L, "bv.mt");
  lua_setmetatable(L, -2);
  return 1;
}

static int set(lua_State *L) {
  BitVector *bv = *((BitVector**)luaL_checkudata(L, 1, "bv.mt"));
  int i = luaL_checkinteger(L, 2);
  int b = lua_toboolean(L, 3);
  int len = bv_getn(bv);
  luaL_argcheck(L, (i >= 0) && (i < len), 2,
     "out of bounds");
  bv_set(bv, i, b); /* call the library */
  return 0;  
}

static int get(lua_State *L) {
  BitVector *bv = *((BitVector**)luaL_checkudata(L, 1, "bv.mt"));
  int i = luaL_checkinteger(L, 2);
  int len = bv_getn(bv);
  luaL_argcheck(L, (i >= 0) && (i < len), 2,
     "out of bounds");
  lua_pushboolean(L, bv_get(bv, i)); /* call the library */
  return 1;  
}

static int len(lua_State *L) {
  BitVector *bv = *((BitVector**)luaL_checkudata(L, 1, "bv.mt"));
  lua_pushinteger(L, bv_getn(bv));
  return 1;  
}

static int gc(lua_State *L) {
  BitVector *bv = *((BitVector**)luaL_checkudata(L, 1, "bv.mt"));
  bv_free(bv);
  return 0;
}

static const struct luaL_Reg metabv[] = {
  { "__newindex", set },
  { "__index", get },
  { "__len", len },
  { "__gc", gc },
  { NULL, NULL }
};

static const struct luaL_Reg lbv[] = {
  { "new", new },
  { "set", set },
  { "get", get },
  { "len", len },
  { NULL, NULL }
};

__declspec(dllexport) int luaopen_bv(lua_State *L) {
  luaL_newlib(L, lbv); /* make table for module */
  /* make metatable bv.mt */
  luaL_newmetatable(L, "bv.mt");
  luaL_setfuncs(L, metabv, 0);
  lua_pop(L, 1); /* pop metatable, leaving module table */
  return 1;
} 
