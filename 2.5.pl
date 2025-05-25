% Peano comparison
geq(zero, zero).
geq(s(_), zero).
geq(s(A), s(B)) :- geq(A, B).

leq(zero, _).
leq(s(A), s(B)) :- leq(A, B).

% min_max(List, Min, Max)
min_max([H|T], Min, Max) :-
    min_max(T, H, H, Min, Max).

% Base case
min_max([], Min, Max, Min, Max).


min_max([H|T], TempMin, TempMax, Min, Max) :-
    geq(H, TempMax),        % H >= TempMax ? new max
    leq(H, TempMin),        % H <= TempMin ? new min
    min_max(T, H, H, Min, Max).

min_max([H|T], TempMin, TempMax, Min, Max) :-
    geq(H, TempMax),        % H >= TempMax
    \+ leq(H, TempMin),     % H > TempMin
    min_max(T, TempMin, H, Min, Max).

min_max([H|T], TempMin, TempMax, Min, Max) :-
    \+ geq(H, TempMax),     % H < TempMax
    leq(H, TempMin),        % H <= TempMin
    min_max(T, H, TempMax, Min, Max).

min_max([H|T], TempMin, TempMax, Min, Max) :-
    \+ geq(H, TempMax),     % H < TempMax
    \+ leq(H, TempMin),     % H > TempMin
    min_max(T, TempMin, TempMax, Min, Max).
