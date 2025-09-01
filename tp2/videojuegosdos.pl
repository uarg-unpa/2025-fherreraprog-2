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

% Agrega hechos con números
puntos(mario, 50).  % puntos(Jugador, Cantidad)
puntos(luigi, 30).
puntos(link, 70).
tiempo_jugado(mario, 5).  % En horas

% Procedimiento: Clasifica nivel de jugador basado en puntos (múltiples cláusulas)
clasificacion(Jugador, Nivel) :- 
    puntos(Jugador, Puntos), Puntos > 60, Nivel = experto.
clasificacion(Jugador, Nivel) :- 
    puntos(Jugador, Puntos), Puntos > 30, Puntos =< 60, Nivel = intermedio.
clasificacion(Jugador, Nivel) :- 
    puntos(Jugador, Puntos), Puntos =< 30, Nivel = novato.

% Aritmética: Calcula bono (puntos * factor, con mod para par/impar)
bono(Jugador, Bono) :- 
    puntos(Jugador, Puntos), 
    (0 is Puntos mod 2 -> Factor = 2 ; Factor = 1),  % Condicional simple
    Bono is Puntos * Factor.

% Interactividad básica: Convierte horas a minutos (similar a TP2 pero en juegos)
horas_a_minutos(Horas, Minutos) :- Minutos is Horas * 60.

%clasificacion(mario, N).
%bono(link, B).
%horas_a_minutos(5, M).
%clasificacion(sonic, N).