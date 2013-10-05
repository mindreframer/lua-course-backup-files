function counter(0):
  loadk r0, 0
  closure r1, anon
  return r1, 2  

function anon(0):
  .upvalue n, 1, 0
  getupval r0, 0
  add r0, r0, 1
  setupval r0, 0
  return r0, 2

function main(0):
  .upvalue _ENV, 1, 0
  closure r0, counter
  call r0, 1, 2
  gettabup r1, 0, "print"  
  move r2, r0
  call r2, 1, 2
  call r1, 2, 1
  move r2, r0
  call r2, 1, 2
  call r1, 2, 1
  move r2, r0
  call r2, 1, 2
  call r1, 2, 1
  move r2, r0
  call r2, 1, 2
  call r1, 2, 1
  move r2, r0
  call r2, 1, 2
  call r1, 2, 1
  move r2, r0
  call r2, 1, 2
  call r1, 2, 1
  move r2, r0
  call r2, 1, 2
  call r1, 2, 1
  move r2, r0
  call r2, 1, 2
  call r1, 2, 1
  return r0, 1
  
  
  
  
  
  
  