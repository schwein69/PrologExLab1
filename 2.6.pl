% same(list1,list2)

same([],[]).
same([H1|T1],[H2|T2]):- same(T1,T2).
