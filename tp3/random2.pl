aleatorio():- X is random(10),nro(X,1).
nro(X,10).
nro(X,C):- write(X), nl,
              C1 is C+1,
              X is random(10),
              nro(X,C1).

