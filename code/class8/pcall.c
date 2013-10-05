#include <stdio.h>
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

static void dump_stack(lua_State *L) {
  int i;
  int top = lua_gettop(L);
  printf("|");
  for(i = 1; i <= top; i++) {
    int t = lua_type(L, i);
	switch(t) {
	  case LUA_TSTRING:
	    printf("'%s'", lua_tostring(L, i));
		break;
	  case LUA_TBOOLEAN:
	    printf(lua_toboolean(L, i) ? "true" : "false");
		break;
	  case LUA_TNUMBER:
	    printf("%g", lua_tonumber(L, i));
		break;
	  default:
	    printf("%s", lua_typename(L, t));
		break;
	}
	printf(" ");
  }
  printf("|\n");
}

int main (void) {
  char buff[256]; int error;
  lua_State *L = luaL_newstate();   /* opens Lua */
  luaL_openlibs(L);                 
  lua_getglobal(L, "print");
  lua_pushinteger(L, 5);
  lua_pushstring(L, "hello");
  lua_newtable(L);
  dump_stack(L);
  lua_pcall(L, 3, 0, 0);
  dump_stack(L);
  lua_getglobal(L, "pairs");
  lua_newtable(L);
  dump_stack(L);
  lua_pcall(L, 1, 0, 0);
  dump_stack(L);
  lua_getglobal(L, "pairs");
  lua_newtable(L);
  dump_stack(L);
  lua_pcall(L, 1, 1, 0);
  lua_pop(L, 1);
  dump_stack(L);
  lua_getglobal(L, "pairs");
  lua_newtable(L);
  dump_stack(L);
  lua_pcall(L, 1, LUA_MULTRET, 0);
  lua_pop(L, 3);
  dump_stack(L);
  lua_getglobal(L, "pairs");
  lua_newtable(L);
  dump_stack(L);
  lua_pcall(L, 1, 10, 0);
  dump_stack(L);
  lua_close(L);
  return 0;
}




