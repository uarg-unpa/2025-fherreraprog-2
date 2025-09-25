imprimir(1) :- 
    write('fin'), nl, !.

imprimir(X) :- 
    random(1,100,A), 
    write(A), nl, 
    X1 is X - 1, 
    imprimir(X1).
