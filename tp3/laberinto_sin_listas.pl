% Hechos: Conexiones entre habitaciones (puertas)
conecta(A, B).
conecta(B, C).
conecta(C, D).
conecta(B, E).
conecta(E, D).

% Caso base: Se llega si Inicio y Fin son la misma habitación
llega(Inicio, Fin) :- Inicio = Fin.

% Caso recursivo: Se llega desde Inicio a Fin si hay una conexión a una habitación intermedia
llega(Inicio, Fin) :-
    Inicio \= Fin,           % Asegura que no sea el mismo lugar
    conecta(Inicio, Intermedia), % Hay una conexión
    llega(Intermedia, Fin).   % Llamada recursiva para el resto del camino