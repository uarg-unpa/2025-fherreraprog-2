%  segundo Hechos
precio(el_principito, 60).
precio(harry_potter, 45).
stock(el_principito, 10).
stock(harry_potter, 3).

% Regla con aritmética y procedimiento
precio_final(Titulo, Copias, Total) :- 
    precio(Titulo, Precio), 
    stock(Titulo, Stock), 
    Stock >= Copias, 
    Total is Precio * Copias.
precio_final(Titulo, Copias, Total) :- 
    \+ stock(Titulo, _), 
    Total = no_disponible.

% Consultas
%?- precio_final(el_principito, 2, T). % T = 120
%?- precio_final(harry_potter, 5, T). % T = no_disponible
%?- clasificar_libro(45, C). % C = economico