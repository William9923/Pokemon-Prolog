/* Map size */
edge([1,19],[1,19]). %Map size;
edgeOffset([X1,X2],[Y1,Y2]) :- 
    edge([XEdge1,XEdge2],[YEdge1,YEdge2]),
    X1 is XEdge1-1, X2 is XEdge2+1,
    Y1 is YEdge1-1, Y2 is YEdge2+1.


/*****************************************/
/*Initializing an initial map condition*/
terrain(mountain, 1 , 19 ).
terrain(mountain, 2 , 19 ).
terrain(mountain, 3 , 19 ).
terrain(mountain, 4 , 19 ).
terrain(mountain, 5 , 19 ).
terrain(mountain, 6 , 19 ).
terrain(mountain, 7 , 19 ).
terrain(mountain, 8 , 19 ).
terrain(mountain, 9 , 19 ).
terrain(mountain, 10 , 19 ).
terrain(mountain, 11 , 19 ).
terrain(mountain, 12 , 19 ).
terrain(mountain, 13 , 19 ).
terrain(mountain, 14 , 19 ).
terrain(mountain, 15 , 19 ).
terrain(mountain, 16 , 19 ).
terrain(mountain, 17 , 19 ).
terrain(river, 18 , 19 ).
terrain(mountain, 19 , 19 ).
terrain(mountain, 1 , 18 ).
terrain(lava, 2 , 18 ).
terrain(lava, 3 , 18 ).
terrain(lava, 4 , 18 ).
terrain(lava, 5 , 18 ).
terrain(lava, 6 , 18 ).
terrain(lava, 7 , 18 ).
terrain(lava, 8 , 18 ).
terrain(lava, 9 , 18 ).
terrain(mountain, 10 , 18 ).
terrain(mountain, 11 , 18 ).
terrain(river, 12 , 18 ).
terrain(river, 13 , 18 ).
terrain(river, 14 , 18 ).
terrain(river, 15 , 18 ).
terrain(river, 16 , 18 ).
terrain(river, 17 , 18 ).
terrain(grassland, 18 , 18 ).
terrain(grassland, 19 , 18 ).
terrain(mountain, 1 , 17 ).
terrain(lava, 2 , 17 ).
terrain(lava, 3 , 17 ).
terrain(lava, 4 , 17 ).
terrain(lava, 5 , 17 ).
terrain(mountain, 6 , 17 ).
terrain(mountain, 7 , 17 ).
terrain(mountain, 8 , 17 ).
terrain(mountain, 9 , 17 ).
terrain(mountain, 10 , 17 ).
terrain(mountain, 11 , 17 ).
terrain(mountain, 12 , 17 ).
terrain(mountain, 13 , 17 ).
terrain(grassland, 14 , 17 ).
terrain(grassland, 15 , 17 ).
terrain(grassland, 16 , 17 ).
terrain(grassland, 17 , 17 ).
terrain(grassland, 18 , 17 ).
terrain(wasteland, 19 , 17 ).
terrain(mountain, 1 , 16 ).
terrain(lava, 2 , 16 ).
terrain(lava, 3 , 16 ).
terrain(mountain, 4 , 16 ).
terrain(mountain, 5 , 16 ).
terrain(mountain, 6 , 16 ).
terrain(mountain, 7 , 16 ).
terrain(mountain, 8 , 16 ).
terrain(mountain, 9 , 16 ).
terrain(grassland, 10 , 16 ).
terrain(river, 11 , 16 ).
terrain(grassland, 12 , 16 ).
terrain(grassland, 13 , 16 ).
terrain(grassland, 14 , 16 ).
terrain(grassland, 15 , 16 ).
terrain(grassland, 16 , 16 ).
terrain(grassland, 17 , 16 ).
terrain(wasteland, 18 , 16 ).
terrain(wasteland, 19 , 16 ).
terrain(mountain, 1 , 15 ).
terrain(lava, 2 , 15 ).
terrain(mountain, 3 , 15 ).
terrain(grassland, 4 , 15 ).
terrain(forest, 5 , 15 ).
terrain(forest, 6 , 15 ).
terrain(forest, 7 , 15 ).
terrain(grassland, 8 , 15 ).
terrain(grassland, 9 , 15 ).
terrain(river, 10 , 15 ).
terrain(grassland, 11 , 15 ).
terrain(grassland, 12 , 15 ).
terrain(grassland, 13 , 15 ).
terrain(grassland, 14 , 15 ).
terrain(grassland, 15 , 15 ).
terrain(grassland, 16 , 15 ).
terrain(wasteland, 17 , 15 ).
terrain(wasteland, 18 , 15 ).
terrain(wasteland, 19 , 15 ).
terrain(mountain, 1 , 14 ).
terrain(lava, 2 , 14 ).
terrain(mountain, 3 , 14 ).
terrain(grassland, 4 , 14 ).
terrain(forest, 5 , 14 ).
terrain(forest, 6 , 14 ).
terrain(grassland, 7 , 14 ).
terrain(grassland, 8 , 14 ).
terrain(river, 9 , 14 ).
terrain(grassland, 10 , 14 ).
terrain(grassland, 11 , 14 ).
terrain(grassland, 12 , 14 ).
terrain(grassland, 13 , 14 ).
terrain(grassland, 14 , 14 ).
terrain(grassland, 15 , 14 ).
terrain(grassland, 16 , 14 ).
terrain(grassland, 17 , 14 ).
terrain(grassland, 18 , 14 ).
terrain(wasteland, 19 , 14 ).
terrain(mountain, 1 , 13 ).
terrain(mountain, 2 , 13 ).
terrain(grassland, 3 , 13 ).
terrain(forest, 4 , 13 ).
terrain(forest, 5 , 13 ).
terrain(forest, 6 , 13 ).
terrain(forest, 7 , 13 ).
terrain(grassland, 8 , 13 ).
terrain(river, 9 , 13 ).
terrain(grassland, 10 , 13 ).
terrain(grassland, 11 , 13 ).
terrain(grassland, 12 , 13 ).
terrain(grassland, 13 , 13 ).
terrain(grassland, 14 , 13 ).
terrain(grassland, 15 , 13 ).
terrain(grassland, 16 , 13 ).
terrain(wasteland, 17 , 13 ).
terrain(wasteland, 18 , 13 ).
terrain(wasteland, 19 , 13 ).
terrain(mountain, 1 , 12 ).
terrain(forest, 2 , 12 ).
terrain(forest, 3 , 12 ).
terrain(forest, 4 , 12 ).
terrain(forest, 5 , 12 ).
terrain(forest, 6 , 12 ).
terrain(forest, 7 , 12 ).
terrain(forest, 8 , 12 ).
terrain(river, 9 , 12 ).
terrain(grassland, 10 , 12 ).
terrain(grassland, 11 , 12 ).
terrain(grassland, 12 , 12 ).
terrain(grassland, 13 , 12 ).
terrain(grassland, 14 , 12 ).
terrain(grassland, 15 , 12 ).
terrain(grassland, 16 , 12 ).
terrain(grassland, 17 , 12 ).
terrain(grassland, 18 , 12 ).
terrain(wasteland, 19 , 12 ).
terrain(item, 1 , 11 ).
terrain(grassland, 2 , 11 ).
terrain(item, 3 , 11 ).
terrain(forest, 4 , 11 ).
terrain(forest, 5 , 11 ).
terrain(forest, 6 , 11 ).
terrain(grassland, 7 , 11 ).
terrain(grassland, 8 , 11 ).
terrain(river, 9 , 11 ).
terrain(grassland, 10 , 11 ).
terrain(item, 11 , 11 ).
terrain(grassland, 12 , 11 ).
terrain(grassland, 13 , 11 ).
terrain(grassland, 14 , 11 ).
terrain(grassland, 15 , 11 ).
terrain(grassland, 16 , 11 ).
terrain(wasteland, 17 , 11 ).
terrain(wasteland, 18 , 11 ).
terrain(wasteland, 19 , 11 ).
terrain(grassland, 1 , 10 ).
terrain(forest, 2 , 10 ).
terrain(forest, 3 , 10 ).
terrain(forest, 4 , 10 ).
terrain(forest, 5 , 10 ).
terrain(item, 6 , 10 ).
terrain(grassland, 7 , 10 ).
terrain(river, 8 , 10 ).
terrain(grassland, 9 , 10 ).
terrain(home, 10 , 10 ).
terrain(grassland, 11 , 10 ).
terrain(grassland, 12 , 10 ).
terrain(grassland, 13 , 10 ).
terrain(grassland, 14 , 10 ).
terrain(grassland, 15 , 10 ).
terrain(grassland, 16 , 10 ).
terrain(grassland, 17 , 10 ).
terrain(wasteland, 18 , 10 ).
terrain(wasteland, 19 , 10 ).
terrain(forest, 1 , 9 ).
terrain(forest, 2 , 9 ).
terrain(forest, 3 , 9 ).
terrain(forest, 4 , 9 ).
terrain(forest, 5 , 9 ).
terrain(grassland, 6 , 9 ).
terrain(river, 7 , 9 ).
terrain(grassland, 8 , 9 ).
terrain(grassland, 9 , 9 ).
terrain(grassland, 10 , 9 ).
terrain(grassland, 11 , 9 ).
terrain(grassland, 12 , 9 ).
terrain(grassland, 13 , 9 ).
terrain(grassland, 14 , 9 ).
terrain(grassland, 15 , 9 ).
terrain(grassland, 16 , 9 ).
terrain(wasteland, 17 , 9 ).
terrain(wasteland, 18 , 9 ).
terrain(wasteland, 19 , 9 ).
terrain(forest, 1 , 8 ).
terrain(forest, 2 , 8 ).
terrain(cave, 3 , 8 ).
terrain(forest, 4 , 8 ).
terrain(forest, 5 , 8 ).
terrain(river, 6 , 8 ).
terrain(grassland, 7 , 8 ).
terrain(grassland, 8 , 8 ).
terrain(grassland, 9 , 8 ).
terrain(grassland, 10 , 8 ).
terrain(grassland, 11 , 8 ).
terrain(grassland, 12 , 8 ).
terrain(grassland, 13 , 8 ).
terrain(grassland, 14 , 8 ).
terrain(grassland, 15 , 8 ).
terrain(grassland, 16 , 8 ).
terrain(grassland, 17 , 8 ).
terrain(wasteland, 18 , 8 ).
terrain(wasteland, 19 , 8 ).
terrain(forest, 1 , 7 ).
terrain(forest, 2 , 7 ).
terrain(forest, 3 , 7 ).
terrain(forest, 4 , 7 ).
terrain(river, 5 , 7 ).
terrain(grassland, 6 , 7 ).
terrain(grassland, 7 , 7 ).
terrain(grassland, 8 , 7 ).
terrain(grassland, 9 , 7 ).
terrain(grassland, 10 , 7 ).
terrain(grassland, 11 , 7 ).
terrain(grassland, 12 , 7 ).
terrain(grassland, 13 , 7 ).
terrain(grassland, 14 , 7 ).
terrain(grassland, 15 , 7 ).
terrain(grassland, 16 , 7 ).
terrain(wasteland, 17 , 7 ).
terrain(wasteland, 18 , 7 ).
terrain(wasteland, 19 , 7 ).
terrain(river, 1 , 6 ).
terrain(river, 2 , 6 ).
terrain(river, 3 , 6 ).
terrain(river, 4 , 6 ).
terrain(grassland, 5 , 6 ).
terrain(grassland, 6 , 6 ).
terrain(grassland, 7 , 6 ).
terrain(grassland, 8 , 6 ).
terrain(grassland, 9 , 6 ).
terrain(grassland, 10 , 6 ).
terrain(grassland, 11 , 6 ).
terrain(grassland, 12 , 6 ).
terrain(grassland, 13 , 6 ).
terrain(grassland, 14 , 6 ).
terrain(grassland, 15 , 6 ).
terrain(grassland, 16 , 6 ).
terrain(wasteland, 17 , 6 ).
terrain(wasteland, 18 , 6 ).
terrain(wasteland, 19 , 6 ).
terrain(forest, 1 , 5 ).
terrain(forest, 2 , 5 ).
terrain(forest, 3 , 5 ).
terrain(forest, 4 , 5 ).
terrain(item, 5 , 5 ).
terrain(forest, 6 , 5 ).
terrain(item, 7 , 5 ).
terrain(forest, 8 , 5 ).
terrain(grassland, 9 , 5 ).
terrain(grassland, 10 , 5 ).
terrain(grassland, 11 , 5 ).
terrain(grassland, 12 , 5 ).
terrain(grassland, 13 , 5 ).
terrain(grassland, 14 , 5 ).
terrain(grassland, 15 , 5 ).
terrain(wasteland, 16 , 5 ).
terrain(wasteland, 17 , 5 ).
terrain(wasteland, 18 , 5 ).
terrain(wasteland, 19 , 5 ).
terrain(item, 1 , 4 ).
terrain(forest, 2 , 4 ).
terrain(forest, 3 , 4 ).
terrain(forest, 4 , 4 ).
terrain(forest, 5 , 4 ).
terrain(river, 6 , 4 ).
terrain(forest, 7 , 4 ).
terrain(forest, 8 , 4 ).
terrain(grassland, 9 , 4 ).
terrain(grassland, 10 , 4 ).
terrain(grassland, 11 , 4 ).
terrain(grassland, 12 , 4 ).
terrain(grassland, 13 , 4 ).
terrain(grassland, 14 , 4 ).
terrain(grassland, 15 , 4 ).
terrain(grassland, 16 , 4 ).
terrain(grassland, 17 , 4 ).
terrain(grassland, 18 , 4 ).
terrain(wasteland, 19 , 4 ).
terrain(forest, 1 , 3 ).
terrain(forest, 2 , 3 ).
terrain(item, 3 , 3 ).
terrain(forest, 4 , 3 ).
terrain(forest, 5 , 3 ).
terrain(forest, 6 , 3 ).
terrain(river, 7 , 3 ).
terrain(forest, 8 , 3 ).
terrain(grassland, 9 , 3 ).
terrain(grassland, 10 , 3 ).
terrain(grassland, 11 , 3 ).
terrain(grassland, 12 , 3 ).
terrain(grassland, 13 , 3 ).
terrain(grassland, 14 , 3 ).
terrain(grassland, 15 , 3 ).
terrain(grassland, 16 , 3 ).
terrain(grassland, 17 , 3 ).
terrain(wasteland, 18 , 3 ).
terrain(desert, 19 , 3 ).
terrain(forest, 1 , 2 ).
terrain(forest, 2 , 2 ).
terrain(forest, 3 , 2 ).
terrain(forest, 4 , 2 ).
terrain(forest, 5 , 2 ).
terrain(forest, 6 , 2 ).
terrain(river, 7 , 2 ).
terrain(forest, 8 , 2 ).
terrain(grassland, 9 , 2 ).
terrain(grassland, 10 , 2 ).
terrain(grassland, 11 , 2 ).
terrain(grassland, 12 , 2 ).
terrain(grassland, 13 , 2 ).
terrain(grassland, 14 , 2 ).
terrain(grassland, 15 , 2 ).
terrain(grassland, 16 , 2 ).
terrain(grassland, 17 , 2 ).
terrain(desert, 18 , 2 ).
terrain(wasteland, 19 , 2 ).
terrain(forest, 1 , 1 ).
terrain(forest, 2 , 1 ).
terrain(forest, 3 , 1 ).
terrain(forest, 4 , 1 ).
terrain(forest, 5 , 1 ).
terrain(river, 6 , 1 ).
terrain(forest, 7 , 1 ).
terrain(item, 8 , 1 ).
terrain(grassland, 9 , 1 ).
terrain(item, 10 , 1 ).
terrain(grassland, 11 , 1 ).
terrain(grassland, 12 , 1 ).
terrain(grassland, 13 , 1 ).
terrain(grassland, 14 , 1 ).
terrain(grassland, 15 , 1 ).
terrain(grassland, 16 , 1 ).
terrain(grassland, 17 , 1 ).
terrain(desert, 18 , 1 ).
terrain(desert, 19 , 1 ).

