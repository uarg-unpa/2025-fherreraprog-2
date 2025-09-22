sustraer([], Y, Y).  % Caso base: Sin elementos a sustraer
sustraer([Elemento | Cola], Y, Z) :- 
    eliminar_todos(Elemento, Y, YSinElemento), 
    sustraer(Cola, YSinElemento, Z).

% Auxiliar: Eliminar todas las ocurrencias de Elemento
eliminar_todos(_, [], []).
eliminar_todos(Elemento, [Elemento | Cola], Resultado) :- 
    eliminar_todos(Elemento, Cola, Resultado).
eliminar_todos(Elemento, [Cabeza | Cola], [Cabeza | Resultado]) :- 
    Cabeza \= Elemento, 
    eliminar_todos(Elemento, Cola, Resultado).