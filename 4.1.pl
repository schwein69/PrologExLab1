seq(zero , _ , nil).
seq(s(N), E , cons(E,T)):- seq (N ,E ,T).