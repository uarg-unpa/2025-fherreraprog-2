% Hechos del enunciado
pelicula(inception, ciencia_ficcion).
actor(leonardo_dicaprio, inception).
director(christopher_nolan, inception).
actor(tom_hanks, forrest_gump).
pelicula(forrest_gump, drama).
director(steven_spielberg, jurassic_park).
pelicula(jurassic_park, aventura).

% 5 hechos adicionales para enriquecer la base
director(robert_zemeckis, forrest_gump).
actor(sam_neill, jurassic_park).
actor(laura_dern, jurassic_park).
pelicula(titanic, drama).
actor(leonardo_dicaprio, titanic).
director(james_cameron, titanic).
actor(kate_winslet, titanic).
pelicula(avatar, ciencia_ficcion).
director(james_cameron, avatar).
actor(sam_worthington, avatar).

% a) Películas que dirige Christopher Nolan
?- director(christopher_nolan, TituloPelicula).
% Respuesta: TituloPelicula = inception
% Unificación: TituloPelicula se une con 'inception'

% b) Actores en películas de ciencia ficción
?- pelicula(TituloPelicula, ciencia_ficcion), actor(NombreActor, TituloPelicula).
% Respuestas: 
% TituloPelicula = inception, NombreActor = leonardo_dicaprio
% TituloPelicula = avatar, NombreActor = sam_worthington
% Backtracking: Prolog prueba todas las películas de ciencia_ficcion
% y luego busca actores en cada una

% c) Todas las películas y géneros
?- pelicula(TituloPelicula, Genero).
% Lista todas las combinaciones película-género de la base

% d) Actores en Inception y otra película
?- actor(NombreActor, inception), actor(NombreActor, OtraPelicula), OtraPelicula \= inception.
% Respuesta: NombreActor = leonardo_dicaprio, OtraPelicula = titanic
% Unificación: NombreActor se une con 'leonardo_dicaprio' y busca otra película

% Consultas propias adicionales
% e) Directores que trabajan con Leonardo DiCaprio
?- director(Director, Pelicula), actor(leonardo_dicaprio, Pelicula).
% f) Películas de drama con sus directores
?- pelicula(Pelicula, drama), director(Director, Pelicula).

% a) Actor actúa en un género
actua_en_genero(NombreActor, Genero) :- 
    actor(NombreActor, TituloPelicula), 
    pelicula(TituloPelicula, Genero).

% b) Colaboración entre actores
colaboracion(NombreActor1, NombreActor2) :- 
    actor(NombreActor1, TituloPelicula), 
    actor(NombreActor2, TituloPelicula), 
    NombreActor1 \= NombreActor2.

% c) Director de un género
director_de_genero(NombreDirector, Genero) :- 
    director(NombreDirector, TituloPelicula), 
    pelicula(TituloPelicula, Genero).

% d) Película con colaboración (al menos 2 actores)
pelicula_con_colaboracion(TituloPelicula) :- 
    actor(Actor1, TituloPelicula),
    actor(Actor2, TituloPelicula),
    Actor1 \= Actor2.

% Regla propia: Película famosa (director conocido y múltiples actores)
es_famosa(TituloPelicula) :- 
    director(_, TituloPelicula),
    actor(Actor1, TituloPelicula),
    actor(Actor2, TituloPelicula),
    Actor1 \= Actor2.

  % Explicación del proceso de resolución:
% Para una consulta como: actor(NombreActor, TituloPelicula), pelicula(TituloPelicula, ciencia_ficcion)
% 1. Prolog unifica la primera parte: actor(NombreActor, TituloPelicula)
% 2. Encuentra todos los hechos actor/2 y unifica variables
% 3. Luego verifica pelicula(TituloPelicula, ciencia_ficcion) para cada solución
% 4. Usa backtracking para encontrar todas las soluciones posibles
% 5. El motor prueba alternativas sistemáticamente hasta agotar posibilidades

% Extensión con género de actores
sexo(leonardo_dicaprio, masculino).
sexo(tom_hanks, masculino).
sexo(sam_neill, masculino).
sexo(laura_dern, femenino).
sexo(kate_winslet, femenino).
sexo(sam_worthington, masculino).

% Regla para actrices
actriz_en_pelicula(NombreActriz, TituloPelicula) :- 
    actor(NombreActriz, TituloPelicula),
    sexo(NombreActriz, femenino).

% Consulta de prueba
?- actriz_en_pelicula(Actriz, Pelicula).
% Respuestas: Actriz = laura_dern, Pelicula = jurassic_park
%             Actriz = kate_winslet, Pelicula = titanic