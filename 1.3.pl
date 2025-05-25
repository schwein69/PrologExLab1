search_two(X , cons(_ , cons(X , cons(_ , cons(X, _))))).
search_two(X , cons(_ , Xs )) :- search_two (X , Xs ).