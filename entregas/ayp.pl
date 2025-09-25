% --- HECHOS AGRUPADOS POR PREDICADO ---

% Todas las películas juntas
pelicula(inception, ciencia_ficcion).
pelicula(forrest_gump, drama).
pelicula(jurassic_park, aventura).
pelicula(titanic, drama).
pelicula(avatar, ciencia_ficcion).

% Todos los actores juntos
actor(leonardo_dicaprio, inception).
actor(tom_hanks, forrest_gump).
actor(sam_neill, jurassic_park).
actor(laura_dern, jurassic_park).
actor(leonardo_dicaprio, titanic).
actor(kate_winslet, titanic).
actor(sam_worthington, avatar).

% Todos los directores juntos
director(christopher_nolan, inception).
director(steven_spielberg, jurassic_park).
director(robert_zemeckis, forrest_gump).
director(james_cameron, titanic).
director(james_cameron, avatar).

% --- REGLAS SIN VARIABLES SINGLETON ---

% Regla corregida: usar _ para variables no utilizadas
actua_en_genero(NombreActor, Genero) :- 
    actor(NombreActor, TituloPelicula), 
    pelicula(TituloPelicula, Genero).

colaboracion(NombreActor1, NombreActor2) :- 
    actor(NombreActor1, TituloPelicula), 
    actor(NombreActor2, TituloPelicula), 
    NombreActor1 \= NombreActor2.

% Regla propia corregida
es_famosa(TituloPelicula) :- 
    director(_, TituloPelicula),          % _ para variable no usada
    actor(Actor1, TituloPelicula),
    actor(Actor2, TituloPelicula),
    Actor1 \= Actor2.