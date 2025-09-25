:- dynamic empleados/1.

empleados([juan, maria]).

agregar_empleado(Nombre) :-
    retract(empleados(ListaActual)),  % Recupera la lista actual
    NuevaLista = [Nombre | ListaActual],  % Agrega al inicio
    assertz(empleados(NuevaLista)).  % Agrega de nuevo

