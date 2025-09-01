% Hechos existentes
mascota(perro, fido).
mascota(gato, whiskers).
mascota(perro, rex).
dueno(juan, fido).
dueno(ana, whiskers).
dueno(pedro, rex).
color(fido, marron).
color(whiskers, gris).
color(rex, negro).
edad(fido, 5).    % Nueva relación: edad de la mascota en años
edad(whiskers, 3).
edad(rex, 7).
juega_con(fido, pelota).  % Nueva relación: juguete favorito
juega_con(whiskers, ovillo).
juega_con(rex, hueso).

% Regla existente: Persona es dueño de un perro
dueno_de_perro(Persona) :- dueno(Persona, Nombre), mascota(perro, Nombre).

% Nueva regla: Persona es dueño de un gato
dueno_de_gato(Persona) :- dueno(Persona, Nombre), mascota(gato, Nombre).

% Nueva regla: Mascota es joven si su edad es menor o igual a 4
es_joven(Nombre) :- edad(Nombre, Edad), Edad =< 4.

% Nueva regla: Persona tiene una mascota joven
dueno_de_mascota_joven(Persona) :- dueno(Persona, Nombre), es_joven(Nombre).

% Nueva regla: Mascota juega con un juguete específico
tiene_juguete(Nombre, Juguete) :- juega_con(Nombre, Juguete).

% Nueva regla: Dueño de una mascota que juega con pelota
dueno_de_mascota_con_pelota(Persona) :- dueno(Persona, Nombre), juega_con(Nombre, pelota).