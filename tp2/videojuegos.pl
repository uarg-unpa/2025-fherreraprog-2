% Hechos
jugador(mario, plataforma).  % jugador(Nombre, GeneroJuego)
jugador(luigi, plataforma).
jugador(link, aventura).
juega_en(mario, super_mario).  % juega_en(Jugador, Juego)
juega_en(luigi, super_mario).
juega_en(link, zelda).
nivel(super_mario, facil).
nivel(zelda, dificil).

% Regla simple para unificación
juega_genero(Jugador, Genero) :- jugador(Jugador, Genero), juega_en(Jugador, Juego).

%consultas
%jugador(X, plataforma).
%juega_genero(Jugador, plataforma).
%?- juega_genero(link, plataforma).