% Lista simple
lista_ejemplo([1, 2, 3, 4]).

% Usando cons | para descomponer
descomponer([Cabeza | Cola]) :- 
    write('Cabeza: '), write(Cabeza), nl,
    write('Cola: '), write(Cola), nl.


%operaciones basicas
%lista vacia
is_empty([]).
is_empty(Lista) :- 
    write('La lista no está vacía: '), write(Lista), nl.

%acceso a elementos recursion

% Caso base: lista vacía
imprimir([]).
% Caso recursivo: imprime cabeza y sigue con la cola
imprimir([Cabeza | Cola]) :- 
    write(Cabeza), nl, 
    imprimir(Cola).

%concatenar listas
concatenar([], Lista, Lista).
concatenar([Cabeza | Cola1], Lista2, [Cabeza | Cola3]) :- 
    concatenar(Cola1, Lista2, Cola3).

%predicados 
member(Elemento, [Elemento | _]).
member(Elemento, [_ | Cola]) :- member(Elemento, Cola).

longitud([], 0).
longitud([_ | Cola], N) :- 
    longitud(Cola, M), 
    N is M + 1.

%ejemplo

% Invertir una lista (desafío adicional)
invertir([], []).
invertir([Cabeza | Cola], ListaInvertida) :- 
    invertir(Cola, RestoInvertido), 
    concatenar(RestoInvertido, [Cabeza], ListaInvertida).

% Prueba
?- invertir([1, 2, 3], X).  % X = [3, 2, 1]

