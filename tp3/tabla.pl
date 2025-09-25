% Caso base: cuando el multiplicador llega a 10
tabla(N) :- 
    tabla(N, 1).

tabla(_, 11) :- !.   % detener cuando llegue a 11

tabla(N, I) :-
    R is N * I,
    write(I), write(' * '), write(N), write(' = '), write(R), nl,
    I1 is I + 1,
    tabla(N, I1).
