% Ejercicio 1.

sumlist([], 0).

sumlist([X|Xs], S) :-
    sumlist(Xs, S1),
    S is X + S1.

% Ejercicio 2.

subconj(_, []).

subconj(S, [X|S1]) :-
    member(X, S),
    subconj(S, S1).

% Ejercicio 3.

aplanar([], []).

aplanar([Heap|Tail], L2) :-
    is_list(Heap),
    aplanar(Heap, FlatHeap), 
    aplanar(Tail, FlatTail), 
    append(FlatHeap, FlatTail, L2). 

aplanar([Heap|Tail], [Heap|FlatTail]) :-
    \+ is_list(Heap),
    aplanar(Tail, FlatTail). 

% Ejercicio 4.

partir([], _, [], []).

partir([Valor|Valores], Umbral, [Valor|Ms], Ls) :-
    Valor =< Umbral,
    partir(Valores, Umbral, Ms, Ls).

partir([Valor|Valores], Umbral, Ms, [Valor|Ls]) :-
    Valor > Umbral,
    partir(Valores, Umbral, Ms, Ls).

% Ejercicio 5.

sub_cadenas(_, [], []).

sub_cadenas(Subcadena, [Cadena|Tail], [Cadena|FiltradasTail]) :-
    sub_atom(Cadena, _, _, _, Subcadena),
    sub_cadenas(Subcadena, Tail, FiltradasTail).

sub_cadenas(Subcadena, [_|Tail], Filtradas) :-
    sub_cadenas(Subcadena, Tail, Filtradas).