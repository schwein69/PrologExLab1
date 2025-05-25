%1.3
search_two(X , cons(_ , cons(X , cons(_ , cons(X, _))))).
search_two(X , cons(_ , Xs )) :- search_two (X , Xs ).

%1.4
search(X, nil, 0).
search(X, cons(X,T),N):- search(X,T,NP), N is NP +1.
search(X, cons(Y,T),N):- X\=Y, search(X,T,N). %skip if are not same
search_anytwo(X, T) :- search (X,T,N), N >= 2.

%2.1
listSize(cons(_,T),s(N)):-listSize(T,N).
listSize(nil,0).
size(X,N):-listSize(X,N).

%2.2
sum(A, zero, A).
sum(A, s(B), s(C)) :- sum(A, B, C).
sum_list(nil, zero).
sum_list(cons(H, T), R) :-
    sum_list(T, TailSum),
    sum(H, TailSum, R).

%2.4
geq(zero, zero).
geq(s(_), zero).
geq(s(A), s(B)) :- geq(A, B).

max_list([H|T], Max) :- max_list(T, H, Max).
max_list([], Max, Max).
max_list([H|T], TempMax, Max) :-
    geq(H, TempMax),
    max_list(T, H, Max).
max_list([H|T], TempMax, Max) :-
    \+ geq(H, TempMax), %\+ negation
    max_list(T, TempMax, Max).

%2.5
geq(zero, zero).
geq(s(_), zero).
geq(s(A), s(B)) :- geq(A, B).
leq(zero, _).
leq(s(A), s(B)) :- leq(A, B).

min_max([H|T], Min, Max) :-
    min_max(T, H, H, Min, Max).

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

%3.1
same([],[]).
same([H1|T1],[H2|T2]):- same(T1,T2).

%3.2
geq(zero, zero).
geq(s(_), zero).
geq(s(A), s(B)) :- geq(A, B).
all_bigger([],[]).
all_bigger([H1|T1],[H2|T2]):- geq(H1,H2), all_bigger(T1,T2).

%3.3
search(X, [X|_]).
search(X, [_|T]):- search(X , T).
sublist(_,[]).
sublist(L,[H2|T2]):- search(H2,L),sublist(L,T2).

%4.2
seqR(zero, nil).
seqR(s(N), cons(N, Rest)) :-
    seqR(N, Rest).

%4.3
seqR2(N, List) :-
    seqR2_from(zero, N, List).
seqR2_from(N, N, []).
seqR2_from(From, N, [From | Rest]) :-
    From \= N,
    seqR2_from(s(From), N, Rest).

    




