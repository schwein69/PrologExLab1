% search (Elem , List )
search(X, [X|_]).
search(X, [_|T]):- search(X , T).

sublist(_,[]).
sublist(L,[H2|T2]):- search(H2,L),sublist(L,T2).



