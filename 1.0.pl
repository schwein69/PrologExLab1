succ(N, s(N)).
sum(A, z, A).
sum(A, s(B), s(C)) :- sum(A,B,C). 
prod(A, z, z).
prod(A, s(B), Res) :- prod(A,B,C), sum(A, C, Res).
fact(z, s(z)).
fact(s(A), Res) :- fact(A, Res), prod(Res, (A), Res2). 