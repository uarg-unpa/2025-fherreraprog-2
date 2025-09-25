ultimos(0, _, []).  % Caso base
ultimos(N, Lista, Resultado) :- 
    longitud(Lista, Len), 
    Skip is Len - N, 
    saltar(Skip, Lista, Resultado).

% Auxiliar: Saltar primeros Skip elementos
saltar(0, Lista, Lista).
saltar(Skip, [_ | Cola], Resultado) :- 
    Skip1 is Skip - 1, 
    saltar(Skip1, Cola, Resultado).

% Auxiliar: Longitud de lista
longitud([], 0).
longitud([_ | Cola], N) :- longitud(Cola, M), N is M + 1.