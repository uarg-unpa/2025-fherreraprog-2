% Caso base: Cualquier base a la potencia 0 es 1
potencia(_, 0, 1).

% Caso recursivo: Base^Exp = Base * Base^(Exp-1)
potencia(Base, Exp, Result) :-
    Exp > 0,              % Asegura exponente positivo
    Exp1 is Exp - 1,      % Reduce el problema
    potencia(Base, Exp1, Temp),  % Llamada recursiva
    Result is Base * Temp.  % Acumula el resultado