/*** MAP - Printing map with radar ***/ 
map :-
    checkStart(0),
    write('Permainan Belum dimulai'), !.
map :-
    edgeOffset([XMin,_],[_,YMax]),
    recPrintRadar(XMin,YMax), !.    
/********************************/
/*** MAP function dependencies***/
recPrintRadar(X,Y) :-
    edgeOffset([_,X],[Y,_]),
    printOneTile(X,Y), tab(1), !.
    
recPrintRadar(X,Y) :-
    \+edgeOffset([_,X],_),
    XPlus is X+1,
    printOneTile(X,Y), tab(1),
    recPrintRadar(XPlus,Y), !.
    
recPrintRadar(X,Y) :-
    edgeOffset([_,X],_),
    edgeOffset([XMin,_],_),
    YMin is Y-1,
    printOneTile(X,Y), tab(1),
    nl,
    recPrintRadar(XMin,YMin).   
/************************************/
/** For printing MAP **/
printOneTile(X,Y) :-    % home
    terrain(home,X,Y),
    write('H'), !.
printOneTile(X,Y) :-    % gym
    gym(X,Y),
    write('G'), !.
printOneTile(X,Y) :-    % cave
    cave(X,Y),
    write('C'), !.
printOneTile(X,Y) :-    % block
    terrain(block,X,Y),
    write('O'), !.
printOneTile(X,Y) :-    % player
    letak_player(X,Y),
    write('P'), !.
printOneTile(X,Y) :-    % forest
    terrain(forest,X,Y),
    write('^'), !.
printOneTile(X,Y) :-    % wasteland
    terrain(wasteland,X,Y),
    write('_'), !.
printOneTile(X,Y) :-    % river
    terrain(river,X,Y),
    write('~'), !.
printOneTile(X,Y) :-    % grassland
    terrain(grassland,X,Y),
    write('v'), !.
printOneTile(X,Y) :-    % desert
    terrain(desert,X,Y),
    write('.'), !.
printOneTile(X,Y) :-    % mountain
    terrain(mountain,X,Y),
    write('M'), !.
printOneTile(X,Y) :-    % lava
    terrain(lava,X,Y),
    write('!'), !.
printOneTile(_,_) :-    %inaccessible
    write('X').
/***********************************/