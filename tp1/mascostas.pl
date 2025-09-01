mascota(perro, fido).
mascota(gato, whiskers).
mascota(perro, rex).
dueno(juan, fido).
dueno(ana, whiskers).
dueno(pedro, rex).
color(fido, marron).
color(whiskers, gris).
color(rex, negro).
dueno_de_tipo(Persona, Tipo):-dueno(Persona,Mascota), mascota(Tipo, Mascota).