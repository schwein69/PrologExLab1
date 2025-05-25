%not (B, Res)
not(b_true,b_false).
not(b_false,b_true).

%and

and(b_true,X,X).
and(b_false,X,b_false).

or(A,B,O):-
	not(A,NA),
	not(B,NB),
	and(NA,NB,NAB),
	not(NAB,O).
