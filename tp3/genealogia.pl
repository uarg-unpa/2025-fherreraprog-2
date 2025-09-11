padre(juan, pedro).
padre(pedro, maria).
padre(maria, carlos).
padre(carlos, ana).

% Caso base: un ancestro directo es padre
ancestro(X, Y) :- padre(X, Y).

% Caso recursivo: X es ancestro si es ancestro de Z y Z es padre de Y
ancestro(X, Y) :- ancestro(X, Z), padre(Z, Y).

% Listar todos los ancestros usando recursión y fail
listar_ancestros(Persona) :-
    write('Ancestros de '), write(Persona), write(':'), nl,
    ancestro(Ancestro, Persona),
    write(Ancestro), nl,
    fail. % Fuerza backtracking para listar todos
listar_ancestros(_). % Cláusula vacía para terminar