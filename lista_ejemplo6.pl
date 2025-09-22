concatenar_sin_duplicados([], Y, Y).  % Caso base
concatenar_sin_duplicados([Cabeza | Cola], Y, [Cabeza | Resultado]) :- 
    \+ member(Cabeza, Y),  % Si no está en Y
    concatenar_sin_duplicados(Cola, Y, Resultado).
concatenar_sin_duplicados([Cabeza | Cola], Y, Resultado) :- 
    member(Cabeza, Y),  % Si está, ignora
    concatenar_sin_duplicados(Cola, Y, Resultado).