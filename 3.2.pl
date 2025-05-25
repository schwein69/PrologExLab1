% all_bigger(List1, List2)
geq(zero, zero).
geq(s(_), zero).
geq(s(A), s(B)) :- geq(A, B).

all_bigger([],[]).
all_bigger([H1|T1],[H2|T2]):- geq(H1,H2), all_bigger(T1,T2).
