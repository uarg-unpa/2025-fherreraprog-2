ocurrencia([], _, 0).  % Caso base: Lista vacía, 0 ocurrencias
ocurrencia([C | Cola], C, N) :- 
    ocurrencia(Cola, C, M), 
    N is M + 1.  % Si coincide, suma 1
ocurrencia([_ | Cola], C, N) :- 
    ocurrencia(Cola, C, N).  % Si no coincide, continua