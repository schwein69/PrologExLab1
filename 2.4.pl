% Peano comparison
geq(zero, zero).
geq(s(_), zero).
geq(s(A), s(B)) :- geq(A, B).

% max for standard Prolog lists
max_list([H|T], Max) :- max_list(T, H, Max).

max_list([], Max, Max).
max_list([H|T], TempMax, Max) :-
    geq(H, TempMax),
    max_list(T, H, Max).
max_list([H|T], TempMax, Max) :-
    \+ geq(H, TempMax), %\+ means negation
    max_list(T, TempMax, Max).
