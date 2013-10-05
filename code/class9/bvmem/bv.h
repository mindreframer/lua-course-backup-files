typedef struct BitVector BitVector;

BitVector *bv_new(int n);
void       bv_free  (BitVector *bv);
void       bv_set   (BitVector *bv, int i, int b);
void       bv_clear (BitVector *bv);
int        bv_get   (BitVector *bv, int i);
/* gets length of bit vector, so users can do bounds checking */
int        bv_getn  (BitVector *bv);
