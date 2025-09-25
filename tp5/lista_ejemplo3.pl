primeros(0, _, []).  % Caso base: N=0, lista vacía
primeros(N, [Cabeza | Cola], [Cabeza | Resultado]) :- 
    N > 0, 
    M is N - 1, 
    primeros(M, Cola, Resultado).