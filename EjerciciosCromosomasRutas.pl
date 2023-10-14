% Ejercicio Cromosomas.

persona(jon, snow, [0, 0, 1, 1, 1, 1, 0, 0, 1, 1]).
persona(daenerys, targaryen, [1, 1, 1, 0, 0, 0, 1, 0, 0, 1]).
persona(harry, potter, [0, 1, 0, 1, 1, 1, 0, 1, 1, 0]).
persona(hermione, granger, [1, 0, 0, 1, 0, 0, 1, 0, 0, 1]).
persona(tony, stark, [0, 0, 1, 1, 0, 1, 0, 0, 0, 1]).
persona(bruce, wayne, [0, 1, 1, 0, 1, 0, 1, 1, 0, 0]).
persona(clark, kent, [1, 1, 0, 0, 1, 0, 0, 1, 1, 1]).
persona(peter, parker, [0, 1, 1, 0, 0, 1, 0, 1, 1, 1]).
persona(luke, skywalker, [1, 0, 1, 1, 0, 0, 1, 1, 0, 0]).
persona(leia, organa, [0, 1, 0, 0, 1, 1, 1, 0, 0, 1]).

calcular_porcentaje_similitud(Muestra, Persona, Porcentaje) :-
    persona(Persona, _, CromosomaPersona),
    calcula_distancia_hamming(Muestra, CromosomaPersona, Distancia),
    length(Muestra, Longitud),
    Porcentaje is 100 * (1 - (Distancia / Longitud)).

calcula_distancia_hamming([], [], 0).
calcula_distancia_hamming([H1|T1], [H2|T2], Distancia) :-
    calcula_distancia_hamming(T1, T2, DistanciaRestante),
    (H1 = H2 -> Distancia is DistanciaRestante ; Distancia is DistanciaRestante + 1).

max_porcentaje([], [_, 0.0]). 
max_porcentaje([[Persona, Porcentaje]|T], Max) :-
    max_porcentaje(T, [OtraPersona, OtraPorcentaje]),
    (Porcentaje >= OtraPorcentaje -> Max = [Persona, Porcentaje] ; Max = [OtraPersona, OtraPorcentaje]).

encontrar_persona_mas_similar(Muestra, PersonaMasSimilar, PorcentajeMasAlto) :-
    findall([Persona, Porcentaje], calcular_porcentaje_similitud(Muestra, Persona, Porcentaje), Resultados),
    max_porcentaje(Resultados, [PersonaMasSimilar, PorcentajeMasAlto]).

obtener_todos_porcentajes(Muestra, ListaDePorcentajes) :-
    findall([Persona, Porcentaje], calcular_porcentaje_similitud(Muestra, Persona, Porcentaje), ListaDePorcentajes).

% Ejercicio Rutas.

conectado(a, d, 7).
conectado(d, e, 3).
conectado(e, f, 2).
conectado(i, c, 4).
conectado(d, f, 5).
conectado(a, e, 6).
conectado(c, e, 1).
conectado(i, d, 8).
conectado(b, e, 4).

ruta(Inicio, Fin, Ruta, Peso) :-
    ruta2(Inicio, Fin, [Inicio], Ruta, Peso).

ruta2(Fin, Fin, Ruta, Ruta, 0).

ruta2(Inicio, Fin, Visitados, Ruta, Peso) :-
    conectado(Inicio, Siguiente, PesoArista),
    \+ member(Siguiente, Visitados),
    append(Visitados, [Siguiente], NuevosVisitados),  
    ruta2(Siguiente, Fin, NuevosVisitados, Ruta, NuevaPeso),
    Peso is NuevaPeso + PesoArista.

ruta_mas_corta(Inicio, Fin, Ruta, Peso) :-
    findall([R, P], ruta(Inicio, Fin, R, P), Rutas),  
    min_peso(Rutas, Ruta, Peso).  

min_peso([[Ruta, Peso]], Ruta, Peso).

min_peso([[R1, P1] | Resto], Ruta, Peso) :-
    min_peso(Resto, R2, P2),    (P1 < P2 -> Ruta = R1, Peso = P1; Ruta = R2, Peso = P2).