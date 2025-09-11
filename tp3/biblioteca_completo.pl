:- dynamic libro/2.
:- dynamic prestado/2.

% Hechos iniciales
libro("el_principito", "antoine_de_saint_exupery").
libro("1984", "george_orwell").
prestado("el_principito", "juan").

% Regla: Un libro está disponible si no está prestado
disponible(Titulo) :- libro(Titulo, _), \+ prestado(Titulo, _).

% Procedimiento para agregar un libro nuevo (al final)
agregar_libro(Titulo, Autor) :- assertz(libro(Titulo, Autor)).

% Procedimiento para agregar un libro nuevo (al inicio)
agregar_libro_al_inicio(Titulo, Autor) :- asserta(libro(Titulo, Autor)).

% Procedimiento para registrar un préstamo
prestar(Titulo, Persona) :- 
    disponible(Titulo), 
    assertz(prestado(Titulo, Persona)).

% Consulta para ver todos los libros
listar_libros :- 
    libro(Titulo, Autor), 
    write('Libro: '), write(Titulo), write(', Autor: '), write(Autor), nl,
    fail.  % Fuerza backtracking para listar todos
listar_libros.  % Clausula vacía para terminar

% Procedimiento para eliminar un libro
eliminar_libro(Titulo) :-
    libro(Titulo, _),
    \+ prestado(Titulo, _),
    retract(libro(Titulo, _)),
    write('Libro '), write(Titulo), write(' eliminado con éxito.'), nl.
eliminar_libro(Titulo) :-
    prestado(Titulo, _),
    write('No se puede eliminar '), write(Titulo), write(': está prestado.'), nl,
    fail.
eliminar_libro(Titulo) :-
    \+ libro(Titulo, _),
    write('El libro '), write(Titulo), write(' no existe.'), nl,
    fail.

% Procedimiento para devolver un libro (eliminar préstamo)
devolver(Titulo, Persona) :-
    prestado(Titulo, Persona),
    retract(prestado(Titulo, Persona)),
    write('Libro '), write(Titulo), write(' devuelto por '), write(Persona), write('.'), nl.
devolver(Titulo, Persona) :-
    \+ prestado(Titulo, Persona),
    write('No hay préstamo de '), write(Titulo), write(' a '), write(Persona), write('.'), nl,
    fail.