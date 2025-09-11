% Caso base: La suma de 0 es 0 (detiene la recursión)
suma(0, 0).

% Caso recursivo: Suma de N es N + suma de (N-1)
suma(N, S) :- 
    N > 0,           % Asegura que N sea positivo (evita bucles negativos)
    M is N - 1,      % Calcula N-1
    suma(M, R),      % Llamada recursiva: suma de M
    S is N + R.      % Acumula: S = N + resultado de recursión