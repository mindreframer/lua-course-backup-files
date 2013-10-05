typedef struct BitVector BitVector;

int  bv_bytes (int n); /* bytes needed for a bitvector of n elements */
void bv_set   (BitVector *bv, int i, int b);
void bv_clear (BitVector *bv);
int  bv_get   (BitVector *bv, int i);
/* sets and gets length of bit vector, so users can do bounds checking */
void bv_setn  (BitVector *bv, int n);
int  bv_getn  (BitVector *bv);
