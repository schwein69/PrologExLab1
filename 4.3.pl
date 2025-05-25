seqR2(N, List) :-
    seqR2_from(zero, N, List).
    
seqR2_from(N, N, []).
seqR2_from(From, N, [From | Rest]) :-
    From \= N,
    seqR2_from(s(From), N, Rest).
