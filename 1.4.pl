search(X, nil, 0).
search(X, cons(X,T),N):- search(X,T,NP), N is NP +1.
search(X, cons(Y,T),N):- X\=Y, search(X,T,N). %skip if are not same
search_anytwo(X, T) :- search (X,T,N), N >= 2.