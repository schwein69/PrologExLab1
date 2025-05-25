% Peano addition
sum(A, zero, A).
sum(A, s(B), s(C)) :- sum(A, B, C).

% Sum of list
sum_list(nil, zero).
sum_list(cons(H, T), R) :-
    sum_list(T, TailSum),
    sum(H, TailSum, R).

