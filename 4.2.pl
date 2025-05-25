seqR(zero, nil).
seqR(s(N), cons(N, Rest)) :-
    seqR(N, Rest).