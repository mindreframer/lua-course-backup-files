#include <limits.h>
#include "bv.h"

#define BITS_PER_WORD (CHAR_BIT*sizeof(unsigned int))
#define I_WORD(i)     ((unsigned int)(i) / BITS_PER_WORD)
#define I_BIT(i)      (1 << ((unsigned int)(i) % BITS_PER_WORD))

struct BitVector {
  int size;
  unsigned int values[1];
};

int bv_bytes(int n) {
  return sizeof(BitVector) + I_WORD(n-1)*sizeof(unsigned int);
}

void bv_set(BitVector *bv, int i, int b) {
  if(b)
    bv->values[I_WORD(i)] |= I_BIT(i);
  else
    bv->values[I_WORD(i)] &= ~I_BIT(i);
}

void bv_clear(BitVector *bv) {
  int i;
  for(i = 0; i < I_WORD(bv->size); i++)
    bv->values[i] = 0;
}

int bv_get(BitVector *bv, int i) {
  return bv->values[I_WORD(i)] & I_BIT(i);
}

int bv_getn(BitVector *bv) {
  return bv->size;
}

void bv_setn(BitVector *bv, int n) {
  bv->size = n;
}
