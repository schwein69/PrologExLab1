listSize(cons(_,T),s(N)):-listSize(T,N).
listSize(nil,0).
size(X,N):-listSize(X,N).