#include <stdio.h>
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

int main (void) {
  char buff[256]; int error;
  lua_State *L = luaL_newstate();   /* opens Lua */
  luaL_openlibs(L);                 /* opens standard libraries */
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
