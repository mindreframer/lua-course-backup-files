#include <stdio.h>
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

int main (void) {
  char buff[256]; int error;
  lua_State *L = luaL_newstate();   /* opens Lua */
  luaL_openlibs(L);                 /* opens standard libraries */
  lua_pushcfunction(L, idiv);
  lua_setglobal(L, "idiv");
  printf("> ");
  while (fgets(buff, sizeof(buff), stdin) != NULL) {
    error = luaL_loadstring(L, buff) || lua_pcall(L, 0, 0, 0);
    if (error) {
	  /* -1 is the top of the stack */
      fprintf(stderr, "%s\n", lua_tostring(L, -1));
      lua_pop(L, 1);  /* pop error message from the stack */
    }
    printf("> ");
  }
  lua_close(L);
  return 0;
}
